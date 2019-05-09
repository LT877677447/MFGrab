//package com.zfcom.cft.controller;
//
//import com.zfcom.cft.entity.AdvtaskInfo;
//import com.zfcom.cft.service.AdvtaskInfoService;
//import com.zfcom.cft.service.ApkInfoService;
//import com.zfcom.cft.utils.MyDateTool;
//import com.zfcom.cft.utils.PageModel;
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//@SuppressWarnings("Duplicates")
//@Controller
//public class AdvtaskInfoController {
//    private static final Log logger = LogFactory.getLog(AdvtaskInfoController.class);
//
//    @Autowired
//    @Qualifier("AdvtaskInfoService")
//    private AdvtaskInfoService advtaskInfoService;
//
//    @Autowired
//    @Qualifier("ApkInfoService")
//    private ApkInfoService apkInfoService;
//
//    @RequestMapping("/index/AdvList")
//    public ModelAndView ApkInfoPage(HttpServletRequest request,
//                                    HttpServletResponse response,
//                                    ModelAndView modelAndView,
//                                    @ModelAttribute PageModel pageModel,
//                                    @ModelAttribute AdvtaskInfo advtaskInfo) {
//        List<AdvtaskInfo> ls = advtaskInfoService.selectByPage(advtaskInfo, pageModel);
//        modelAndView.setViewName("/content/index/Summary.jsp");
//        modelAndView.addObject("AdvtaskInfo", advtaskInfo);
//        modelAndView.addObject("AdvtaskInfoList", ls);
//        modelAndView.addObject("pageModel", pageModel);
//        return modelAndView;
//    }
//
//    @ResponseBody
//    @RequestMapping("/AdvList/PageQuery")
//    public Object PageQuery(HttpServletRequest request,
//                            HttpServletResponse response,
//                            @ModelAttribute PageModel pageModel,
//                            @ModelAttribute AdvtaskInfo advtaskInfo) {
//        Map<String, Object> map = new HashMap<>();
//        List<AdvtaskInfo> ls = advtaskInfoService.selectByPage(advtaskInfo, pageModel);
//        List<String> startDate = new ArrayList<>();
//        List<String> endDate = new ArrayList<>();
//
//        for (AdvtaskInfo result : ls) {
//            startDate.add(MyDateTool.Format("yyyy年MM月dd日 HH时mm分ss秒", result.getStart_date()));
//        }
//        for (AdvtaskInfo result : ls) {
//            endDate.add(MyDateTool.Format("yyyy年MM月dd日 HH时mm分ss秒", result.getEnd_date()));
//        }
//        map.put("startDate", startDate);
//        map.put("endDate", endDate);
//        map.put("AdvtaskInfoList", ls);
//        map.put("pageModel", pageModel);
//        map.put("AdvtaskInfo", advtaskInfo);
//        return map;
//    }
//
//    @ResponseBody
//    @RequestMapping("/AdvList/Edit")
//    public Object Edit(HttpServletRequest request,
//                       HttpServletResponse response,
//                       @ModelAttribute PageModel pageModel,
//                       @RequestBody AdvtaskInfo advtaskInfo) {
//        Map<String, Object> map = new HashMap<>();
//        //校验apkid
//        Integer apkid = advtaskInfo.getApkid();
//        List<Integer> apkidList = apkInfoService.selectAllId();
//        boolean exist = apkidList.contains(apkid);
//        if (!exist) {
//            map.put("result", "id not exist");
//            return map;
//        }
//        map.put("result", "id exist");
//        advtaskInfoService.update(advtaskInfo);
//        return map;
//    }
//
//    @ResponseBody
//    @RequestMapping("/AdvList/Delete")
//    public Object Delete(HttpServletRequest request,
//                         HttpServletResponse response,
//                         @ModelAttribute PageModel pageModel,
//                         @RequestBody AdvtaskInfo advtaskInfo) {
//        Map<String, Object> map = new HashMap<>();
//        try {
//            advtaskInfoService.deleteWithAdvid(advtaskInfo);
//            map.put("result", "success");
//        } catch (Exception e) {
//            e.printStackTrace();
//            map.put("result", "failure");
//        }
//        return map;
//    }
//
//    @ResponseBody
//    @RequestMapping("/AdvList/add")
//    public Object Add(HttpServletRequest request,
//                      HttpServletResponse response,
//                      @ModelAttribute PageModel pageModel,
//                      @RequestBody AdvtaskInfo advtaskInfo) {
//        Map<String, Object> map = new HashMap<>();
//        if (null == advtaskInfo.getAdv_content()) {
//            advtaskInfo.setAdv_content("");
//        }
//        if (null == advtaskInfo.getBdid()) {
//            advtaskInfo.setBdid(0);
//        }
//        if (null == advtaskInfo.getChannelid()) {
//            advtaskInfo.setChannelid(0);
//        }
//        if (null == advtaskInfo.getClientbean_info()) {
//            advtaskInfo.setClientbean_info("");
//        }
//        if (null == advtaskInfo.getCpid()) {
//            advtaskInfo.setCpid(0);
//        }
//        if (null == advtaskInfo.getExt()) {
//            advtaskInfo.setExt("");
//        }
//        if (null == advtaskInfo.getParams()) {
//            advtaskInfo.setParams("");
//        }
//        if (null == advtaskInfo.getPrior()) {
//            advtaskInfo.setPrior(1);
//        }
//        if (null == advtaskInfo.getRem_timeline()) {
//            advtaskInfo.setRem_timeline(-1);
//        }
//        if (null == advtaskInfo.getTimeline()) {
//            advtaskInfo.setTimeline(-1);
//        }
//        if (null == advtaskInfo.getRemain_lock_dev()) {
//            advtaskInfo.setRemain_lock_dev(0);
//        }
//        if (null == advtaskInfo.getServerbean()) {
//            advtaskInfo.setServerbean("");
//        }
//        try {
//            advtaskInfoService.add(advtaskInfo);
//            map.put("result", "success");
//        } catch (Exception e) {
//            e.printStackTrace();
//            map.put("result", "failure");
//        }
//        return map;
//    }
//
//}
