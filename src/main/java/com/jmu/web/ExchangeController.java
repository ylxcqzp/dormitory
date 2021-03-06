package com.jmu.web;

import com.jmu.domain.*;
import com.jmu.service.ExchangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dormManager")
public class ExchangeController {
    @Autowired
    private ExchangeService exchangeService;
    @RequestMapping("/exchange")
    public String exchange(){
        return "/part/exchange";
    }

    @RequestMapping("/exchangeInfo")
    @ResponseBody
    public PageListRes exchangeInfo(QueryVo vo){
        PageListRes exchangeList = exchangeService.getExchangeList(vo);
        return exchangeList;
    }

    @RequestMapping("/exchangeOption")
    @ResponseBody
    public AjaxRes exchangeOption(Exchange exchange){
        System.out.println(exchange);
        AjaxRes ajaxRes;
        if(exchange.getState()==false){
            ajaxRes = exchangeService.denyOption(exchange);
        }else {
            ajaxRes = exchangeService.agreeOption(exchange);
        }
        return ajaxRes;
    }



}
