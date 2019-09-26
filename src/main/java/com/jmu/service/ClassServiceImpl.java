package com.jmu.service;

import com.jmu.domain.Class;
import com.jmu.mapper.ClassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassMapper classMapper;
    @Override
    public List<Class> getAllClasses() {
        List<Class> classes = classMapper.selectAll();
        return classes;
    }
}
