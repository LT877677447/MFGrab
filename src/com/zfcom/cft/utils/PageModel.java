package com.zfcom.cft.utils;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class PageModel implements Serializable {
    /**
     * 数据条数
     */
    private Integer recordCount;
    /**
     * 当前页面
     */
    private Integer pageIndex;
    /**
     * 每页分多少条数据
     */
    private Integer pageSize;
    /**
     * 总页数
     */
    private Integer totalSize;
    /**
     * 查询的顺序 desc asc
     */
    private String order;
    /**
     * 查询的日期下限
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date_1;
    /**
     * 查询的日期上限
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date_2;
    /**
     * 查询的渠道
     */
    private Integer channel;
    /**
     *查询的月份
     */
    private Integer month;

    public PageModel() {
    }

    public PageModel(Integer recordCount, Integer pageIndex, Integer pageSize, Integer totalSize, String order, Date date_1, Date date_2, Integer channel, Integer month) {
        this.recordCount = recordCount;
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.totalSize = totalSize;
        this.order = order;
        this.date_1 = date_1;
        this.date_2 = date_2;
        this.channel = channel;
        this.month = month;
    }

    public Integer getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(Integer recordCount) {
        this.recordCount = recordCount;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(Integer totalSize) {
        this.totalSize = totalSize;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public Date getDate_1() {
        return date_1;
    }

    public void setDate_1(Date date_1) {
        this.date_1 = date_1;
    }

    public Date getDate_2() {
        return date_2;
    }

    public void setDate_2(Date date_2) {
        this.date_2 = date_2;
    }

    public Integer getChannel() {
        return channel;
    }

    public void setChannel(Integer channel) {
        this.channel = channel;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    @Override
    public String toString() {
        return "PageModel{" +
                "recordCount=" + recordCount +
                ", pageIndex=" + pageIndex +
                ", pageSize=" + pageSize +
                ", totalSize=" + totalSize +
                ", order='" + order + '\'' +
                ", date_1=" + date_1 +
                ", date_2=" + date_2 +
                ", channel='" + channel + '\'' +
                ", month=" + month +
                '}';
    }
}
