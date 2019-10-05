package com.jmu.web.exception;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jmu.domain.AjaxRes;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@ControllerAdvice
public class ExceptionController {
    @ExceptionHandler(AuthorizationException.class)
    public void handleShiroException(HandlerMethod method, HttpServletRequest request, HttpServletResponse response) throws Exception {/*判断方法上面是否有特定注解*/
        System.out.println("异常处理");
        /*跳转到提示页面*/
        /*判断当前请求是否ajax为请求：是则返回json数据给浏览器，让前端处理跳转*/
        /*获取方法上面的注释*/
        ResponseBody methodAnnotation = method.getMethodAnnotation(ResponseBody.class);
        if(methodAnnotation!=null){
            AjaxRes ajaxRes = new AjaxRes();
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("无权操作");
            String s = new ObjectMapper().writeValueAsString(ajaxRes);
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(s);
        }else {
            /*response.sendRedirect("permissionError.jsp");*/
            String path="/views/error/permissionError.html";
            request.getRequestDispatcher(path).forward(request, response);
        }
    }
}
