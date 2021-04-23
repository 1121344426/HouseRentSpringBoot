package com.example.house_rent.ServiceImpl;


import com.example.house_rent.Bean.House;
import com.example.house_rent.SQLMapping.HouseMapping.HouseOperate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.List;

@Service
public class HouseService {
    @Autowired
    private HouseOperate houseOperate;
    //@CachePut(value = "redisCache",key = "'redis_house'")
    public boolean insertHouse(House house){
        boolean isInsert = houseOperate.publishHouse(house);
        return isInsert;
    }
    @Cacheable(value = "redisCache",key = "'redis_house'+#id")
    public House findHouse(Integer id){
        House houseById = houseOperate.findHouseById(id);
        return houseById;
    }

    public List<House> findAllHouses(){
        ArrayList<House> houses = houseOperate.findHouses();
        return houses;
    }

    public PageInfo<House> findHousesPage(Integer page){
        PageHelper.startPage(page,6);
        ArrayList<House> houses = houseOperate.findHouses();
        PageInfo<House> housePageInfo = new PageInfo<>(houses);
        return housePageInfo;
    }
    public PageInfo<House> findHousesByOwnerId(Integer id,Integer page){
        PageHelper.startPage(page,3);
        ArrayList<House> housesByOwner = houseOperate.findHousesByOwner(id);
        PageInfo<House> housePageInfo = new PageInfo<>(housesByOwner);
        return housePageInfo;
    }

    public PageInfo<House> findHousesByRenterId(Integer id,Integer page){
        PageHelper.startPage(page,3);
        ArrayList<House> housesByRenter = houseOperate.findHousesByRenter(id);
        PageInfo<House> housePageInfo = new PageInfo<>(housesByRenter);
        return housePageInfo;
    }


    public PageInfo<House> findHousesOrderByPriceAsc(Integer page){
        PageHelper.startPage(page,6);
        ArrayList<House> housesByRenter = houseOperate.findHousesByPriceAsc();
        PageInfo<House> housePageInfo = new PageInfo<>(housesByRenter);
        return housePageInfo;
    }
    public PageInfo<House> findHousesOrderByPriceDesc(Integer page){
        PageHelper.startPage(page,6);
        ArrayList<House> housesByRenter = houseOperate.findHousesByPriceDesc();
        PageInfo<House> housePageInfo = new PageInfo<>(housesByRenter);
        return housePageInfo;
    }
    public PageInfo<House> findHousesOrderByDateAsc(Integer page){
        PageHelper.startPage(page,6);
        ArrayList<House> housesByRenter = houseOperate.findHousesByDateAsc();
        PageInfo<House> housePageInfo = new PageInfo<>(housesByRenter);
        return housePageInfo;
    }
    public PageInfo<House> findHousesByAllConditions(String style,String village,Integer priceBegin,Integer priceEnd,Integer squareBegin,Integer squareEnd,String orderParam,String orderStyle,Integer page){
        PageHelper.startPage(page,6);
        ArrayList<House> housesByRenter = houseOperate.findHousesByAllConditions(style,village,priceBegin,priceEnd,squareBegin,squareEnd,orderParam,orderStyle);
        PageInfo<House> housePageInfo = new PageInfo<>(housesByRenter);
        return housePageInfo;
    }

    public Integer queryCountOfHouses(){
        return houseOperate.findCountOfHouse();
    }

    public PageInfo<House> findListHouse(List<Integer> idList,int page){
        PageHelper.startPage(page, 3);
        List<House> housesByList = houseOperate.findHousesByList(idList);
        return new PageInfo<>(housesByList);
    }
    public PageInfo<House> findListHistoryHouse(List<Integer> idList,int page){
        PageHelper.startPage(page,3);
        List<House> housesByList = houseOperate.findHousesByList(idList);
        return new PageInfo<>(housesByList);

    }
    public boolean delHouseById(Integer id){
        return houseOperate.delHouse(id);
    }

    public boolean updateHouseToRenter(Integer id,Integer renterid){
        return houseOperate.updateHouseToRenter(id,renterid);
    }

}
