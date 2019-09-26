package com.jmu.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Setter
@Getter
@ToString
public class Score {
    private Integer scoreId;

    private Integer scorePoint;

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date recordTime;

    private Drom drom;

    private Room room;

}