package com.example.house_rent.Bean;

import com.github.pagehelper.PageInfo;

import java.util.List;

public class FourOrderHouses<T> {
    private List<PageInfo<T>> pageInfos;

    public FourOrderHouses(List<PageInfo<T>> pageInfos) {
        this.pageInfos = pageInfos;
    }

    public List<PageInfo<T>> getPageInfos() {
        return pageInfos;
    }

    public void setPageInfos(List<PageInfo<T>> pageInfos) {
        this.pageInfos = pageInfos;
    }
}
