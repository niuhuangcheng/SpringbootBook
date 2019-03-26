package com.nhc.springboot.book.controller;

import com.nhc.springboot.book.pojo.Book;
import com.nhc.springboot.book.service.BookService;
import com.nhc.springboot.book.vo.BookVo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;


    @RequestMapping("/list")
    public String bookListPage() {
        return "/admin/products/list";
    }


    @ResponseBody
    @RequestMapping("/listData")
    public Map<String, Object> bookListData(@RequestParam(value = "page", defaultValue = "1") int page,
                                            @RequestParam(value = "rows", defaultValue = "5") int size,
                                            @RequestParam(value = "sort", defaultValue = "id") String sort,
                                            @RequestParam(value = "order", defaultValue = "asc") String order,
                                            @RequestParam Map<String, Object> searchContent) {
        System.err.println("searchContent=============="+searchContent);
        Map<String, Object> map = new HashMap<>();
        // 查询开始页
//        int from = (page - 1) * size;
        BookVo bookVo =new BookVo();
        bookVo.setPage(page);
        bookVo.setSize(size);
        bookVo.setOrder(order);
        bookVo.setSort(sort);

        searchContent.keySet().forEach(key -> {
            if (searchContent.get(key) != null && !StringUtils.isEmpty(String.valueOf(searchContent.get(key)))) {
                String valueStr = String.valueOf(searchContent.get(key)).replaceAll("'", "");
                if ("id".equals(key)){
                    bookVo.setId(Integer.parseInt(valueStr));
                }else if("category".equals(key)){
                    bookVo.setCategory(valueStr);
                }else if("name".equals(key)){
                    bookVo.setName(valueStr);
                }else if("minprice".equals(key)){
                    bookVo.setMinprice(Double.parseDouble(valueStr));
                }else if("maxprice".equals(key)){
                    bookVo.setMaxprice(Double.parseDouble(valueStr));
                }
            }
        });
        List<Book> list =  bookService.queryBookListPage(bookVo);
        map.put("total",bookService.bookListCount());
        map.put("rows", list);
        return map;
    }

    @RequestMapping("/add")
    public String shopAdd() {
        return "/admin/products/add";
    }

    /**
     *
     * @param imgPath
     * @param request
     * @param book
     * @return
     *
     * 备注：上传文件的name值千万不要和实体类对象接收上传文件的的属性字段一致。否则会报错Http 400 bad request.
     */
    @RequestMapping(value = "/saveBook")
    @ResponseBody
    public String saveBook(@RequestParam("imgPath") MultipartFile imgPath,
                           HttpServletRequest request, Book book, Model model) throws IOException {

        String uuid = UUID.randomUUID().toString().replace("-", "");
        book.setBookId(uuid);

        String imgUrl=   uploadFile(imgPath,book);
        book.setImgurl(imgUrl);

        int rowCount =  bookService.addBook(book);
        String result="";
        if (rowCount >  0){
            return "{\"code\":\"ok\"}";
        }else{
            //保存失败
            model.addAttribute("book",book);
            return "{\"code\":\"fail\",\"data\":"+book+"}";
        }
    }

    @RequestMapping("/edit")
    public String bookEdit(Integer id,Model model) {
       Book book =  bookService.queryBookById(id);
         model.addAttribute("book",book);
        return "/admin/products/edit";
    }
    @RequestMapping("/update")
    public String updateBook(@RequestParam("imgPath") MultipartFile imgPath, Book book, Model model) throws IOException {
        String imgUrl=   uploadFile(imgPath,book);
        book.setImgurl(imgUrl);
        int rowCount =  bookService.updateBook(book);
        if (rowCount >  0){
            return "redirect:list";
        }else{
            //保存失败
            model.addAttribute("update_error_msg","更新失败");
            model.addAttribute("book",book);
            return "/admin/products/edit";
        }
    }

    public String uploadFile(MultipartFile imgPath, Book book) throws IOException {
        String imgUrl="";
        if (!imgPath.isEmpty()){
            //图片修改了
            String fileName = FilenameUtils.getName(imgPath.getOriginalFilename());
            String fileDir ="/Users/niuhuangcheng/Documents/img";
            File dir = new File(fileDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            File upload_file = new File(fileDir +File.separator+ fileName);
            imgPath.transferTo(upload_file);
            String path= upload_file.getAbsolutePath();
            imgUrl = "http://localhost:8080/springboot_book/"+path.substring(path.lastIndexOf("/")+1);
        }else{
            //图片未修改
            Book book1 =  bookService.queryBookById(book.getId());
            imgUrl =book1.getImgurl();
        }
        return imgUrl;
    }


    @RequestMapping("/deleteItem")
    public String deleteItemBook(Integer id,Model model) {
        int rowCount  =  bookService.deleteBook(id);
        model.addAttribute("deleteResult",rowCount > 0 ? "删除成功":"删除失败");
        return "/admin/products/list";
    }

    @RequestMapping("/batchDelete")
    public String batchDeleteBooks(Integer[] ids,Model model) {
         bookService.batchDeleteBook(ids);
        return "/admin/products/list";
    }

//    @RequestMapping("/searchBooks")
//    @ResponseBody
//    public Map<String, Object> searchBooksByManyCondition(BookVo bookVo) {
//        System.err.println("==========");
//        Map<String, Object> map =new HashMap<>();
//        List<Book> bookList  = bookService.searchBooks(bookVo);
//        map.put("total",bookList);
//        map.put("rows", bookList.size());
//
//
//        System.err.println("=====bookList====="+bookList);
//        return map;
//    }
}
