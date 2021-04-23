package com.example.house_rent.Bean;

public class Order {
    private Integer id;
    private Integer ownerid;
    private Integer renterid;
    private Integer houseid;
    private String renterEmail;


    public Order(Integer ownerid, Integer renterid, Integer houseid, String renterEmail) {
        this.ownerid = ownerid;
        this.renterid = renterid;
        this.houseid = houseid;
        this.renterEmail = renterEmail;
    }

    public Order(Integer id, Integer ownerid, Integer renterid, Integer houseid, String renterEmail) {
        this.id = id;
        this.ownerid = ownerid;
        this.renterid = renterid;
        this.houseid = houseid;
        this.renterEmail = renterEmail;
    }

    public String getRenterEmail() {
        return renterEmail;
    }

    public void setRenterEmail(String renterEmail) {
        this.renterEmail = renterEmail;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOwnerid() {
        return ownerid;
    }

    public void setOwnerid(Integer ownerid) {
        this.ownerid = ownerid;
    }

    public Integer getRenterid() {
        return renterid;
    }

    public void setRenterid(Integer renterid) {
        this.renterid = renterid;
    }

    public Integer getHouseid() {
        return houseid;
    }

    public void setHouseid(Integer houseid) {
        this.houseid = houseid;
    }
}
