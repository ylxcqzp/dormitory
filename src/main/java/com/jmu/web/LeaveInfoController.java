package com.jmu.web;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.LeaveInfo;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.service.LeaveInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/dormManager")
public class LeaveInfoController {
    @Autowired
    private LeaveInfoService leaveInfoService;

    @RequestMapping("/leaveInfo")
    public String leaveInfo(){
        return "/part/leaveInfo";
    }

    @RequestMapping("/getLeaveInfo")
    @ResponseBody
    public PageListRes getLeaveInfo(QueryVo vo){
        PageListRes leaveInfoList = leaveInfoService.getLeaveInfoList(vo);
        return leaveInfoList;
    }

    @RequestMapping("/agreePermission")
    @ResponseBody
    public AjaxRes agreePermission(LeaveInfo leaveInfo){
        AjaxRes ajaxRes = leaveInfoService.updateState(leaveInfo);
        return ajaxRes;
    }

    @RequestMapping("/deleteLeave")
    @ResponseBody
    public AjaxRes deleteLeave(LeaveInfo leaveInfo){
        AjaxRes ajaxRes = leaveInfoService.deleteLeaveInfById(leaveInfo.getLeaveId());
        return ajaxRes;
    }
}
