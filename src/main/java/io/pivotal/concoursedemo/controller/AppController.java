package io.pivotal.concoursedemo.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by bliang on 2/19/17.
 */
@Controller
public class AppController {
    @Value("${concourseRestfulUrl}")
    private String concourseRestfulUrl;

    @Value("${webBgColor}")
    private String webBgColor;

    Logger logger = Logger.getLogger(AppController.class);
    @RequestMapping(value = "/")
    public String home(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.printf("hello");
        request.getSession().setAttribute("concourseRestfulUrl",concourseRestfulUrl);
        request.getSession().setAttribute("webBgColor",webBgColor);
        logger.info("webBgColor is ["+webBgColor+"]");
        logger.info("concourseRestfulUrl is ["+concourseRestfulUrl+"]");
        System.out.printf("come");
        return "home";
    }
}
