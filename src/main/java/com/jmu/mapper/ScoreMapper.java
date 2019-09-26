package com.jmu.mapper;

import com.jmu.domain.Score;
import java.util.List;

public interface ScoreMapper {
    int deleteByPrimaryKey(Integer scoreId);

    int insert(Score record);

    Score selectByPrimaryKey(Integer scoreId);

    List<Score> selectAll();

    int updateByPrimaryKey(Score record);
}