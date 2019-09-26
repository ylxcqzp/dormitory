package com.jmu.mapper;

import com.jmu.domain.QueryVo;
import com.jmu.domain.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    int insert(Student record);

    List<Student> selectAll(QueryVo vo);

    int deleteByPrimaryKey(@Param("stuId") String stuId);

    void updateByPrimaryKey(Student student);
}