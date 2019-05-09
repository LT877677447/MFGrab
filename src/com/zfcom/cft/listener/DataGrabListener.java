package com.zfcom.cft.listener;

import com.alibaba.fastjson.JSONObject;
import com.zfcom.cft.utils.MFGather;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DataGrabListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        MFGather mfGather = new MFGather();
        mfGather.main(new String[]{});
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

}
