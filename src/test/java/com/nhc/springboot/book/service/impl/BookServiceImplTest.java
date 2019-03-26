package com.nhc.springboot.book.service.impl;

import com.nhc.springboot.book.pojo.Book;
import com.nhc.springboot.book.service.BookService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import javax.xml.ws.Service;

import java.util.List;

import static org.junit.Assert.*;

@SpringBootTest
@RunWith(SpringRunner.class)
@Configuration
@MapperScan(basePackages = "com.nhc.springboot.book.dao")
@TestPropertySource(locations = "classpath:test.properties")
public class BookServiceImplTest {

    @Autowired
    BookServiceImpl bookService;

    @Test
    public void addBook() throws Exception {
    }

    @Test
    public void queryBookList() throws Exception {
        List<Book> bookList = bookService.queryBookList();
        System.out.println(bookList);
    }

    @Test
    public void queryBookListPage() throws Exception {
    }

    @Test
    public void bookListCount() throws Exception {
    }

    @Test
    public void queryBookById() throws Exception {
    }

    @Test
    public void updateBook() throws Exception {
    }

    @Test
    public void deleteBook() throws Exception {
    }

    @Test
    public void batchDeleteBook() throws Exception {
    }

    @Test
    public void queryBooksByPage() throws Exception {
    }

}