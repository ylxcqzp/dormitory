package com.jmu.service;

import com.jmu.domain.*;

import java.util.List;

public interface ScoreService {
    public PageListRes getAllScore(QueryVo vo);

    void updateScore(Score score);

    void addScore(Score score);

    void delScoById(Integer scoreId);

    List<Drom> getAllDorm();

    List<Room> getAllRoom();
}
