package com.jmu.service;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.Exchange;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;

public interface DormExchService {
    public PageListRes getAllExchInfo(QueryVo vo);

    AjaxRes deleteChangeById(Integer excId);

    AjaxRes updateChangeStatus(Exchange exchange);
}
