package com.jmu.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter@Getter@ToString
public class Drom {
    private String dromId;

    private String dromSex;

    private String dromAdminist;

    private Manager manager;

}