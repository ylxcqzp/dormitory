package com.jmu.service;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.domain.Repaires;

public interface RepairedService {
    public PageListRes getRepairedList(QueryVo vo);

    AjaxRes deleteRepairById(Integer repairsId);

    AjaxRes updateRepairStatus(Repaires repaires);
}
