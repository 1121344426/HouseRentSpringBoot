package com.example.house_rent.Bean;

import java.util.ArrayList;
import java.util.Date;

public class House {
    private ArrayList<String> facilities;
    private Price normalPrice;
    private Integer id;
    private Integer owner;
    private  Integer renter;
    private String style;
    private double price;
    private String descr;
    private Date publishdate;
    private String village;
    private String city;
    private String area;
    private char status;
    private String path;
    private Integer square;
    private String direction;
    private String storey;


    public House(Integer id, Integer owner, Integer renter, String style, double price, String descr, Date publishdate, String village, String city, String area, char status,String path,Integer square) {
        this.id = id;
        this.owner = owner;
        this.renter = renter;
        this.style = style;
        this.price = price;
        this.descr = descr;
        this.publishdate = publishdate;
        this.village = village;
        this.city = city;
        this.area = area;
        this.status = status;
        this.path = path;
        this.square = square;
    }

    public House(Integer id, Integer owner, Integer renter, String style, double price, String descr, Date publishdate, String village, String city, String area, char status, String path, Integer square, String direction, String storey) {
        this.id = id;
        this.owner = owner;
        this.renter = renter;
        this.style = style;
        this.price = price;
        this.descr = descr;
        this.publishdate = publishdate;
        this.village = village;
        this.city = city;
        this.area = area;
        this.status = status;
        this.path = path;
        this.square = square;
        this.direction = direction;
        this.storey = storey;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getStorey() {
        return storey;
    }

    public void setStorey(String storey) {
        this.storey = storey;
    }

    public ArrayList<String> getFacilities() {
        return facilities;
    }

    public void setFacilities(ArrayList<String> facilities) {
        this.facilities = facilities;
    }

    public Price getNormalPrice() {
        return normalPrice;
    }

    public void setNormalPrice(Price normalPrice) {
        this.normalPrice = normalPrice;
    }

    public House() {
    }

    public Integer getSquare() {
        return square;
    }

    public void setSquare(Integer square) {
        this.square = square;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOwner() {
        return owner;
    }

    public void setOwner(Integer owner) {
        this.owner = owner;
    }

    public Integer getRenter() {
        return renter;
    }

    public void setRenter(Integer renter) {
        this.renter = renter;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public Date getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(Date startdate) {
        this.publishdate = startdate;
    }

    public String getVillage() {
        return village;
    }

    public void setVillage(String village) {
        this.village = village;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public char getStatus() {
        return status;
    }

    public void setStatus(char status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "House{" +
                "id=" + id +
                ", owner=" + owner +
                ", renter=" + renter +
                ", style='" + style + '\'' +
                ", price=" + price +
                ", descr='" + descr + '\'' +
                ", publishdate=" + publishdate +
                ", village='" + village + '\'' +
                ", city='" + city + '\'' +
                ", area='" + area + '\'' +
                ", status=" + status +
                ", path='" + path + '\'' +
                ", square=" + square +
                '}';
    }
}
