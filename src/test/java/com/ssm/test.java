package com.ssm;

import com.ssm.mapper.InformationMapper;
import com.ssm.model.Information;
import com.ssm.model.dto.PageDto;
import com.ssm.service.InformationService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml"})
public class test {

    @Autowired
    private InformationService informationService;

    @Autowired
    private InformationMapper informationMapper;
    @Test
    public void list(){
        //PageHelper.startPage(2,3);//第一个参数的意思为：当前页数，第二个参数的意思为：每页显示多少条记录
        PageDto pageInfo=informationService.titlelist(120,1,3);//从数据库中获取查询所需的数据，在此之前，你不需要在sql语句中编写分页语句，该插件会在查询时直接将分页语句添加到数据库后
        System.out.println(pageInfo);
    }

    @Test
    public void test1(){
        List<Information> informationList=informationMapper.studentinfor();
    }

}
