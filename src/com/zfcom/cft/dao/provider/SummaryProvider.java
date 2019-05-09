package com.zfcom.cft.dao.provider;

import com.zfcom.cft.utils.Constants;
import com.zfcom.cft.utils.MyDateTool;
import com.zfcom.cft.utils.PageModel;
import org.apache.ibatis.jdbc.SQL;

import java.util.Date;
import java.util.Map;

@SuppressWarnings("Duplicates")
public class SummaryProvider {
    public String getMofangByChannel(Integer no) {
        String sql = new SQL() {
            {
                SELECT(" * ");
                FROM(Constants.TABLE_Mofang);
                WHERE(" sup_objectNo = "+no+" ");
                WHERE(" date_grab >'"+MyDateTool.Format("yyyy-MM-dd",new Date())+"'");
                ORDER_BY("date_origin desc");
            }
        }.toString();
        return sql;
    }


}
