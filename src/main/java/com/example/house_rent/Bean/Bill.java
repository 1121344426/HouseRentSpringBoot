package com.example.house_rent.Bean;

import java.util.Date;

public class Bill {
    private int id;
    private int houseid;
    private Date starttime;
    private int length;
    private int renter;

    public Bill(int id, int houseid, Date starttime, int length, int renter) {
        this.id = id;
        this.houseid = houseid;
        this.starttime = starttime;
        this.length = length;
        this.renter = renter;
    }

    public Bill() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHouseid() {
        return houseid;
    }

    public void setHouseid(int houseid) {
        this.houseid = houseid;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getRenter() {
        return renter;
    }

    public void setRenter(int renter) {
        this.renter = renter;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "id=" + id +
                ", houseid=" + houseid +
                ", starttime=" + starttime +
                ", length=" + length +
                ", renter=" + renter +
                '}';
    }
}
