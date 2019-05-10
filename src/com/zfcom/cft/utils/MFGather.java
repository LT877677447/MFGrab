package com.zfcom.cft.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.junit.Test;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;



@SuppressWarnings("Duplicates")
public class MFGather {

    public String officalSite = "mofangapp.com:3002";
    public String username = "@lin888888";
    public String password = "1902213295";

    public String loginURL = "http://v1-login.v1.mofangapp.com/1/login";
    public String allTasksURL = "http://lin888888.v1.mofangapp.com/1/classes/Task";
    public String taskDetailURL = "http://lin888888.v1.mofangapp.com/1/classes/RetentionBak";

    public JSONObject loginResponse = null;
    public JSONObject allTasksResponse = null;

    public MFGather() {

    }

    public JSONObject login() {
        try {

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("password", password);
            jsonObject.put("username", username);

            jsonObject.put("_ApplicationId", "5btyhy0xy1rDHjriDePtLARpbaopMSIw");
            jsonObject.put("_ClientVersion", "js0.0.1");
            jsonObject.put("_method", "GET");

            JSONObject response = IHTTPUtil.post(loginURL, getHeaders(), jsonObject.toString(), 0);

            return response;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public JSONObject tasks() {
        try {

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("count", 1);
            jsonObject.put("limit", 1000);
            jsonObject.put("keys", "twologincount,twologin,finalretencount,taskid,taskname,apkname,newcount,retentioncount,finaltaskresult,taskresult,taskcount,phones,offline,state,retensetting,note,jiaoben,apk,taskCreatedAt,taskObjectId");
            jsonObject.put("order", "-createdAt");
            jsonObject.put("skip", 0);

//            jsonObject.put("_ApplicationId", loginResponse.optString("appid"));
            jsonObject.put("_ApplicationId", loginResponse.getString("appid"));
            jsonObject.put("_ClientVersion", "js0.0.1");
            jsonObject.put("_method", "GET");
            jsonObject.put("_InstallationId", "0bcadd0c-54b5-2aaf-786f-41f4069390cd");
//            jsonObject.put("_MasterKey", loginResponse.optString("restid"));
            jsonObject.put("_MasterKey", loginResponse.getString("restid"));

            JSONObject whereJsonObject = new JSONObject();
            whereJsonObject.put("page", 1);

            jsonObject.put("where", whereJsonObject);

            JSONObject response = IHTTPUtil.post(allTasksURL, getHeaders(), jsonObject.toString(), 0);
            return response;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public JSONObject detail(String objectId) {
        try {

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("count", 1);
            jsonObject.put("limit", 1000);
            jsonObject.put("order", "-createdAt");
            jsonObject.put("skip", 0);

//            jsonObject.put("_ApplicationId", loginResponse.optString("appid"));
            jsonObject.put("_ApplicationId", loginResponse.getString("appid"));
            jsonObject.put("_ClientVersion", "js0.0.1");
            jsonObject.put("_method", "GET");
            jsonObject.put("_InstallationId", "0bcadd0c-54b5-2aaf-786f-41f4069390cd");
//            jsonObject.put("_MasterKey", loginResponse.optString("restid"));
            jsonObject.put("_MasterKey", loginResponse.getString("restid"));

            JSONObject whereJsonObject = new JSONObject();
            jsonObject.put("where", whereJsonObject);

            JSONObject taskJsonObject = new JSONObject();
            taskJsonObject.put("className", "Task");
            taskJsonObject.put("objectId", objectId);
            taskJsonObject.put("__type", "Pointer");
            whereJsonObject.put("task", taskJsonObject);

            JSONObject response = IHTTPUtil.post(taskDetailURL, getHeaders(), jsonObject.toString(), 0);

            return response;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    private static Map<String, Object> getHeaders() {
        Map<String, Object> headers = new HashMap<String, Object>();
        headers.put("Content-Type", "text/plain");
        headers.put("Origin", "http://mofangapp.com:3002");
        headers.put("Referer", "http://mofangapp.com:3002");
        headers.put("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36");
        return headers;
    }

    public static void main(String[] args) {
        MFGather main = new MFGather();
        main.loginResponse = main.login();

        main.allTasksResponse = main.tasks();
        //YmixFNUGyl
//        JSONArray tasks = main.allTasksResponse.optJSONArray("results");
        JSONArray tasks = main.allTasksResponse.getJSONArray("results");

        //464=yiyuan;625=oppo;626=vivo;627=huawei;628=xiaomi;629=qq
        String desTask = "464 625 626 627 628 629";
//        for (int i = 0; i < tasks.length(); i++) {
        for (int i = 0; i < tasks.size(); i++) {
//            JSONObject result = tasks.optJSONObject(i);
            JSONObject result = tasks.getJSONObject(i);
//            int taskid = result.optInt("taskid");
            int taskid = result.getInteger("taskid");

            if (desTask.contains("" + taskid)) {
//                String taskObjectId = result.optString("objectId");
                String taskObjectId = result.getString("objectId");

                int sup_objectNo;
                String sup_objectId;
                int twologincount;
                int newcount;
                int dayreten;
                String objectId;
                Date date_origin = null;
                Date date_grab = new Date();

                sup_objectNo = taskid;
                sup_objectId = taskObjectId;

                JSONObject json = main.detail(taskObjectId);
//                JSONArray details = json.optJSONArray("results");
                JSONArray details = json.getJSONArray("results");
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

//                for (int i2 = 0; i2 < details.length(); i2++) {
                for (int i2 = 0; i2 < details.size(); i2++) {
//                    JSONObject detail = details.optJSONObject(i2);
                    JSONObject detail = details.getJSONObject(i2);
//                    twologincount = detail.optInt("twologincount");
                    twologincount = detail.getIntValue("twologincount");
//                    newcount = detail.optInt("newcount");
                    newcount = detail.getInteger("newcount");
//                    dayreten = detail.optInt("dayreten");
                    dayreten = detail.getInteger("dayreten");
//                    objectId = detail.optString("objectId");
                    objectId = detail.getString("objectId");

//                    String temp_date_origin = detail.optString("createdAt");//2019-04-25T16:00:30.564Z
                    String temp_date_origin = detail.getString("createdAt");//2019-04-25T16:00:30.564Z
                    try {
                        temp_date_origin = temp_date_origin.substring(0, 10) + " " + temp_date_origin.substring(11, 13) + ":" + temp_date_origin.substring(14, 16) + ":" + temp_date_origin.substring(17, 19) + "." + temp_date_origin.substring(20, 23);
                        date_origin = format.parse(temp_date_origin);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    newMoFang(sup_objectNo, sup_objectId, twologincount, newcount, dayreten, objectId, date_origin, date_grab);
                }

            }
        }
    }

    public static void refresh(){
        System.out.println("!!!!!!start!!!!!!");
        System.out.println("!!!!!!start!!!!!!");
        System.out.println("!!!!!!start!!!!!!");

        boolean refreshed = refreshed();
        if(!refreshed)
            MFGather.main(null);

        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_MONTH,c.get(Calendar.DAY_OF_MONTH)+1);
        c.set(Calendar.HOUR_OF_DAY,0);
        c.set(Calendar.MINUTE,0);
        c.set(Calendar.SECOND,0);


        Timer timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                MFGather.main(null);
            }
        },c.getTime(),1000*60*60*24);

    }






    @Test
    public void t1() {
        Calendar c = Calendar.getInstance();
        System.out.println(c.get(Calendar.MONTH));
        System.out.println(c.get(Calendar.DAY_OF_MONTH));
        System.out.println(c.get(Calendar.HOUR_OF_DAY)); //0-23
        System.out.println(c.get(Calendar.MINUTE));
        System.out.println(c.get(Calendar.SECOND));
        System.out.println(c.getTime());
    }

    public static boolean refreshed(){
        String sql = "select COUNT(*) from yun.dbo.tb_mofang\n" +
                "  where DATEDIFF(D,date_grab,GETDATE()) = 0";
        Connection connection = null;
        PreparedStatement ps = null;
        boolean refreshed = false;
        try{
            connection = DBCPUtil.getConnection();
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            if(rs.getInt(1) > 0){
                refreshed = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                ps.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return refreshed;
    }

    public static void newMoFang(int sup_objectNo, String sup_objectId, int twologincount, int newcount, int dayreten, String objectId, Date date_origin, Date date_grab) {
        String sql = "insert into [yun].[dbo].[tb_mofang](sup_objectNo,sup_objectId,twologincount,newcount,dayreten,objectId,date_origin,date_grab) values(?,?,?,?,?,?,?,?)";
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = DBCPUtil.getConnection();
            ps = connection.prepareStatement(sql);
            System.out.println("::::::::ps" + ps);

            ps.setInt(1, sup_objectNo);
            ps.setString(2, sup_objectId);
            ps.setInt(3, twologincount);
            ps.setInt(4, newcount);
            ps.setInt(5, dayreten);
            ps.setString(6, objectId);
            ps.setTimestamp(7, new Timestamp(date_origin.getTime()));
            ps.setTimestamp(8, new Timestamp(date_grab.getTime()));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ps.close();
                connection.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

    }


}
