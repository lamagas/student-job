package com.ssm.model;

public class Mreply {
    private int id;
    private int messid;
    private int r_studentid;
    private int r_inforid;
    private String r_message;
    private String r_time;
    private Student student;
    private String for_name;

    public String getFor_name() {
        return for_name;
    }

    public void setFor_name(String for_name) {
        this.for_name = for_name;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getR_time() {
        return r_time;
    }

    public void setR_time(String r_time) {
        this.r_time = r_time;
    }

    public int getR_inforid() {
        return r_inforid;
    }

    public void setR_inforid(int r_inforid) {
        this.r_inforid = r_inforid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMessid() {
        return messid;
    }

    public void setMessid(int messid) {
        this.messid = messid;
    }

    public int getR_studentid() {
        return r_studentid;
    }

    public void setR_studentid(int r_studentid) {
        this.r_studentid = r_studentid;
    }

    public String getR_message() {
        return r_message;
    }

    public void setR_message(String r_message) {
        this.r_message = r_message;
    }
}
