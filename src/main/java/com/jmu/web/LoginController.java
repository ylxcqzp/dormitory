package com.jmu.web;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.Manager;
import com.jmu.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;

    @RequestMapping("/managerLogin")
    @ResponseBody
    public AjaxRes managerLogin(Manager manager){
        System.out.println(manager);
        AjaxRes ajaxRes = new AjaxRes();
        String password = manager.getPassword();
        Manager result = loginService.getManagerById(manager.getManagerId());
        System.out.println(result);
        if(result != null&&password.equals(result.getPassword())){
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("登入成功");
            System.out.println("密码正确，登入成功");
        }else {
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("账号或密码错误");
            System.out.println("账号或密码错误");
        }
        return ajaxRes;
    }
}
