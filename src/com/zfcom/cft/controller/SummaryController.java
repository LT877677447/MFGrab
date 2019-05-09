package com.zfcom.cft.controller;

import com.zfcom.cft.entity.Mofang;
import com.zfcom.cft.bo.MofangStatistical;
import com.zfcom.cft.service.SummaryService;
import com.zfcom.cft.utils.MyDateTool;
import com.zfcom.cft.utils.PageModel;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@SuppressWarnings("Duplicates")
@Controller
public class SummaryController {
    private static final Log logger = LogFactory.getLog(SummaryController.class);

    @Autowired
    @Qualifier("SummaryService")
    private SummaryService mofangService;

    @RequestMapping("/Summary/List")
    public ModelAndView summaryPage(HttpServletRequest request,
                                    HttpServletResponse response,
                                    ModelAndView modelAndView,
                                    @ModelAttribute PageModel pageModel) {
        //默认查当月 1号-今日
        if (pageModel.getDate_1() == null || pageModel.getDate_2() == null) {
            Calendar cal = Calendar.getInstance();
            pageModel.setDate_2(cal.getTime());
            cal.set(Calendar.DAY_OF_MONTH, 1);
            pageModel.setDate_1(cal.getTime());
        }

        Calendar cal = Calendar.getInstance();
        cal.setTime(pageModel.getDate_2());
        cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH) + 1);
        Date query_date_2 = cal.getTime();
        List<Mofang> list = mofangService.getMofangByChannelAndDate(pageModel, pageModel.getChannel(), MyDateTool.Format("yyyy-MM-dd", pageModel.getDate_1()), MyDateTool.Format("yyyy-MM-dd", query_date_2));

        List<String> date_origin = new ArrayList<>();
        for (Mofang mofang : list) {
            date_origin.add(MyDateTool.Format("yyyy-MM-dd", mofang.getDate_origin()));
        }

        modelAndView.setViewName("/content/index/Summary.jsp");
        modelAndView.addObject("SummaryList", list);
        modelAndView.addObject("dateOriginList", date_origin);
        modelAndView.addObject("pageModel", pageModel);
        return modelAndView;
    }

    @RequestMapping("/statistical/List")
    public ModelAndView statisticalPage(HttpServletRequest request,
                                    HttpServletResponse response,
                                    ModelAndView modelAndView,
                                    @ModelAttribute PageModel pageModel) {
        //if not choose date
        if (pageModel.getDate_1() == null || pageModel.getDate_2() == null) {
            Calendar cal = Calendar.getInstance();
            pageModel.setDate_2(cal.getTime());
            cal.set(Calendar.DAY_OF_MONTH, 1);
            pageModel.setDate_1(cal.getTime());
        }
        //handle date to query
        Calendar cal = Calendar.getInstance();
        cal.setTime(pageModel.getDate_2());
        cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH) + 1);
        Date query_date_2 = cal.getTime();
        List<MofangStatistical> list = mofangService.statisticalList(MyDateTool.Format("yyyy-MM-dd",pageModel.getDate_1()),MyDateTool.Format("yyyy-MM-dd",query_date_2));
        //other params send to page
        String date_range = "从 "+MyDateTool.Format("yyyy-MM-dd", pageModel.getDate_1());
        date_range += " 到 " +MyDateTool.Format("yyyy-MM-dd", pageModel.getDate_2());
        int sumNewCount=0,sumDayReten=0,sumTwoLoginCount=0;
        for(MofangStatistical statistical:list){
            sumNewCount += statistical.getNewcount();
            sumDayReten += statistical.getDayreten();
            sumTwoLoginCount += statistical.getTwologincount();
        }
        Map<String,Object> map = new HashMap<>();
        map.put("date_range",date_range);
        map.put("sumNewCount",sumNewCount);
        map.put("sumDayReten",sumDayReten);
        map.put("sumTwoLoginCount",sumTwoLoginCount);

        modelAndView.setViewName("/content/index/Statistical.jsp");
        modelAndView.addObject("StatisticalList", list);
        modelAndView.addObject("pageModel", pageModel);
        modelAndView.addObject("map",map);

        return modelAndView;
    }

    @RequestMapping("/Month2Live/List")
    public ModelAndView MonthLive(HttpServletRequest request,
                                    HttpServletResponse response,
                                    ModelAndView modelAndView,
                                    @ModelAttribute PageModel pageModel) {
        //if not choose month,default current month
        if (pageModel.getMonth() == null) {
            Calendar cal = Calendar.getInstance();
            pageModel.setMonth(cal.get(Calendar.MONTH)+1);
        }

        List<MofangStatistical> list = mofangService.monthLive(pageModel.getMonth());
        int total = 0;
        for(MofangStatistical statistical:list){
            statistical.setNumberOfMonthLive(statistical.getNewcount() + statistical.getDayreten()/3);
            total += statistical.getNumberOfMonthLive();
        }

        Map<String,Object> map = new HashMap<>();
        map.put("Month",pageModel.getMonth());
        map.put("total",total);

        modelAndView.setViewName("/content/index/MonthLive.jsp");
        modelAndView.addObject("StatisticalList", list);
        modelAndView.addObject("pageModel", pageModel);
        modelAndView.addObject("map",map);
        return modelAndView;
    }


    @Test
    public void t1() {
        Calendar c = Calendar.getInstance();
        int month = c.get(Calendar.MONTH);
        System.out.println(month);//4
    }
}
