package com.zfcom.cft.dao;

import com.zfcom.cft.entity.po.Mofang;
import com.zfcom.cft.bo.MofangStatistical;
import com.zfcom.cft.utils.Constants;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface SummaryDao {

    @Select("select a.* from "+Constants.TABLE_Mofang+" a,(select sup_objectNo,max(date_origin) max from "+Constants.TABLE_Mofang+" group by sup_objectNo) b where 1=1 and a.sup_objectNo = b.sup_objectNo and a.date_origin = b.max")
    List<Mofang> getAllChannelLatest();

    @Select("select * from "+Constants.TABLE_Mofang+" where 1=1 " +
            "  and DATE_FORMAT(date_grab,'%Y') = 2019"+
            "  and DATE_FORMAT(date_grab,'%m') = #{month}"+
//            "  and DATE_FORMAT(date_grab,'%Y-%m-%d') = (select DATE_FORMAT(max(date_grab),'%Y-%m-%d') from "+Constants.TABLE_Mofang+") "+
            "  and date_grab> #{date_grab} "+
            "  and sup_objectNo=#{channel}" +
            "  order by date_origin desc")
    List<Mofang> getMofangByChannelAndMonth(@Param("month")Integer month,@Param("date_grab")String date_grab,@Param("channel")Integer channel);

    @Select("select * from "+Constants.TABLE_Mofang+" where 1=1 " +
            "  and date_origin between #{date_start} and #{date_end} "+
            "  and DATE_FORMAT(date_grab,'%Y-%m-%d') = (select DATE_FORMAT(max(date_grab),'%Y-%m-%d') from "+Constants.TABLE_Mofang+") "+
//            "  and DATEDIFF(DATE_FORMAT(date_grab,'%Y-%m-%d'),CURDATE()) = 0 "+
            "  and sup_objectNo=#{channel}" +
            "  order by date_origin desc")
    List<Mofang> getMofangByChannelAndDate(@Param("channel") Integer channel,@Param("date_start") String date_start,@Param("date_end") String date_end);

    @Select("select count(*) from "+Constants.TABLE_Mofang+" where 1=1 " +
            "  and date_origin between #{date_start} and #{date_end} "+
            "  and DATE_FORMAT(date_grab,'%Y-%m-%d') = (select DATE_FORMAT(max(date_grab),'%Y-%m-%d') from "+Constants.TABLE_Mofang+") "+
//            "  and DATEDIFF(DATE_FORMAT(date_grab,'%Y-%m-%d'),CURDATE()) = 0 "+
            "  and sup_objectNo=#{channel}")
    Integer count(@Param("channel") Integer channel,@Param("date_start") String date_start,@Param("date_end") String date_end);

    @Select("select sup_objectNo,SUM(twologincount)twologincount,SUM(newcount)newcount,SUM(dayreten)dayreten\n" +
            "  from "+Constants.TABLE_Mofang+" \n" +
            "  where 1=1 \n" +
            "  and DATE_FORMAT(date_grab,'%Y-%m-%d') = (select DATE_FORMAT(max(date_grab),'%Y-%m-%d') from "+Constants.TABLE_Mofang+") "+
//            "  and DATEDIFF(DATE_FORMAT(date_grab,'%Y-%m-%d'),CURDATE()) = 0 "+
            "  and date_origin between #{date_start} and #{date_end} \n" +
            "  group by sup_objectNo ")
    @Results({
            @Result(column = "sup_objectNo",property = "sup_objectNo"),
            @Result(column = "twologincount",property = "twologincount"),
            @Result(column = "newcount",property = "newcount"),
            @Result(column = "dayreten",property = "dayreten")
    })
    List<MofangStatistical> statisticalList(@Param("date_start") String date_start, @Param("date_end") String date_end);

    @Select("select sup_objectNo,SUM(twologincount) twologincount,SUM(newcount) newcount,SUM(dayreten) dayreten \n" +
            "  from "+Constants.TABLE_Mofang+" \n" +
            "  where 1=1 \n" +
            "  and DATE_FORMAT(date_grab,'%Y-%m-%d') = (select DATE_FORMAT(max(date_grab),'%Y-%m-%d') from "+Constants.TABLE_Mofang+") "+
//            "  and DATEDIFF(DATE_FORMAT(date_grab,'%Y-%m-%d'),CURDATE()) = 0 "+
            "  and DATE_FORMAT(date_grab,'%Y') = 2019" +
            "  and DATE_FORMAT(date_origin,'%m') = #{month} "+
            "  group by sup_objectNo ")
    @Results({
            @Result(column = "sup_objectNo",property = "sup_objectNo"),
            @Result(column = "twologincount",property = "twologincount"),
            @Result(column = "newcount",property = "newcount"),
            @Result(column = "dayreten",property = "dayreten")
    })
    List<MofangStatistical> monthLive(@Param("month")Integer month);

}
