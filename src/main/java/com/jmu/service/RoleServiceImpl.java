package com.jmu.service;

import com.jmu.domain.Role;
import com.jmu.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public List<Role> getRoleList() {
        List<Role> roles = roleMapper.selectAll();
        return roles;
    }
}
