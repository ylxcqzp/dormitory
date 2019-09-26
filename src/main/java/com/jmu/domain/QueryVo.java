package com.jmu.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter@Getter@ToString
public class QueryVo {
    private int page;
    private int limit;
    private String keyword;
}
