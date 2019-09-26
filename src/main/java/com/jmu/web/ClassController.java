package com.jmu.web;

import com.jmu.domain.Class;
import com.jmu.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ClassController {
    @Autowired
    private ClassService classService;
    @RequestMapping("/getClassList")
    @ResponseBody
    public List<Class> getClassList(){
        List<Class> allClasses = classService.getAllClasses();
        return allClasses;
    }
}
