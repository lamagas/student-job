//package com.ssm.controller;
//
//import com.github.pagehelper.PageHelper;
//import com.github.pagehelper.PageInfo;
//import com.ssm.model.Information;
//import com.ssm.service.InformationService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import java.util.List;
//
//
//@Controller
//public class test {
//    @Autowired
//    private InformationService informationService;
//    @RequestMapping("test10")
//    public String list(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model){
//        PageHelper.startPage(pn,3);//第一个参数的意思为：当前页数，第二个参数的意思为：每页显示多少条记录
//        List<Information> list=informationService.titlelist(102);//从数据库中获取查询所需的数据，在此之前，你不需要在sql语句中编写分页语句，该插件会在查询时直接将分页语句添加到数据库后
//        PageInfo page = new PageInfo(list,5);//将查询到的数据储存到pageinfo中
//        System.out.println(page);
//        model.addAttribute("pageInfo", page);//将pageinfo储存到模型中并返回到web页面
//        return null;
//    }
//
//}
