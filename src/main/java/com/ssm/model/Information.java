package com.ssm.model;


import java.io.Serializable;
import java.util.List;

public class Information implements Serializable {

    private Integer inforid;

    private String title;

    private String message;

    private String time;

    private Integer studentid;

    public Integer getPeople() {
        return people;
    }

    public void setPeople(Integer people) {
        this.people = people;
    }

    private Integer people;

    public Integer getInforid() {
        return inforid;
    }

    public void setInforid(Integer inforid) {
        this.inforid = inforid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getStudentid() {
        return studentid;
    }

    public void setStudentid(Integer studentid) {
        this.studentid = studentid;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Queryschool getQueryschool() {
        return queryschool;
    }

    public void setQueryschool(Queryschool queryschool) {
        this.queryschool = queryschool;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public SignUp getSignUp() {
        return signUp;
    }

    public void setSignUp(SignUp signUp) {
        this.signUp = signUp;
    }

    public Integer getDraft() {
        return draft;
    }

    public void setDraft(Integer draft) {
        this.draft = draft;
    }

    public Integer getNowpeople() {
        return nowpeople;
    }

    public void setNowpeople(Integer nowpeople) {
        this.nowpeople = nowpeople;
    }
    private SignUp signUp;
    private Student student;
    private Queryschool queryschool;
    private School school;
    private Integer draft;
    private Integer nowpeople;
    private List<SignUp> signUps;

}