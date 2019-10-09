package com.jmu.mapper;

import com.jmu.domain.LeaveInfo;
import java.util.List;

public interface LeaveInfoMapper {
    int deleteByPrimaryKey(Integer leaveId);

    int insert(LeaveInfo record);

    LeaveInfo selectByPrimaryKey(Integer leaveId);

    List<LeaveInfo> selectAll();

    int updateByPrimaryKey(LeaveInfo record);

    int updateState(LeaveInfo leaveInfo);
}