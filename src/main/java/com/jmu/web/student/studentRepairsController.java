package com.jmu.web.student;

import com.jmu.domain.AjaxRes;
import com.jmu.domain.Repaires;
import com.jmu.service.RepairedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("student")
public class studentRepairsController {
    @Autowired
    private RepairedService repairedService;
    @RequestMapping("/repairsSubmit")
    @ResponseBody
    public AjaxRes repairsSubmit(Repaires repaires){
        System.out.println(repaires);
        repaires.setIsfixed(false);
        AjaxRes ajaxRes = repairedService.insertRepairs(repaires);
        return ajaxRes;
    }
}
