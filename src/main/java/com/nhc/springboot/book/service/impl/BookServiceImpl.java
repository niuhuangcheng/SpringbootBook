package com.nhc.springboot.book.service.impl;

import com.github.pagehelper.PageHelper;
import com.nhc.springboot.book.dao.BookVoMapper;
import com.nhc.springboot.book.vo.BookVo;
import com.nhc.springboot.book.dao.BookMapper;
import com.nhc.springboot.book.pojo.Book;
import com.nhc.springboot.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {


    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private BookVoMapper bookVoMapper;

    @Override
    public int addBook(Book book) {
        return bookMapper.insert(book);
    }

    @Override
    public List<Book> queryBookList() {
        return bookMapper.selectAll();
    }

    @Override
    public List<Book> queryBookListPage(BookVo bookVo) {
        PageHelper.startPage(bookVo.getPage(),bookVo.getSize(),true);
        return bookVoMapper.searchBooks(bookVo);
    }

    @Override
    public Integer bookListCount() {
        return bookMapper.queryTotalCount();
    }

    @Override
    public Book queryBookById(Integer id) {
        return bookMapper.selectById(id);
    }

    @Override
    public int updateBook(Book book) {
        return bookMapper.updateByPrimaryKey(book);
    }

    @Override
    public int deleteBook(Integer id) {
        return bookMapper.deleteById(id);
    }

    @Override
    public void batchDeleteBook(Integer[] ids) {
        bookMapper.batchDeleteBook(Arrays.asList(ids));
    }

    @Override
    public List<Book> queryBooksByPage(BookVo bookVo) {
        return bookVoMapper.queryAllBookByPage(bookVo);
    }

//    @Override
//    public List<Book> searchBooks(BookVo bookVo) {
//        return null;
//    }
}
