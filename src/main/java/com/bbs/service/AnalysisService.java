package com.bbs.service;

import com.bbs.domain.Analysis;
import com.bbs.domain.User;

import java.util.Date;

/**
 * @description: 分析Service
 **/
public interface AnalysisService {


    /**
     * 插入分析
     * @param analysis
     * @return
     */
    int insertAnalysis(Analysis analysis);

    /**
     * 根据日期获取浏览量
     * @param dateFrom
     * @return
     */
    int getBrowseVolumeByDate(User user, Date dateFrom, Date dateTo);

    /**
     * 根据日期获取回帖量
     * @param dateFrom
     * @return
     */
    int getReplyingQuantityByDate(User user, Date dateFrom, Date dateTo);
}
