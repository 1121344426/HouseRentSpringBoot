package com.example.house_rent.SQLMapping.HouseMapping;


import com.example.house_rent.Bean.Client;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;


public interface ClientOperate {
    boolean insertClient(Client client);
    Client findUserByUsername(String userName);
    @Select("select password from client where username = #{username}")
    String findPasswordByUsername(String username);
    @Select("select id from client where username = #{username}")
    Integer findIdByUsername(String username);
    @Select("select name from client where id = #{id}")
    String selectNameById(Integer id);
    @Select("select email from client where id = #{id}")
    String findEmailById(Integer id);
    @Select("select * from client where id = #{id}")
    Client findClientById(Integer id);


}
