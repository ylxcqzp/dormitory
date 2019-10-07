package com.jmu.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter@Getter@ToString
public class Exchange {
    private Integer excId;

    private Student student;

    private String reason;

    private String targetDrom;

    private String targetRoom;

    private Boolean state;

    private Manager manager;



}