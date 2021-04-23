package com.example.house_rent.ServiceImpl;


import com.example.house_rent.Bean.Order;

import com.example.house_rent.SQLMapping.HouseMapping.orderOperate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class OrderService {
    @Autowired
    private orderOperate orderOperate;

    public boolean insertOrderByRenter(Order order){
        return orderOperate.insertOrder(order);
    }

    public PageInfo<Order> findOwnerOrders(Integer id, int page, int limit){
        PageHelper.startPage(page,limit);
        List<Order> ownerOrders = orderOperate.findOwnerOrders(id);
        return new PageInfo<>(ownerOrders);
    }

    public Integer findOrdersCount(Integer id){
       return orderOperate.findOrderCount(id);
    }

    public boolean delOrderById(Integer id){
        return orderOperate.delOrder(id);
    }
}
