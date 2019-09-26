package com.jmu.mapper;

import com.jmu.domain.Room;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoomMapper {
    int deleteByPrimaryKey(@Param("roomId") String roomId, @Param("dromId") String dromId);

    int insert(Room record);

    Room selectByPrimaryKey(@Param("roomId") String roomId, @Param("dromId") String dromId);

    List<Room> selectAll();

    int updateByPrimaryKey(Room record);
}