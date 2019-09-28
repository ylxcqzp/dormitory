package com.jmu.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jmu.domain.AjaxRes;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.domain.Repaires;
import com.jmu.mapper.RepairesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RepairedServiceImpl implements RepairedService {
    @Autowired
    private RepairesMapper repairesMapper;

    @Override
    public PageListRes getRepairedList(QueryVo vo) {
        /*分页设置*/
        Page<Repaires> page = PageHelper.startPage(vo.getPage(), vo.getLimit());
        /*查找数据*/
        List<Repaires> repaires = repairesMapper.selectAll();
        /*封装到pageListRes*/
        PageListRes pageListRes = new PageListRes();
        pageListRes.setCount(page.getTotal());
        pageListRes.setCode(0);
        pageListRes.setData(repaires);
        return pageListRes;
    }

    @Override
    public AjaxRes deleteRepairById(Integer repairsId) {
        AjaxRes ajaxRes = new AjaxRes();
        try {
            repairesMapper.deleteByPrimaryKey(repairsId);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("删除成功");
        }catch (Exception e){
            e.printStackTrace();
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("删除失败");
        }
        return ajaxRes;
    }

    @Override
    public AjaxRes updateRepairStatus(Repaires repaires) {
        AjaxRes ajaxRes = new AjaxRes();
        try {
            repairesMapper.updateRepairStatus(repaires);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("状态已修改");
        }catch (Exception e){
            e.printStackTrace();
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("修改状态失败");
        }
        return ajaxRes;
    }
}
