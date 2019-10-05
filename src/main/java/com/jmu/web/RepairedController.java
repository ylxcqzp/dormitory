package com.jmu.web;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.domain.Repaires;
import com.jmu.service.RepairedService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
public class RepairedController {
    @Autowired
    private RepairedService repairedService;
    /*跳转到报修页面*/
    @RequestMapping("/repaired")
    @RequiresPermissions("repaire:index")
    public String repaired(){
        return "/part/repaired";
    }

    @RequestMapping("/repairedInfo")
    @ResponseBody
    public PageListRes repairedInfo(QueryVo vo){
        System.out.println(vo);
        PageListRes repairedList = repairedService.getRepairedList(vo);
        return  repairedList;
    }


    /*删除一条数据*/
    @RequestMapping("/deleteRepaired")
    @ResponseBody
    public AjaxRes deleteRepaired(Repaires repaires){
        System.out.println(repaires);
        AjaxRes ajaxRes = repairedService.deleteRepairById(repaires.getRepairsId());
        return ajaxRes;
    }

    /*修改维修状态*/
    @RequestMapping("/updateRepairStatus")
    @ResponseBody
    public AjaxRes updateRepairStatus(Repaires repaires){
        System.out.println(repaires);
        /*状态取反*/
        repaires.setIsfixed(!repaires.getIsfixed());
        repaires.setFixtime(new Date());
        AjaxRes ajaxRes = repairedService.updateRepairStatus(repaires);
        return ajaxRes;
    }
}
