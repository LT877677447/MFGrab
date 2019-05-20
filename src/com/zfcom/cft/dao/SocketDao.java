package com.zfcom.cft.dao;

import com.zfcom.cft.entity.po.SmsCheckCode;
import com.zfcom.cft.utils.Constants;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

public interface SocketDao {


    @Insert("insert into "+ Constants.TABLE_SMS +"(seqid,req_dev,adv_id,mobile,issendsms,smstext,smscode,check_code_url,getmo_time,getcode_time,errcode,errinfo,fetch_time,send_time,proc_result)" +
            " values(#{seqid},#{req_dev},#{adv_id},#{mobile},#{issendsms},#{smstext},#{smscode},#{check_code_url},#{getmo_time},#{getcode_time},#{errcode},#{errinfo},#{fetch_time},#{send_time},#{proc_result})")
    void addSmsCheckCode(SmsCheckCode smsCheckCode);

    @Update("update "+Constants.TABLE_SMS+" set proc_result=#{proc_result},issendsms=#{issendsms},smstext=#{smstext},send_time=#{send_time},errinfo=#{errinfo}" +
            " where seqid=#{seqid} and (TIME_TO_SEC(CURRENT_TIMESTAMP()) - TIME_TO_SEC(date_grab) < 60)")
    void sendSms(SmsCheckCode smsCheckCode);

    @Update("update "+Constants.TABLE_SMS+" set smstext=#{smstext},getcode_time=#{getcode_time},proc_result=#{proc_result}" +
            " where seqid=#{seqid} and errinfo=#{errinfo} and (TIME_TO_SEC(CURRENT_TIMESTAMP()) - TIME_TO_SEC(date_grab) < 60)")
    void passBackSmsCheckCode(SmsCheckCode smsCheckCode);






}
