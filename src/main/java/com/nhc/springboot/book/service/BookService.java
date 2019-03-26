package com.nhc.springboot.book.service;

import com.nhc.springboot.book.vo.BookVo;
import com.nhc.springboot.book.pojo.Book;

import java.util.List;

public interface  BookService {
    public int  addBook(Book book) ;

    public List<Book> queryBookList();

    public List<Book> queryBookListPage(BookVo bookVo);

    public Integer bookListCount();

    public Book queryBookById(Integer id) ;

    public int updateBook(Book book);


    public int deleteBook(Integer id);

    public void batchDeleteBook (Integer[] ids);

    public List<Book> queryBooksByPage(BookVo bookVo);

//    public List<Book> searchBooks(BookVo bookVo);
}