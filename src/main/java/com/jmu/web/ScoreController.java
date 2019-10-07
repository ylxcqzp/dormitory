package com.jmu.web;

import com.jmu.domain.*;
import com.jmu.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dormManager")
public class ScoreController {
    @Autowired
    private ScoreService scoreService;
    @RequestMapping("/score")
    public String score(){
        return "/part/score";
    }

    @RequestMapping("/scoreInfo")
    @ResponseBody
    public PageListRes scoreInfo(QueryVo vo){
        System.out.println(vo);
        System.out.println("来到了控制层");
        PageListRes allScore = scoreService.getAllScore(vo);
        return allScore;
    }
    @RequestMapping("/getDormList")
    @ResponseBody
    public List<Drom> getClassList(){
        List<Drom> allDorm = scoreService.getAllDorm();
        return allDorm;
    }
    @RequestMapping("/getRoomList")
    @ResponseBody
    public List<Room> getRoomList(){
        List<Room> allRoom = scoreService.getAllRoom();
        return allRoom;
    }
    /*删除宿舍信息   根据scoreID*/
    @RequestMapping("/scoreDel")
    @ResponseBody
    public AjaxRes scoreDel(Score score){
        System.out.println(score);
        AjaxRes ajaxRes = new AjaxRes();
        try{
            scoreService.delScoById(score.getScoreId());
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("删除成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("删除失败");
        }
        return ajaxRes;
    }
    /*添加记录*/
    @RequestMapping("/scoAdd")
    @ResponseBody
    public AjaxRes scoAdd(Score score){

        System.out.println("添加");
        System.out.println(score);
        AjaxRes ajaxRes = new AjaxRes();
        try{
            scoreService.addScore(score);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("添加成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("添加失败");
            e.printStackTrace();
        }
        return ajaxRes;
    }
    /*编辑宿舍信息*/
    @RequestMapping("/scoEdit")
    @ResponseBody
    public AjaxRes scoEdit(Score score){
        System.out.println(score);
        AjaxRes ajaxRes = new AjaxRes();
        try{
            scoreService.updateScore(score);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("修改成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("修改失败");
            e.printStackTrace();
        }
        return ajaxRes;
    }
}
