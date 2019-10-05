package com.jmu.web;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.domain.Student;
import com.jmu.service.StudentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/stu_dorm_lib")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @RequiresPermissions("student:index")
    @RequestMapping("/student")
    public String student(){
        return "/part/student";
    }

    /*查询学生信息*/
    @RequestMapping("/studentInfo")
    @ResponseBody
    public PageListRes studentInfo(QueryVo vo){
        System.out.println(vo);
        System.out.println("来到了控制层");
        PageListRes allStudent = studentService.getAllStudent(vo);
        return allStudent;
    }

    /*编辑学生信息*/
    @RequestMapping("/stuEdit")
    @ResponseBody
    public AjaxRes stuEdit(Student student){
        System.out.println(student);
        AjaxRes ajaxRes = new AjaxRes();
        try{
            studentService.updateStudent(student);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("修改成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("修改失败");
            e.printStackTrace();
        }
        return ajaxRes;
    }

    /*添加学生*/
    @RequestMapping("/stuAdd")
    @ResponseBody
    public AjaxRes stuAdd(Student student){
        student.setPassword("123456");
        System.out.println("添加");
        System.out.println(student);
        AjaxRes ajaxRes = new AjaxRes();
        try{
            studentService.addStudent(student);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("添加成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("添加失败");
            e.printStackTrace();
        }
        return ajaxRes;
    }


    /*删除学生信息   根据学号*/
    @RequestMapping("/stuDel")
    @ResponseBody
    public AjaxRes stuDel(Student student){
        System.out.println(student);
        AjaxRes ajaxRes = new AjaxRes();
        try{
            studentService.delStudentById(student.getStuId());
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("删除成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("删除失败");
        }
        return ajaxRes;
    }


}
