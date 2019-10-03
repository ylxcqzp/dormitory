package com.jmu.web;

import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.service.ScoreService;
import com.jmu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/dormManager")
public class ScoreController {
    @Autowired
    private ScoreService scoreService;
    @RequestMapping("/score")
    public String score(){
        return "/part/score";
    }

    @RequestMapping("/scoreInfo")
    @ResponseBody
    public PageListRes scoreInfo(QueryVo vo){
        System.out.println(vo);
        System.out.println("来到了控制层");
        PageListRes allScore = scoreService.getAllScore(vo);
        return allScore;
    }
}
