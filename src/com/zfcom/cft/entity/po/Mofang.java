package com.zfcom.cft.entity.po;

import java.io.Serializable;
import java.util.Date;

public class Mofang implements Serializable {
    private Long autoid;
    private Integer sup_objectNo;
    private String sup_objectId;
    private Integer twologincount;
    private Integer newcount;
    private Integer dayreten;
    private String objectId;
    private Date date_origin;
    private Date date_grab;

    public Mofang() {

    }

    public Mofang(Long autoid, Integer sup_objectNo, String sup_objectId, Integer twologincount, Integer newcount, Integer dayreten, String objectId, Date date_origin, Date date_grab) {
        this.autoid = autoid;
        this.sup_objectNo = sup_objectNo;
        this.sup_objectId = sup_objectId;
        this.twologincount = twologincount;
        this.newcount = newcount;
        this.dayreten = dayreten;
        this.objectId = objectId;
        this.date_origin = date_origin;
        this.date_grab = date_grab;
    }

    public Long getAutoid() {
        return autoid;
    }

    public void setAutoid(Long autoid) {
        this.autoid = autoid;
    }

    public Integer getSup_objectNo() {
        return sup_objectNo;
    }

    public void setSup_objectNo(Integer sup_objectNo) {
        this.sup_objectNo = sup_objectNo;
    }

    public String getSup_objectId() {
        return sup_objectId;
    }

    public void setSup_objectId(String sup_objectId) {
        this.sup_objectId = sup_objectId;
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

    public String getObjectId() {
        return objectId;
    }

    public void setObjectId(String objectId) {
        this.objectId = objectId;
    }

    public Date getDate_origin() {
        return date_origin;
    }

    public void setDate_origin(Date date_origin) {
        this.date_origin = date_origin;
    }

    public Date getDate_grab() {
        return date_grab;
    }

    public void setDate_grab(Date date_grab) {
        this.date_grab = date_grab;
    }

    @Override
    public String toString() {
        return "Mofang{" +
                "autoid=" + autoid +
                ", sup_objectNo=" + sup_objectNo +
                ", sup_objectId='" + sup_objectId + '\'' +
                ", twologincount=" + twologincount +
                ", newcount=" + newcount +
                ", dayreten=" + dayreten +
                ", objectId='" + objectId + '\'' +
                ", date_origin=" + date_origin +
                ", date_grab=" + date_grab +
                '}';
    }
}


