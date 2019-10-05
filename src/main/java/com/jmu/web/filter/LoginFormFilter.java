package com.jmu.web.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jmu.domain.AjaxRes;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

public class LoginFormFilter extends FormAuthenticationFilter {
    /*认证成功时调用*/
    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
        System.out.println("认证成功");
        /*响应浏览器*/
        /*设置响应编码*/
        response.setCharacterEncoding("utf-8");

        AjaxRes ajaxRes = new AjaxRes();
        ajaxRes.setSuccess(true);
        ajaxRes.setMsg("登录成功");

        /*将数据转成json字符串*/
        String jsonString = new ObjectMapper().writeValueAsString(ajaxRes);
        response.getWriter().print(jsonString);
        return false;
    }

    /*认证失败时调用*/
    @Override
    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request, ServletResponse response) {
        System.out.println("认证失败");

        /*响应浏览器*/
        AjaxRes ajaxRes = new AjaxRes();
        ajaxRes.setSuccess(false);

        if(e!=null){
            /*获取异常的名称*/
            String name = e.getClass().getName();
            if(name.equals(UnknownAccountException.class.getName())){
                ajaxRes.setMsg("账号不正确");
            }else if(name.equals(IncorrectCredentialsException.class.getName())){
                ajaxRes.setMsg("密码错误");
            }else {
                ajaxRes.setMsg("未知错误");
            }
        }
        /*将数据转成json字符串*/

        try {
            /*设置响应编码*/
            response.setCharacterEncoding("utf-8");
            String jsonString = new ObjectMapper().writeValueAsString(ajaxRes);
            response.getWriter().print(jsonString);
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    /*重复登入设置*/
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        if(isLoginRequest(request, response) && isLoginSubmission(request, response)){
            return false;
        }
        return super.isAccessAllowed(request, response, mappedValue);
    }
}
