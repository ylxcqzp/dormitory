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
    public String managerLogin(){
        System.out.println("重定向");
        return "redirect:/views/login/manager_login.jsp";
    }

}
