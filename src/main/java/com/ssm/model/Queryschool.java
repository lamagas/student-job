package com.ssm.model;

import java.io.Serializable;

public class Queryschool implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column queryschool.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column queryschool.inforid
     *
     * @mbggenerated
     */
    private Integer inforid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column queryschool.schoolid
     *
     * @mbggenerated
     */
    private Integer schoolid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column queryschool.id
     *
     * @return the value of queryschool.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column queryschool.id
     *
     * @param id the value for queryschool.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column queryschool.inforid
     *
     * @return the value of queryschool.inforid
     *
     * @mbggenerated
     */
    public Integer getInforid() {
        return inforid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column queryschool.inforid
     *
     * @param inforid the value for queryschool.inforid
     *
     * @mbggenerated
     */
    public void setInforid(Integer inforid) {
        this.inforid = inforid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column queryschool.schoolid
     *
     * @return the value of queryschool.schoolid
     *
     * @mbggenerated
     */
    public Integer getSchoolid() {
        return schoolid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column queryschool.schoolid
     *
     * @param schoolid the value for queryschool.schoolid
     *
     * @mbggenerated
     */
    public void setSchoolid(Integer schoolid) {
        this.schoolid = schoolid;
    }
}