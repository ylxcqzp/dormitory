package com.jmu.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jmu.domain.AjaxRes;
import com.jmu.domain.Manager;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.mapper.DromMapper;
import com.jmu.mapper.ExchangeMapper;
import com.jmu.mapper.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerMapper managerMapper;
    @Autowired
    private DromMapper dromMapper;
    @Autowired
    private ExchangeMapper exchangeMapper;
    @Override
    public PageListRes getManagerList(QueryVo vo) {
        /*分页查询*/
        Page<Manager> page = PageHelper.startPage(vo.getPage(), vo.getLimit());
        /*查询manager*/
        List<Manager> managers = managerMapper.selectAll();
        /*封装成pageListRes*/
        PageListRes pageListRes = new PageListRes();
        pageListRes.setData(managers);
        /*设置状态码*/
        pageListRes.setCode(0);
        pageListRes.setCount(page.getTotal());
        return pageListRes;
    }

    @Override
    public AjaxRes resetManagerPas(String managerId) {
        AjaxRes ajaxRes = new AjaxRes();
        try {
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("重置成功");
            managerMapper.resetManagerPas(managerId);
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("重置失败");
            e.printStackTrace();
        }
        return ajaxRes;
    }

    @Override
    public AjaxRes delManagerById(Manager manager) {
        AjaxRes ajaxRes = new AjaxRes();
        if(manager.getRole().getRoleId() == 1){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("无法删除超级管理员用户");
            return ajaxRes;
        }
        try {
            exchangeMapper.updateHandleId(manager.getManagerId());
            dromMapper.updateAdminId(manager.getManagerId());
            managerMapper.deleteByPrimaryKey(manager.getManagerId());
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("删除成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("删除失败");
            e.printStackTrace();
        }
        return ajaxRes;
    }

    @Override
    public AjaxRes updateManagerRoleId(Manager manager) {
        AjaxRes ajaxRes = new AjaxRes();
        try {
            managerMapper.updateManagerRid(manager);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("修改完成");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("错误");
            e.printStackTrace();
        }
        return ajaxRes;
    }

    @Override
    public AjaxRes addManager(Manager manager) {
        AjaxRes ajaxRes = new AjaxRes();
        try {
            managerMapper.insert(manager);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("添加成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("添加失败");
            e.printStackTrace();
        }
        return ajaxRes;
    }
}
