package com.ssm.mapper;

import com.ssm.model.SignUp;

public interface SignUpMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sign_up
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sign_up
     *
     * @mbggenerated
     */
    int insert(SignUp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sign_up
     *
     * @mbggenerated
     */
    int insertSelective(SignUp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sign_up
     *
     * @mbggenerated
     */
    SignUp selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sign_up
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(SignUp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sign_up
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(SignUp record);
}