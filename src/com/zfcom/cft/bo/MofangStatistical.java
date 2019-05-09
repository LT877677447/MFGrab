package com.zfcom.cft.bo;

import java.io.Serializable;

public class MofangStatistical implements Serializable {
    private Integer sup_objectNo;
    private Integer twologincount;
    private Integer newcount;
    private Integer dayreten;
    private Integer numberOfMonthLive;

    public MofangStatistical() {}

    public MofangStatistical(Integer sup_objectNo, Integer twologincount, Integer newcount, Integer dayreten, Integer numberOfMonthLive) {
        this.sup_objectNo = sup_objectNo;
        this.twologincount = twologincount;
        this.newcount = newcount;
        this.dayreten = dayreten;
        this.numberOfMonthLive = numberOfMonthLive;
    }

    public Integer getSup_objectNo() {
        return sup_objectNo;
    }

    public void setSup_objectNo(Integer sup_objectNo) {
        this.sup_objectNo = sup_objectNo;
    }

    public Integer getTwologincount() {
        return twologincount;
    }

    public void setTwologincount(Integer twologincount) {
        this.twologincount = twologincount;
    }

    public Integer getNewcount() {
        return newcount;
    }

    public void setNewcount(Integer newcount) {
        this.newcount = newcount;
    }

    public Integer getDayreten() {
        return dayreten;
    }

    public void setDayreten(Integer dayreten) {
        this.dayreten = dayreten;
    }

    public Integer getNumberOfMonthLive() {
        return numberOfMonthLive;
    }

    public void setNumberOfMonthLive(Integer numberOfMonthLive) {
        this.numberOfMonthLive = numberOfMonthLive;
    }

    @Override
    public String toString() {
        return "MofangStatistical{" +
                "sup_objectNo=" + sup_objectNo +
                ", twologincount=" + twologincount +
                ", newcount=" + newcount +
                ", dayreten=" + dayreten +
                ", numberOfMonthLive=" + numberOfMonthLive +
                '}';
    }
}

