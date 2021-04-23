package com.example.house_rent.utils;



import com.example.house_rent.Bean.HouseOther;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
@Service
public class WebUtils {
    @Autowired
    RedisTemplate redisTemplate;
    public static String getChecking(int count){
        String checking = "";
        for(int i=0;i<count;i++){
            int no = (int)(Math.random()*10);
            checking = checking + no;
        }
        return checking;
    }

    public static Integer pageNum(Integer allPage,Integer pagesForOnePiece){
        if(allPage % pagesForOnePiece == 0){
            return allPage/pagesForOnePiece;
        }else {
            return allPage/pagesForOnePiece + 1;
        }
    }

    public static  <T> void addList(List<T> list,T... t){
        for(int i = 0;i<t.length;i++){
            list.add(t[i]);
        }
    }

   public static HouseOther getParam(HttpServletRequest req){
       HouseOther houseOther = new HouseOther();
       houseOther.setFirstFashion(req.getParameter("firstFashion"));
       houseOther.setSecondFashion(req.getParameter("secondFashion"));
       houseOther.setThirdFashion(req.getParameter("thirdFashion"));
       houseOther.setForthFashion(req.getParameter("forthFashion"));
       houseOther.setTransport(req.getParameter("car"));
       houseOther.setRenterStyle(req.getParameter("renterStyle"));
       houseOther.setWaterPrice(req.getParameter("waterPrice"));
       houseOther.setPublicWaterPrice(req.getParameter("publicWaterPrice"));
       houseOther.setElectricity(req.getParameter("electricity"));
       houseOther.setPublicElectricity(req.getParameter("publicElectricity"));
       houseOther.setInternetPrice(req.getParameter("internetPrice"));
       houseOther.setServicePrice(req.getParameter("servicePrice"));
       houseOther.setPersonName(req.getParameter("personName"));
       return houseOther;
   }

   public static void addHouseOtherToList(RedisTemplate redisTemplate,HouseOther houseOther,Integer id){
        if(redisTemplate.hasKey(id+"HouseOther")){
            redisTemplate.delete(id+"HouseOther");
        }
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getFirstFashion());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getSecondFashion());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getThirdFashion());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getForthFashion());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getTransport());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getRenterStyle());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getWaterPrice());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getElectricity());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getPublicWaterPrice());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getPublicElectricity());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getInternetPrice());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getServicePrice());
       redisTemplate.boundListOps(id+"HouseOther").rightPush(houseOther.getPersonName());

   }
   public static HouseOther redisToBeanHouseOther(List<String> list){
        return  new HouseOther(list.get(0),list.get(1),list.get(2),list.get(3),list.get(4),list.get(5),list.get(6),list.get(7),list.get(8),list.get(9),list.get(10),list.get(11),list.get(12));
   }

   public static List<Integer> stringListToInteger(List<String> list){
        if(list.size() == 0 && list == null){
            return null;
        }
       ArrayList<Integer> integers = new ArrayList<>();
       for(String s:list){
            Integer id = Integer.valueOf(s);
            integers.add(id);
        }
       return integers;
   }


}
