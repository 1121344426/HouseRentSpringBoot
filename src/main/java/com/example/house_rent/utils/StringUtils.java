package com.example.house_rent.utils;

public class StringUtils {
    public  static  String[] trimAll(String[] array){
        for(int i = 0;i<array.length;i++){
            array[i] = array[i].trim();
        }
        return array;
    }
}
