package com.example.house_rent.SQLMapping.HouseMapping;




import com.example.house_rent.Bean.House;

import java.util.ArrayList;
import java.util.List;

public interface HouseOperate {
    boolean publishHouse(House house);

    ArrayList<House> findHouses();
    ArrayList<House> findHousesByPriceAsc();
    ArrayList<House> findHousesByPriceDesc();
    ArrayList<House> findHousesByDateAsc();

    Integer findCountOfHouse();

    House findHouseById(Integer id);
    ArrayList<House> findHousesByOwner(Integer id);
    ArrayList<House> findHousesByRenter(Integer id);
    //正常选择的排序

    ArrayList<House> findHousesByAllConditions(String style, String village, Integer priceBegin, Integer priceEnd, Integer squareBegin, Integer squareEnd, String orderParam, String orderStyle);

    List<House> findHousesByList(List<Integer> ids);

    boolean delHouse(Integer id);

    boolean updateHouseToRenter(Integer id, Integer renterid);
}
