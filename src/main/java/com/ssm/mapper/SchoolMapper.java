package com.ssm.mapper;

import com.ssm.model.School;

import java.util.List;

public interface SchoolMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table school
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table school
     *
     * @mbggenerated
     */
    int insert(School record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table school
     *
     * @mbggenerated
     */
    int insertSelective(School record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table school
     *
     * @mbggenerated
     */
    School selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table school
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(School record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table school
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(School record);
    List<School> list();
}