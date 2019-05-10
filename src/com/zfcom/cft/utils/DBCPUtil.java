package com.zfcom.cft.utils;


import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSourceFactory;
import org.junit.Test;

public class DBCPUtil {
    private static Properties properties=null;
    private static DataSource dataSource=null;
    private static Connection connection=null;
    static{
        try {
            //获取配置文件，转换成流
//            FileInputStream fileInputStream=new FileInputStream("src/resource/dbcp.properties");
            InputStream fileInputStream = DBCPUtil.class.getClassLoader().getResourceAsStream("resource/dbcp.properties");
            //创建properties对象
            properties=new Properties();
            //加载流
            properties.load(fileInputStream);
            //创建dataSource对象
            dataSource=BasicDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection(){
        try {
            //得到connection对象
            connection=dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Test
    public void t1(){
        Connection c = getConnection();
        System.out.println(c);

    }

}
