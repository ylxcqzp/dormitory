package com.jmu.service;

import com.jmu.domain.Manager;
import com.jmu.mapper.ManagerMapper;
import com.jmu.mapper.PermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
    @Autowired
    private ManagerMapper managerMapper;
    @Autowired
    private PermissionMapper permissionMapper;
    @Override
    public Manager getManagerById(String id) {
        Manager manager = managerMapper.selectByPrimaryKey(id);
        return manager;
    }

    @Override
    public List<String> getPermissionsByRid(Integer roleId) {
        List<String> permissions = permissionMapper.selectHrefByRid(roleId);
        for (String permission : permissions) {
            System.out.println(permission);
        }
        return permissions;
    }
}
