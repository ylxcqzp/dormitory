package com.jmu.service;

import com.jmu.domain.PageListRes;
import com.jmu.domain.QueryVo;
import com.jmu.domain.Score;

public interface ScoreService {
    public PageListRes getAllScore(QueryVo vo);

    void delScoById(String scoreId);

    void updateScore(Score score);

    void addScore(Score score);
}
