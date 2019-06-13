package com.ssm.model;

public class Message {
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getM_message() {
        return m_message;
    }

    public void setM_message(int m_message) {
        this.m_message = m_message;
    }

    public int getM_inforid() {
        return m_inforid;
    }

    public void setM_inforid(int m_inforid) {
        this.m_inforid = m_inforid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getM_time() {
        return m_time;
    }

    public void setM_time(String m_time) {
        this.m_time = m_time;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getM_studentid() {
        return m_studentid;
    }

    public void setM_studentid(int m_studentid) {
        this.m_studentid = m_studentid;
    }
    private int m_studentid;
    private Student student;
    private String m_time;
    private int id;
    private int m_message;
    private int m_inforid;
    private String message;

}
