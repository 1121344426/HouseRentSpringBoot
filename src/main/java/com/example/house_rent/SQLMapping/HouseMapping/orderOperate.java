package com.example.house_rent.SQLMapping.HouseMapping;



import com.example.house_rent.Bean.Order;

import java.util.List;

public interface orderOperate {
    boolean insertOrder(Order order);

    List<Order> findOwnerOrders(Integer id);

    Integer findOrderCount(Integer id);

    boolean delOrder(Integer id);
}
