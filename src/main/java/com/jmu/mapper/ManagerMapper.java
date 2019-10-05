package com.jmu.mapper;

import com.jmu.domain.Manager;
import java.util.List;

public interface ManagerMapper {
    int deleteByPrimaryKey(String managerId);

    int insert(Manager record);

    Manager selectByPrimaryKey(String managerId);

    List<Manager> selectAll();

    int updateByPrimaryKey(Manager record);

    int resetManagerPas(String managerId);

    void updateManagerRid(Manager manager);
}