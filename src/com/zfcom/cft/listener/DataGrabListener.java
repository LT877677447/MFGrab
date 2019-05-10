package com.zfcom.cft.listener;

        import com.zfcom.cft.utils.MFGather;

        import javax.servlet.ServletContextEvent;
        import javax.servlet.ServletContextListener;
        import javax.servlet.annotation.WebListener;

@WebListener
public class DataGrabListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        MFGather.refresh();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

}
