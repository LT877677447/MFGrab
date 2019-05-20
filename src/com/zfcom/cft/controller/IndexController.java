package com.zfcom.cft.controller;

import com.zfcom.cft.entity.po.User;
import com.zfcom.cft.service.IndexService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class IndexController {
    private static final Log logger = LogFactory.getLog(IndexController.class);

    @Autowired
    @Qualifier("IndexService")
    private IndexService indexService;


    @ResponseBody
    @RequestMapping("/index/login")
    public Object Login(@RequestBody User user,
                        HttpServletRequest request,
                        HttpServletResponse response)
            throws IOException {
        Map<String, Object> map = new HashMap<>();
        User resUser = indexService.login(user);

        if (resUser == null) {
            map.put("res", "not exist");
            return map;
        }
        request.getSession().setAttribute("user",resUser);
        request.getSession().setMaxInactiveInterval(60*120);//以秒为单位，即在没有活动120分钟后，session将失效
        map.put("res", "exist");
        return map;
    }

    @RequestMapping("/index/index")
    public ModelAndView Index(ModelAndView mv) {
        mv.setViewName("/content/index/index.jsp");
        return mv;
    }



}
