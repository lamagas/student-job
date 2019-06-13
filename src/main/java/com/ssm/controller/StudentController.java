package com.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.ssm.model.*;
import com.ssm.model.dto.PageDto;
import com.ssm.service.*;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private InformationService informationService;
    @Autowired
    private SignUpService signUpService;
    @Autowired
    MessageService messageService;
    @Autowired
    MreplyService mreplyService;

    //主页
    @RequestMapping("index")
    public String index() {
/*        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        PageInfo pageInfo = informationService.titlelist(student.getId(),1,10);
        model.addAttribute("informations", pageInfo.getList());*/
        return "infor";
    }
    @ResponseBody
    @RequestMapping("stuTitle")
    public PageInfo stutitle(@RequestParam(value = "page", defaultValue = "1") int pageCode){
        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        PageDto pagedto = informationService.titlelist(student.getId(),pageCode,8);
        return pagedto;
    }

    //个人资料
    @RequestMapping("person")
    public String person(Model model) {
        Student student1= (Student) SecurityUtils.getSubject().getPrincipal();
        Student student= studentService.find(student1.getId());
        model.addAttribute("student",student);
        return "student";
    }

    @RequestMapping("test2")
    public String list(){

        return "test2";
    }

    @RequestMapping("test1")
    public String list1(){

        return "test1";
    }

    //兼职信息显示
    @RequestMapping("message")
    public String messStu(int id, Model model) {
        Information information = informationService.message(id);
        List<Message> messages=messageService.messagelist(id);
        List<Mreply> mreplys=mreplyService.replylist(id);
        model.addAttribute("messages",messages);
        model.addAttribute("mreplys",mreplys);
        model.addAttribute("information", information);
        return "message";
    }
    //报名
    @ResponseBody
    @RequestMapping("Sign")
    public int Sign(int id,SignUp signUp){
        Information infor=informationService.peoplenum(id);
        if(infor.getDraft()==0){
            Student student= (Student) SecurityUtils.getSubject().getPrincipal();
            signUp.setInforid(id);
            signUp.setStudentid(student.getId());
            int a=signUpService.insert(signUp);
            if(a==1){
                infor.setNowpeople(infor.getNowpeople()+1);
                if(infor.getNowpeople()==infor.getPeople()){
                    infor.setDraft(1);
                }
                informationService.updatepeoplenum(infor);
            }
            return a;
        }else {return 0;}
    }
//收藏
    @ResponseBody
    @RequestMapping("Collect")
    public int Collect(int id,Collect collect){
        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        collect.setInforid(id);
        collect.setStudentid(student.getId());
        int a=signUpService.insert(collect);
        return a;
    }
    //修改个人信息
    @ResponseBody
    @RequestMapping("update")
    public String update(@RequestBody Student student){
        School school=new School();
        if(StringUtils.isEmpty(student.getId())){
            return "0";
        }
        studentService.update(student);
        //school.setName(schoolname);
        student.setSchoolOJ(school);
        Student student1= (Student) SecurityUtils.getSubject().getPrincipal();
        student1.setName(student.getName());
        return "1";
    }
    //显示学生已报名
    @RequestMapping("enrolment")
    public String StuSignup(Model model){
        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        List<Information> informations=informationService.SingUpTitle(student.getId());
        model.addAttribute("informations",informations);
        return "enrolment";
    }
    //显示学生已收藏
    @RequestMapping("CollectInfor")
    public String StuCollect(Model model){
        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        List<Information> informations=informationService.CollectTitle(student.getId());
        model.addAttribute("informations",informations);
        return "collect";
    }
}