package com.jmu.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Setter
@Getter
@ToString
public class Student {
    private String stuId;

    private String stuName;

    private String password;

    private String stuSex;

    private String stuFrom;

    private String phone;

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date stuDate;

    private String stuCollege;

    private String stuMajor;

    @JsonProperty("aClass")
    private Class aClass;

    private Drom drom;

    private Room room;

}