package com.jmu.service;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.Manager;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;

public interface ManagerService {
    /*查询管理员列表*/
    public PageListRes getManagerList(QueryVo vo);

    /*重置密码*/
    AjaxRes resetManagerPas(String managerId);

    /*删除用户*/
    AjaxRes delManagerById(Manager manager);

    AjaxRes addManager(Manager manager);

    AjaxRes updateManagerRoleId(Manager manager);
}
