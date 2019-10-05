package com.jmu.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter@Getter@ToString
public class Role {
    private Integer roleId;

    private String roleName;

    private String detail;

}