package com.jmu.web;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.Student;
import com.jmu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/student")
public class StudentLoginController {
    @Autowired
    private StudentService studentService;

    @RequestMapping("/studentLogin")
    @ResponseBody
    public AjaxRes studentLogin(Student student) {
        System.out.println(student);
        AjaxRes ajaxRes = new AjaxRes();
        Student studentResult = studentService.getStudentById(student.getStuId());
        System.out.println(studentResult);
        if (studentResult == null) {
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("账号或密码错误");
            return ajaxRes;
        }
        if (studentResult.getPassword().equals(student.getPassword())) {
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("登陆成功");
        } else {
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("账号或密码错误");
        }
        return ajaxRes;
    }
}
