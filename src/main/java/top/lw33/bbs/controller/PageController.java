package top.lw33.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping("")
    public String index() {
        return "forward:/article/getArticles/1";
    }

    @RequestMapping("/index")
    public String index1() {

        return "forward:/article/getArticles/1";
    }

    @RequestMapping("/edit")
    public String edit() {
        return "edit";
    }
}
