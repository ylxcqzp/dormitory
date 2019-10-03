package com.jmu.web;

import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.service.DormExchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/dormExchange")
public class DormExchController {
    @Autowired
    private DormExchService dormExchService;
    @RequestMapping("/showAllChange")
    public String score(){
        return "/part/dormExch";
    }

    @RequestMapping("/changeInfo")
    @ResponseBody
    public PageListRes scoreInfo(QueryVo vo){
        System.out.println(vo);
        System.out.println("来到了控制层");
        PageListRes allScore = dormExchService.getAllExchInfo(vo);
        return allScore;
    }
}
