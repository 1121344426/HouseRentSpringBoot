package com.example.house_rent.Bean;

public class employee {
   private String title;
   private String express;
   private String address;
   private String houseStyle;
   private float price;
   private String path;
   private String time;

    public employee(String title, String express, String address, String houseStyle, float price, String path,String time) {
        this.title = title;
        this.express = express;
        this.address = address;
        this.houseStyle = houseStyle;
        this.price = price;
        this.path = path;
        this.time = time;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public employee() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getExpress() {
        return express;
    }

    public void setExpress(String express) {
        this.express = express;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHouseStyle() {
        return houseStyle;
    }

    public void setHouseStyle(String houseStyle) {
        this.houseStyle = houseStyle;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
