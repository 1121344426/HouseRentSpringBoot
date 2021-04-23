package com.example.house_rent.ServiceImpl;


import com.example.house_rent.Bean.Client;
import com.example.house_rent.SQLMapping.HouseMapping.ClientOperate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;


@Service
public class ClientService  {
    @Autowired
    private ClientOperate clientOperate;

    @Cacheable(value = "redisCache",key="'redis_user_'+#userName")
    public Client findClientByUsername(String username){
        return clientOperate.findUserByUsername(username);
    }
    @Cacheable(value = "redisCache",key="'redis_userExists_'+#userName")
    public boolean userExists(String userName){
        Client isExists = clientOperate.findUserByUsername(userName);
        if(isExists == null){
            return false;
        }
        return true;
    }

    @CachePut(value = "redisCache",key = "'redis_user_'+#client.id")
    public boolean insertClient(Client client){
        boolean isInsertSuccess = clientOperate.insertClient(client);
        return isInsertSuccess;
    }
    @Cacheable(value = "redisCache",key = "'redis_password_'+#userName")
    public String findPassword(String userName){
        String password = clientOperate.findPasswordByUsername(userName);
        return password;
    }

    public Integer findId(String userName){
        Integer id = clientOperate.findIdByUsername(userName);
        return id;
    }

    public String findName(Integer id){
        String name = clientOperate.selectNameById(id);
        return name;
    }

    public String findEmailById(Integer id){
        return clientOperate.findEmailById(id);
    }
    @Cacheable(value = "redisCache",key = "'redis_Client_'+#id")
    public Client findClientForid(Integer id){
        return clientOperate.findClientById(id);
    }

}
