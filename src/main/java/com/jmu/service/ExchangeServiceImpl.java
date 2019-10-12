package com.jmu.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jmu.domain.*;
import com.jmu.mapper.DromMapper;
import com.jmu.mapper.ExchangeMapper;
import com.jmu.mapper.RoomMapper;
import com.jmu.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ExchangeServiceImpl implements ExchangeService {
    @Autowired
    private DromMapper dromMapper;
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

    @Override
    public List<Drom> getDormList(String sex) {
        List<Drom> droms = dromMapper.selectBySex(sex);
        for (Drom drom : droms) {
            System.out.println(drom);
        }
        return droms;
    }

    @Override
    public List<Room> getRoomList() {
        List<Room> rooms = roomMapper.selectAll();
        return rooms;
    }

    @Override
    public AjaxRes insert(Exchange exchange) {
        AjaxRes ajaxRes = new AjaxRes();
        String targetDrom = exchange.getTargetDrom();
        String targetRoom = exchange.getTargetRoom();
        Room room = roomMapper.selectByRidAndDid(targetRoom,targetDrom);
        int use = roomMapper.getRoomUseByRid(targetRoom);
        if(room == null){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("该房间未启用，请重新选择");
            return ajaxRes;
        }
        if (use >= 6){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("该房间人员已满");
            return ajaxRes;
        }
        try {
            exchangeMapper.insert(exchange);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("提交成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("提交失败");
            e.printStackTrace();
        }

        return ajaxRes;
    }
}
