package com.ssm.model.dto;

import com.github.pagehelper.PageInfo;

import java.util.List;

public class PageDto extends PageInfo{

    public PageDto(List list, int navigatePages) {
        super(list, navigatePages);
    }

    private Integer code;
    private Integer count;
    private String msg;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
