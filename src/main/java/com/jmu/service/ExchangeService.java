package com.jmu.service;

import com.jmu.domain.*;

import java.util.List;

public interface ExchangeService {

    PageListRes getExchangeList(QueryVo vo);

    AjaxRes denyOption(Exchange exchange);

    AjaxRes agreeOption(Exchange exchange);

    List<Drom> getDormList(String sex);

    List<Room> getRoomList();

    AjaxRes insert(Exchange exchange);
}
