package com.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.ssm.model.*;
import com.ssm.model.dto.PageDto;
import com.ssm.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private InformationService informationService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private MreplyService mreplyService;
    @Autowired
    private QueryschoolService queryschoolService;
    @Autowired
    private SignUpService signUpService;

    //admin主页
    @RequiresRoles("issue")
    @RequestMapping("admin")
    public String admin() {
/*        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        PageInfo page=informationService.titlelist1(student.getId(),1,10);
        model.addAttribute("informations", page.getList());*/
        return "inforAdmin";
    }
    @ResponseBody
    @RequestMapping("admTitle")
    public PageInfo admtitle(@RequestParam(value = "page", defaultValue = "1") int pageCode){
        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        PageDto pagedto = informationService.titlelist1(student.getId(),pageCode,8);
        return pagedto;
    }

    //兼职信息显示
    @RequestMapping("messAdmin")
    public String messStu(int id, Model model) {
        Information information = informationService.message(id);
        List<Message> messages=messageService.messagelist(id);
        List<Mreply> mreplys=mreplyService.replylist(id);
        model.addAttribute("messages",messages);
        model.addAttribute("mreplys",mreplys);
        model.addAttribute("information", information);
        return "messAdmin";
    }
    //兼职信息显示
    @RequestMapping("messDraft")
    public String messDraft(int id, Model model) {
        Information information = informationService.message(id);
        model.addAttribute("information", information);
        return "draftmess";
    }
    //修改兼职信息
    @ResponseBody
    @RequestMapping("updateInfor")
    public String updateInfor(Information information,Model model){
        informationService.update(information);
        model.addAttribute("information", information);
        return "messAdmin";
    }
    //显示报名人员
    @ResponseBody
    @RequestMapping("SignUp")
    public List<Student> SignUp(int id){
        List<Student> students=studentService.signup(id);
        return students;
        //https://blog.csdn.net/dreamstar613/article/details/61913970
    }
    //个人资料
    @RequestMapping("personAdmin")
    public String person(Model model,int id) {
        Student student= studentService.find(id);
        model.addAttribute("student",student);
        return "stuInfor";
    }
    //查看草稿
    @RequestMapping("draft")
    public String draft(Model model) {
        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        List<Information> informations = informationService.draft(student.getId());
        model.addAttribute("informations", informations);
        return "draft";
    }
    //回收站
    @RequestMapping("recycle")
    public String recycle(Model model) {
        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        List<Information> informations = informationService.recycle(student.getId());
        model.addAttribute("informations", informations);
        return "recycle";
    }
    //=>草稿2
    @ResponseBody
    @RequestMapping("huifu")
    public int huifu(int id) {
        int a=informationService.huifu(id);
        return a;
    }
    //草稿发布=>0
    @ResponseBody
    @RequestMapping("fabu")
    public int fabu(int id) {
        int a=informationService.fabu(id);
        return a;
    }
    //删除信息=>3
    @ResponseBody
    @RequestMapping("delete")
    public int delete(int id) {
        int a=informationService.delete(id);
        return a;
    }
    //添加兼职信息
    @RequiresRoles("issue")
    @RequestMapping("write")
    public String write(Model model){
        List<School> schools = schoolService.schoollist();
        model.addAttribute("schools", schools);
        return "write";
    }
    @RequiresRoles("issue")
    @ResponseBody
    @RequestMapping("towrite")
    public String towrite(Information information, String sc){
        Student student= (Student) SecurityUtils.getSubject().getPrincipal();
        List<Queryschool> queryschools=new ArrayList<>();
        information.setStudentid(student.getId());
        if(information.getPeople()==null){information.setPeople(5);}
        informationService.insert(information);

        String[] school=sc.split(",");
        for(String s:school){
            Queryschool queryschool=new Queryschool();
            queryschool.setInforid(information.getInforid());
            queryschool.setSchoolid(Integer.parseInt(s));
            queryschools.add(queryschool);
        }
        queryschoolService.insert(queryschools);
        return "write";
    }
    //审核
    @ResponseBody
    @RequestMapping("audit")
    public int audit(Integer inforId,String stuString){
        if(inforId!=null&& StringUtil.isNotEmpty(stuString)){
            Student student= (Student) SecurityUtils.getSubject().getPrincipal();
            if(signUpService.audit(inforId,student.getId(),stuString)){
                return 1;
            }
        }
        return 0;
    }

}
