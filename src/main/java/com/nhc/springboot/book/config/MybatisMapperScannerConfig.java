//package com.nhc.springboot.book.config;
//
//
//import org.springframework.boot.autoconfigure.AutoConfigureAfter;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import tk.mybatis.mapper.common.Mapper;
//import tk.mybatis.mapper.common.MySqlMapper;
//import tk.mybatis.spring.mapper.MapperScannerConfigurer;
//
//import java.util.Properties;
//
//@Configuration
//@AutoConfigureAfter(MybatisConfig.class)
//public class MybatisMapperScannerConfig {
//    private String basePackage = "com.nhc.springboot.book.dao";
//
//    @Bean
//    public MapperScannerConfigurer mapperScannerConfigurer(){
//
//        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
//        mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
//        mapperScannerConfigurer.setBasePackage(basePackage);
//
//        Properties properties = new Properties();
//        System.err.println(Mapper.class.getName()+","+ MySqlMapper.class.getName());
//
//        properties.setProperty("mappers",Mapper.class.getName());
//        properties.setProperty("notEmpty","false");
//        properties.setProperty("IDENTITY","MYSQL");
//        mapperScannerConfigurer.setProperties(properties);
//        return mapperScannerConfigurer;
//
//    }
//
//
//
//
//}
