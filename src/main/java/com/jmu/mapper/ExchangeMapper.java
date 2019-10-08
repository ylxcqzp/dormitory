package com.jmu.mapper;

import com.jmu.domain.Exchange;
import java.util.List;

public interface ExchangeMapper {
    int deleteByPrimaryKey(Integer excId);

    int insert(Exchange record);

    Exchange selectByPrimaryKey(Integer excId);

    List<Exchange> selectAll();

    int updateByPrimaryKey(Exchange record);

    int updateHandleId(String managerId);

    void updateChangeStatus(Exchange exchange);
}