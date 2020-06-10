package com.bbs.service.impl;

import com.bbs.domain.Analysis;
import com.bbs.domain.User;
import com.bbs.mapper.AnalysisMapper;
import com.bbs.service.AnalysisService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @description: 分析Service实现类
 **/
@Service
public class AnalysisServiceImpl implements AnalysisService {

    Logger logger = Logger.getLogger(AnalysisServiceImpl.class);

    @Autowired
    private AnalysisMapper analysisMapper;

    @Override
    public int insertAnalysis(Analysis analysis) {
        return analysisMapper.insertAnalysis(analysis);
    }

    @Override
    public int getBrowseVolumeByDate(User user, Date dateFrom, Date dateTo) {
        int user_id = user.getUser_id();
        logger.info("user_id:" + user_id);
        logger.info("dateFrom:" + dateFrom);
        logger.info("dateTo:" + dateTo);
        return analysisMapper.getBrowseVolumeByDate(user_id, dateFrom, dateTo);
    }

    @Override
    public int getReplyingQuantityByDate(User user, Date dateFrom, Date dateTo) {
        int user_id = user.getUser_id();
        return analysisMapper.getReplyingQuantityByDate(user_id, dateFrom, dateTo);
    }
}
