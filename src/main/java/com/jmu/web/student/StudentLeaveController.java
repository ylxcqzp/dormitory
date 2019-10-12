package com.jmu.web.student;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.LeaveInfo;
import com.jmu.domain.Student;
import com.jmu.service.LeaveInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/student")
public class StudentLeaveController {
    @Autowired
    private LeaveInfoService leaveInfoService;

    @RequestMapping("/leaveSubmit")
    @ResponseBody
    public AjaxRes leaveSubmit(LeaveInfo leaveInfo,String stuId){
        Student student = new Student();
        student.setStuId(stuId);
        leaveInfo.setStudent(student);
        System.out.println(leaveInfo);

        AjaxRes ajaxRes = leaveInfoService.insert(leaveInfo);


        /*AjaxRes ajaxRes = new AjaxRes();
        ajaxRes.setSuccess(true);
        ajaxRes.setMsg("ggggg");*/
        return ajaxRes;
    }
}
