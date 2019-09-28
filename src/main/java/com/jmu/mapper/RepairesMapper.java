package com.jmu.mapper;

import com.jmu.domain.Repaires;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RepairesMapper {
    int deleteByPrimaryKey(Integer repairsId);

    int insert(Repaires record);

    Repaires selectByPrimaryKey(@Param("repairsId") Integer repairsId);

    List<Repaires> selectAll();

    int updateByPrimaryKey(Repaires record);

    int updateRepairStatus(Repaires repaires);
}