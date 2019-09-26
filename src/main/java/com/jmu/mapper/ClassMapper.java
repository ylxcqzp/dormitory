package com.jmu.mapper;

import com.jmu.domain.Class;
import java.util.List;

public interface ClassMapper {
    int deleteByPrimaryKey(Integer classId);

    int insert(Class record);

    Class selectByPrimaryKey(Integer classId);

    List<Class> selectAll();

    int updateByPrimaryKey(Class record);
}