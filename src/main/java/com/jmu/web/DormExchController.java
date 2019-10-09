package com.jmu.web;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.Exchange;
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
        System.out.println("来到了条还控制层");
        PageListRes allScore = dormExchService.getAllExchInfo(vo);
        return allScore;
    }
    /*删除一条数据*/
    @RequestMapping("/deleteChange")
    @ResponseBody
    public AjaxRes deleteChange(Exchange exchange){
        System.out.println(exchange);
        AjaxRes ajaxRes = dormExchService.deleteChangeById(exchange.getExcId());
        return ajaxRes;
    }

    /*修改维修状态*/
    @RequestMapping("/updateChangeStatus")
    @ResponseBody
    public AjaxRes updateChangeStatus(Exchange exchange){
        System.out.println(exchange);
        System.out.println("去放");
        /*状态取反*/
        exchange.setState(!exchange.getState());
        AjaxRes ajaxRes = dormExchService.updateChangeStatus(exchange);
        System.out.println("去放2");
        return ajaxRes;
    }

}
