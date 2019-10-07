package com.jmu.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jmu.domain.*;
import com.jmu.mapper.DromMapper;
import com.jmu.mapper.RoomMapper;
import com.jmu.mapper.ScoreMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
@Transactional
public class ScoreServiceImpl implements ScoreService {
    @Autowired
    private ScoreMapper scoreMapper;
    @Autowired
    private DromMapper dromMapper;
    @Autowired
    private RoomMapper roomMapper;
    @Override
    public PageListRes getAllScore(QueryVo vo) {
        Page<Score> page = PageHelper.startPage(vo.getPage(), vo.getLimit());
        List<Score> students = scoreMapper.selectAll(vo);
        for (Score student : students) {
            System.out.println(student);
        }
        /*封装成pageList*/
        PageListRes pageListRes = new PageListRes();
        /*获取数据库总数据*/
        pageListRes.setCode(0);
        pageListRes.setCount(page.getTotal());
        /*封装查询数据*/
        pageListRes.setData(students);
        return pageListRes;
    }

    @Override
    public void delScoById(Integer scoreId) {
        scoreMapper.deleteByPrimaryKey(scoreId);
    }

    @Override
    public void updateScore(Score score) {
        scoreMapper.updateByPrimaryKey(score);
    }

    @Override
    public void addScore(Score score) {
        scoreMapper.insert(score);
    }



    @Override
    public List<Drom> getAllDorm() {
        List<Drom> dorms = dromMapper.selectAll();
        return dorms;
    }

    @Override
    public List<Room> getAllRoom() {
        List<Room> rooms = roomMapper.selectAll();
        return rooms;
    }


}
