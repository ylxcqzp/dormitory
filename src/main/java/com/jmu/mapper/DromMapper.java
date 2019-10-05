package com.jmu.mapper;

import com.jmu.domain.Drom;
import java.util.List;

public interface DromMapper {
    int deleteByPrimaryKey(String dromId);

    int insert(Drom record);

    Drom selectByPrimaryKey(String dromId);

    List<Drom> selectAll();

    int updateByPrimaryKey(Drom record);

    int updateAdminId(String managerId);
}