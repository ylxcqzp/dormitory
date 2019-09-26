package com.jmu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/dormManager")
public class ScoreController {

    @RequestMapping("/score")
    public String score(){
        return "/part/score";
    }
}
