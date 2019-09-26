package com.jmu.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.domain.Student;
import com.jmu.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public PageListRes getAllStudent(QueryVo vo) {
        Page<Student> page = PageHelper.startPage(vo.getPage(), vo.getLimit());
        List<Student> students = studentMapper.selectAll(vo);
        /*封装成pageList*/
        PageListRes pageListRes = new PageListRes();
        /*获取数据库总数据*/
        pageListRes.setCount(page.getTotal());
        /*封装查询数据*/
        pageListRes.setData(students);
        return pageListRes;
    }

    @Override
    public void delStudentById(String stuId) {
        studentMapper.deleteByPrimaryKey(stuId);
    }

    @Override
    public void updateStudent(Student student) {
        studentMapper.updateByPrimaryKey(student);
    }

    @Override
    public void addStudent(Student student) {
        studentMapper.insert(student);
    }
}
