package com.jmu.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageRowBounds;
import com.jmu.domain.*;
import com.jmu.mapper.ExchangeMapper;
import com.jmu.mapper.RoomMapper;
import com.jmu.mapper.StudentMapper;
import net.sf.ehcache.transaction.xa.EhcacheXAException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ExchangeServiceImpl implements ExchangeService {
    @Autowired
    private RoomMapper roomMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ExchangeMapper exchangeMapper;
    @Override
    public PageListRes getExchangeList(QueryVo vo) {
        Page<Exchange> page = PageHelper.startPage(vo.getPage(), vo.getLimit());
        List<Exchange> exchanges = exchangeMapper.selectAll();
        /*封装pageListRes*/
        PageListRes pageListRes = new PageListRes();
        pageListRes.setCode(0);
        pageListRes.setData(exchanges);
        pageListRes.setCount(page.getTotal());
        return pageListRes;
    }

    @Override
    public AjaxRes denyOption(Exchange exchange) {
        AjaxRes ajaxRes = new AjaxRes();
        try {
            exchangeMapper.updateState(exchange);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("修改成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("修改失败");
            e.printStackTrace();
        }
        return ajaxRes;
    }

    /*同意调换宿舍操作*/
    @Override
    public AjaxRes agreeOption(Exchange exchange) {
        String stuId = exchange.getStudent().getStuId();
        String dorm = exchange.getTargetDrom();
        String room = exchange.getTargetRoom();
        AjaxRes ajaxRes = new AjaxRes();
        String roomId = studentMapper.getRoomById(stuId);
        try {
            studentMapper.updateDormAndRoom(stuId,dorm,room);
            roomMapper.addRoomUse(room);
            roomMapper.subRoomUse(roomId);
            exchangeMapper.updateState(exchange);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("修改成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("修改失败");
            e.printStackTrace();
        }

        return ajaxRes;
    }
}
