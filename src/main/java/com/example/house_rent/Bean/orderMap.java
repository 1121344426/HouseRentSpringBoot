package com.example.house_rent.Bean;

public class orderMap<T> {

    private String msg;
    private int code;
    private T data;
    private int count;

    public orderMap() {
    }

    public orderMap(String msg, int code, T data, int count) {
        this.msg = msg;
        this.code = code;
        this.data = data;
        this.count = count;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
