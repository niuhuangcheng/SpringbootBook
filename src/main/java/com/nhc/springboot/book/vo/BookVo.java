package com.nhc.springboot.book.vo;


import lombok.Data;

@Data
public class BookVo {

        /**
         *
         * This field was generated by MyBatis Generator.
         * This field corresponds to the database column book.id
         *
         * @mbg.generated
         */
        private Integer id;

        /**
         *
         * This field was generated by MyBatis Generator.
         * This field corresponds to the database column book.book_id
         *
         * @mbg.generated
         */
        private String bookId;

        /**
         *
         * This field was generated by MyBatis Generator.
         * This field corresponds to the database column book.name
         *
         * @mbg.generated
         */
        private String name;

        /**
         *
         * This field was generated by MyBatis Generator.
         * This field corresponds to the database column book.price
         *
         * @mbg.generated
         */
        private Double price;

        /**
         *
         * This field was generated by MyBatis Generator.
         * This field corresponds to the database column book.category
         *
         * @mbg.generated
         */
        private String category;

        /**
         *
         * This field was generated by MyBatis Generator.
         * This field corresponds to the database column book.pnum
         *
         * @mbg.generated
         */
        private Integer pnum;

        /**
         *
         * This field was generated by MyBatis Generator.
         * This field corresponds to the database column book.imgurl
         *
         * @mbg.generated
         */
        private String imgurl;

        /**
         *
         * This field was generated by MyBatis Generator.
         * This field corresponds to the database column book.description
         *
         * @mbg.generated
         */
        private String description;

        private Double maxprice;
        private Double minprice;


        private int  page;
        private int  size;

        private  String sort;
        private  String order;
    }
