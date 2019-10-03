package com.jmu.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jmu.domain.Exchange;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.mapper.ExchangeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DormExchServiceImpl implements DormExchService {
    @Autowired
    private ExchangeMapper exchangeMapper;
    @Override
    public PageListRes getAllExchInfo(QueryVo vo) {
        Page<Exchange> page = PageHelper.startPage(vo.getPage(), vo.getLimit());
        List<Exchange> students = exchangeMapper.selectAll();
        /*封装成pageList*/
        PageListRes pageListRes = new PageListRes();
        /*获取数据库总数据*/
        pageListRes.setCount(page.getTotal());
        /*封装查询数据*/
        pageListRes.setData(students);
        return pageListRes;
    }
}
