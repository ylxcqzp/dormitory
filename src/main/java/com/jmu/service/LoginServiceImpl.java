package com.jmu.service;

import com.jmu.domain.Manager;
import com.jmu.mapper.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
    @Autowired
    private ManagerMapper managerMapper;
    @Override
    public Manager getManagerById(String id) {
        Manager manager = managerMapper.selectByPrimaryKey(id);
        return manager;
    }
}
