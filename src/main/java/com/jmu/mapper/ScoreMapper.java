package com.jmu.mapper;

import com.jmu.domain.QueryVo;
import com.jmu.domain.Score;
import java.util.List;

public interface ScoreMapper {
    int deleteByPrimaryKey(String scoreId);

    int insert(Score record);

    Score selectByPrimaryKey(Integer scoreId);

    List<Score> selectAll(QueryVo vo);

    int updateByPrimaryKey(Score record);
}