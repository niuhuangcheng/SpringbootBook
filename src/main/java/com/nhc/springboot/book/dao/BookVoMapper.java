package com.nhc.springboot.book.dao;

import com.nhc.springboot.book.pojo.Book;
import com.nhc.springboot.book.vo.BookVo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


public interface BookVoMapper extends Mapper<BookVo> {

    public List<Book> queryAllBookByPage(BookVo bookVo);

    public List<Book> searchBooks(BookVo bookVo);
}
