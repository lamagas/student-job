package com.ssm.model;

import java.io.Serializable;

public class School implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column school.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column school.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column school.id
     *
     * @return the value of school.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column school.id
     *
     * @param id the value for school.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column school.name
     *
     * @return the value of school.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column school.name
     *
     * @param name the value for school.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name;
    }
}