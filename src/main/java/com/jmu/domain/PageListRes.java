package com.jmu.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Setter@Getter
public class PageListRes {
    private int code;
    private String msg;
    private long count;
    private List<?> data = new ArrayList<>();
}
