package com.ssm.service.impl;

import com.ssm.mapper.StudentMapper;
import com.ssm.model.Student;
import com.ssm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/5/17.
 */
@Service
public class StudentServiceImpl implements StudentService{
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private Password password;
    @Override
    public List<Student> listStudents() {
        return studentMapper.listStudents();
    }

    @Override
    public void insert(Student student) {
        password.enPassword(student);
        studentMapper.insert(student);
    }

    @Override
    public void delete(int id) {
        studentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Student find(int id) {
        return studentMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Student student) {
        studentMapper.updateByPrimaryKey(student);
    }

    @Override
    public Student login(String name){return studentMapper.login(name); }

    @Override
    public List<Student> signup(int id){
        return studentMapper.signup(id);
    }

    @Override
    public Student checkname(String name) {
        return studentMapper.checkname(name);
    }
}
