package com.example.demo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

    private static final Log logger = LogFactory.getLog(HelloController.class);

    @RequestMapping("/hello.htm")
    public @ResponseBody String hello() {
        logger.error("XXX" + System.currentTimeMillis());
        return "hello jianran cc";
    }
}
