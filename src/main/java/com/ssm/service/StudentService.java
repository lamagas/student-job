package com.ssm.service;
import com.ssm.model.Student;

import java.util.List;

/**
 * Created by Administrator on 2018/5/14.
 */
public interface StudentService {
    List<Student>  listStudents();
    void insert(Student student);
    void delete(int id);
    Student find(int id);
    void update(Student student);
    Student login(String name);
    List<Student> signup(int id);
    Student checkname(String name);
}
