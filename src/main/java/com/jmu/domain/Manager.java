package com.jmu.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter@Getter@ToString
public class Manager {
    private String managerId;

    private String managerName;

    private String password;

    private String phone;

    private Role role;

}