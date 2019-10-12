package com.jmu.service;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.LeaveInfo;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;

public interface LeaveInfoService {

    /*获取离校信息列表 分页*/
    public PageListRes getLeaveInfoList(QueryVo vo);

    AjaxRes updateState(LeaveInfo leaveInfo);

    AjaxRes deleteLeaveInfById(Integer leaveId);

    AjaxRes insert(LeaveInfo leaveInfo);
}
