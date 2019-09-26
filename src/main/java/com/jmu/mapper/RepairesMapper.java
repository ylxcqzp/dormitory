package com.jmu.mapper;

import com.jmu.domain.Repaires;
import java.util.List;

public interface RepairesMapper {
    int deleteByPrimaryKey(Integer repairsId);

    int insert(Repaires record);

    Repaires selectByPrimaryKey(Integer repairsId);

    List<Repaires> selectAll();

    int updateByPrimaryKey(Repaires record);
}