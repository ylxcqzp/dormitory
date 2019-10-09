package com.jmu.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jmu.domain.AjaxRes;
import com.jmu.domain.LeaveInfo;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.mapper.LeaveInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class LeaveInfoServiceImpl implements LeaveInfoService {
    @Autowired
    private LeaveInfoMapper leaveInfoMapper;
    @Override
    public PageListRes getLeaveInfoList(QueryVo vo) {
        Page<LeaveInfo> page = PageHelper.startPage(vo.getPage(), vo.getLimit());
        List<LeaveInfo> leaveInfos = leaveInfoMapper.selectAll();
        PageListRes pageListRes = new PageListRes();
        pageListRes.setCode(0);
        pageListRes.setCount(page.getTotal());
        pageListRes.setData(leaveInfos);
        return pageListRes;
    }

    @Override
    public AjaxRes updateState(LeaveInfo leaveInfo) {
        AjaxRes ajaxRes = new AjaxRes();
        try {
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("状态已更改");
            leaveInfoMapper.updateState(leaveInfo);
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("更改失败");
            e.printStackTrace();
        }

        return ajaxRes;
    }

    @Override
    public AjaxRes deleteLeaveInfById(Integer leaveId) {
        AjaxRes ajaxRes = new AjaxRes();
        try {
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("删除成功");
            leaveInfoMapper.deleteByPrimaryKey(leaveId);
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("删除失败");
            e.printStackTrace();
        }
        return ajaxRes;
    }
}
