package com.jmu.service;

import com.jmu.domain.Manager;
import org.springframework.stereotype.Service;

public interface LoginService {
    public Manager getManagerById(String id);
}
