package com.jmu.service;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.Exchange;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;

public interface ExchangeService {

    PageListRes getExchangeList(QueryVo vo);

    AjaxRes denyOption(Exchange exchange);

    AjaxRes agreeOption(Exchange exchange);
}
