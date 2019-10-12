package com.jmu.web.student;

import com.jmu.domain.*;
import com.jmu.service.ExchangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/student")
public class studentExchangeController {
    @Autowired
    private ExchangeService exchangeService;
    @RequestMapping("/getDormList")
    @ResponseBody
    public List<Drom> getDormList(String sex){
        List<Drom> droms = exchangeService.getDormList(sex);
        return droms;
    }

    @RequestMapping("/getRoomList")
    @ResponseBody
    public List<Room> getRoomList(){
        List<Room> rooms = exchangeService.getRoomList();
        return rooms;
    }

    @RequestMapping("/exchangeSubmit")
    @ResponseBody
    public AjaxRes exchangeSubmit(Exchange exchange,String stuId){
        Student student = new Student();
        student.setStuId(stuId);
        exchange.setStudent(student);
        System.out.println(exchange);
        AjaxRes ajaxRes = exchangeService.insert(exchange);
       /* AjaxRes ajaxRes = new AjaxRes();
        ajaxRes.setSuccess(true);
        ajaxRes.setMsg("调试");*/
        return ajaxRes;
    }
}
