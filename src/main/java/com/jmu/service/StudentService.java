package com.jmu.service;

import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.domain.Student;

import java.util.List;

public interface StudentService {

    public Student getStudentById(String stuId);

    public PageListRes getAllStudent(QueryVo vo);

    void delStudentById(String stuId);

    void updateStudent(Student student);

    void addStudent(Student student);
}
