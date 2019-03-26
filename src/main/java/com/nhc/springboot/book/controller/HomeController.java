package com.nhc.springboot.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String toHomePage(){
        return "admin/home/main";
    }

    @RequestMapping("/top")
    public String toTopPage(){
        return "admin/home/top";
    }

    @RequestMapping("/left")
    public String toLeftPage(){
        return "admin/home/left";
    }

    @RequestMapping("/content")
    public String toContentPage(){
        return "admin/home/welcome";
    }
    @RequestMapping("/bottom")
    public String toBottomPage(){
        return "admin/home/bottom";
    }
}
