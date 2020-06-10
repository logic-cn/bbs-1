package com.bbs.mapper;

import com.bbs.domain.Analysis;
import com.bbs.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;

/**
 * @description: 分析Mapperya
 * @create: 2020-04-03 18:15
 **/
public interface AnalysisMapper {


    /**
     *  插入浏览记录
     * @param analysis
     * @return
     */
    @Insert("INSERT INTO analysis " +
            "(tip_id, user_id, create_date) " +
            "VALUES (#{tip_id}, #{user_id}, #{create_date}" +
            ")")
    int insertAnalysis(Analysis analysis);


    /**
     * 查询浏览量
     * @param user_id
     * @param dateFrom
     * @param dateTo
     * @return
     */
    @Select("<script>" +
            "SELECT count(*) FROM analysis " +
            "WHERE user_id = #{user_id}" +
            "<if test='dateFrom != null'>" +
            "AND create_date <![CDATA[ >= ]]> #{dateFrom}" +
            "</if>" +
            "<if test='dateTo != null'>" +
            "AND create_date <![CDATA[ <= ]]> #{dateTo}" +
            "</if>" +
            "</script>")
    int getBrowseVolumeByDate(@Param("user_id") int user_id, @Param("dateFrom") Date dateFrom, @Param("dateTo") Date dateTo);

    @Select("<script>" +
            "SELECT count(*) FROM reply " +
            "WHERE tip_id IN (SELECT tip_id FROM tip WHERE user_id = #{user_id})" +
            "<if test='dateFrom != null'>" +
            "AND reply_publishTime <![CDATA[ >= ]]> #{dateFrom}" +
            "</if>" +
            "<if test='dateTo != null'>" +
            "AND reply_publishTime <![CDATA[ <= ]]> #{dateTo}" +
            "</if>" +
            "</script>")
    int getReplyingQuantityByDate(@Param("user_id") int user_id, @Param("dateFrom") Date dateFrom, @Param("dateTo") Date dateTo);

}
