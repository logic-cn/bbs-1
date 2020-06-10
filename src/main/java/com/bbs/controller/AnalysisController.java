package com.bbs.controller;

import com.bbs.domain.Tip;
import com.bbs.domain.User;
import com.bbs.service.AnalysisService;
import com.bbs.service.TipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @description: 分析Controller
 **/
@Controller
public class AnalysisController {

    @Autowired
    private HttpSession session;

    @Autowired
    private AnalysisService analysisService;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private TipService tipService;

    @ResponseBody
    @RequestMapping(value = "AnalysisServlet.do", method = RequestMethod.POST)
    public HashMap<String, Integer> analysisServlet(@RequestParam(name = "dateFrom", required = false) String dateFrom,
                                                    @RequestParam(name = "dateTo", required = false) String dateTo) {
        Date newDateFrom = null;
        Date newDateTo = null;

        HashMap<String, Integer> result = new HashMap<>();
        // 判断用户是否登录
        User user = (User) session.getAttribute("USER");
        if (user != null) {
            if (dateFrom == null && dateTo == null) {
                // 默认的开始时间
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(new Date());
                calendar.set(Calendar.HOUR_OF_DAY, 0);
                calendar.set(Calendar.MINUTE, 0);
                calendar.set(Calendar.SECOND, 0);
                newDateFrom = calendar.getTime();
                // 默认的结束时间
                Calendar calendar2 = Calendar.getInstance();
                calendar2.setTime(new Date());
                calendar2.set(Calendar.HOUR_OF_DAY, 23);
                calendar2.set(Calendar.MINUTE, 59);
                calendar2.set(Calendar.SECOND, 59);
                newDateTo = calendar2.getTime();
                int browseVolumeByDate = analysisService.getBrowseVolumeByDate(user, newDateFrom, newDateTo);
                int replyingQuantityByDate = analysisService.getReplyingQuantityByDate(user, newDateFrom, newDateTo);
                result.put("analysisOne", browseVolumeByDate);
                result.put("analysisTwo", replyingQuantityByDate);
            }
            if (session.getAttribute("ANALYSISONE") != null) {
                int analysisOne = (Integer) session.getAttribute("ANALYSISONE");
                result.put("analysisOne", analysisOne);
            }
            if (session.getAttribute("ANALYSISTWO") != null) {
                int analysisTwo = (Integer) session.getAttribute("ANALYSISTWO");
                result.put("analysisTwo", analysisTwo);
            }
        } else {
            int values = 0;
            result.put("analysisOne", values);
            result.put("analysisTwo", values);
        }
        return result;
    }

    @RequestMapping(value = "AnalysisServlets.do", method = RequestMethod.POST)
    public ModelAndView analysisServletPage(@RequestParam(name = "dateFrom", required = false) String dateFrom,
                                            @RequestParam(name = "dateTo", required = false) String dateTo) {
        Date newDateFrom = null;
        Date newDateTo = null;
        ModelAndView mv = new ModelAndView();
        HashMap<String, Integer> result = new HashMap<>();
        // 判断用户是否登录
        User user = (User) session.getAttribute("USER");
        if (user != null) {
            if (dateFrom == null && dateTo == null) {
                // 默认的开始时间
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(new Date());
                calendar.set(Calendar.HOUR_OF_DAY, 0);
                calendar.set(Calendar.MINUTE, 0);
                calendar.set(Calendar.SECOND, 0);
                newDateFrom = calendar.getTime();
                // 默认的结束时间
                Calendar calendar2 = Calendar.getInstance();
                calendar2.setTime(new Date());
                calendar2.set(Calendar.HOUR_OF_DAY, 23);
                calendar2.set(Calendar.MINUTE, 59);
                calendar2.set(Calendar.SECOND, 59);
                newDateTo = calendar2.getTime();
            } else {
                try {
                    if (dateFrom != null && !dateTo.isEmpty()) {
                        newDateFrom = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateFrom);
                    }
                    if (dateTo != null && !dateTo.isEmpty()) {
                        newDateTo = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTo);
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            int browseVolumeByDate = analysisService.getBrowseVolumeByDate(user, newDateFrom, newDateTo);
            int replyingQuantityByDate = analysisService.getReplyingQuantityByDate(user, newDateFrom, newDateTo);
            session.setAttribute("ANALYSISONE", browseVolumeByDate);
            session.setAttribute("ANALYSISTWO", replyingQuantityByDate);
        }
        List<Tip> myTipList = tipService.getMainPageTips();
        request.setAttribute("tips", myTipList);
        mv.setViewName("main.jsp");
        return mv;
    }
}
