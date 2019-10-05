package com.jmu.service;

import com.jmu.domain.Manager;
import org.springframework.stereotype.Service;

import java.util.List;

public interface LoginService {
    public Manager getManagerById(String id);

    List<String> getPermissionsByRid(Integer roleId);
}
