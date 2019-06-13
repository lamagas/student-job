package com.ssm.controller;

import com.ssm.model.School;
import com.ssm.model.Student;

import com.ssm.service.SchoolService;
import com.ssm.service.StudentService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private SchoolService schoolService;


    @RequestMapping("login")
    public String login() {
        return "login";
    }
    @RequestMapping("logout")
    public String logout() { return "logout"; }
    //登陆
    @RequestMapping("check")
    public String login( String name,  String password, Model model, HttpServletResponse response) {
        String error="";
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(name, password);
        try {
            subject.login(token);
            Student student=(Student) subject.getPrincipal();
            Cookie schoolname=new Cookie("schoolname", student.getSchoolOJ().getName());
            response.addCookie(schoolname);
            if(student.getLease()==2){
                return "redirect:index";
            }else {
                return "redirect:admin";
            }
        } catch (UnknownAccountException e) {
            e.printStackTrace();
            error = "用户名或密码错误";
        } catch (IncorrectCredentialsException e) {
            e.printStackTrace();
            error = "用户名或密码错误";
        } catch (ExcessiveAttemptsException e) {
            e.printStackTrace();
            error = "该账号登录失败次数过多" ;
        } catch (Exception e){
            e.printStackTrace();
            error = "未知错误";
        }
        model.addAttribute("error", error);
        return "login";
    }

    //注册
    @RequestMapping("register")
    public String login(Model model) {
        List<School> schools = schoolService.schoollist();
        model.addAttribute("schools", schools);
        return "register";
    }
    @RequestMapping("sign_up")
    public String add(Student student, HttpServletResponse response) {
        String pwd=student.getPassword();
        studentService.insert(student);
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(student.getName(),pwd);
        subject.login(token);
        if(student.getLease()==2){
            return "redirect:index";
        }else {
            return "redirect:admin";
        }
    }

    //checkname
    @ResponseBody
    @RequestMapping("checkname")
    public String checkname(String name){
        Student student=studentService.checkname(name);
        if(student==null){
            return "0";
        }else {
            return "1";
        }

    }
}
