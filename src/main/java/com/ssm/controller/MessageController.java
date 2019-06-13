package com.ssm.controller;

import com.ssm.model.Message;
import com.ssm.model.Mreply;
import com.ssm.model.Student;
import com.ssm.service.MessageService;
import com.ssm.service.MreplyService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class MessageController {
    @Autowired
    MessageService messageService;
    @Autowired
    MreplyService mreplyService;

    @RequestMapping("messinsert")
    public String messinsert(Message message){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm");
        String nowDate = sdf.format(date);
        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        message.setM_time(nowDate);
        message.setM_studentid(student.getId());
        int a=messageService.insert(message);
        return "message";
    }
    @RequestMapping("replyinsert")
    public String replyinsert(Mreply mreply){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm");
        String nowDate = sdf.format(date);
        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        mreply.setR_time(nowDate);
        mreply.setR_studentid(student.getId());
        int a=mreplyService.insert(mreply);
        return "message";
    }

}
