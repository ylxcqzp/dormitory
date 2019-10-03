package com.jmu.service;

import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;

public interface DormExchService {
    public PageListRes getAllExchInfo(QueryVo vo);
}
