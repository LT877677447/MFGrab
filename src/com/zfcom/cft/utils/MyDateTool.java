package com.zfcom.cft.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyDateTool {

    public static String Format(String parttern, Date date){
        return new SimpleDateFormat(parttern).format(date);
    }



}
