package com.jmu.web;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.Manager;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.service.ManagerService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/stu_dorm_lib")
public class ManagerController {
    @Autowired
    private ManagerService managerService;

    /*跳转人员管理页面*/
    @RequestMapping("/manager")
    @RequiresPermissions("manager:index")
    public String manager(){
        return "/part/manager";
    }

    /*获取管理员列表：分页查询*/

    @RequestMapping("/managerList")
    @ResponseBody
    public PageListRes managerList(QueryVo vo){
        System.out.println(vo);
        PageListRes managerList = managerService.getManagerList(vo);
        return managerList;
    }

    @RequestMapping("/managerPasReset")
    @ResponseBody
    public AjaxRes managerPasReset(String managerId){
        System.out.println(managerId);
        AjaxRes ajaxRes = managerService.resetManagerPas(managerId);
        return ajaxRes;
    }

    @RequestMapping("/managerDel")
    @ResponseBody
    public AjaxRes managerDel(Manager manager){
        System.out.println(manager);
        AjaxRes ajaxRes = managerService.delManagerById(manager);
        return ajaxRes;
    }

    @RequestMapping("/managerAdd")
    @ResponseBody
    public AjaxRes managerAdd(Manager manager){
        manager.setPassword("123456");
        System.out.println(manager);

        AjaxRes ajaxRes = managerService.addManager(manager);
        return ajaxRes;
    }

    /*更新用户所属角色*/
    @RequestMapping("/updateManagerRole")
    @ResponseBody
    public AjaxRes updateManagerRole(Manager manager){
        System.out.println(manager);
        AjaxRes ajaxRes = managerService.updateManagerRoleId(manager);
        return ajaxRes;
    }

}
