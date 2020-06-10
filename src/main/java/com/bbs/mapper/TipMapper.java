package com.bbs.mapper;

import com.bbs.domain.Tip;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface TipMapper {
    /**
     * 添加贴子【已弃用】
     *
     * @param tip 贴子对象
     * @return
     */
    @Deprecated
    @Insert("INSERT INTO tip " +
            "(tip_title, tip_content, user_id, tab_id, tip_publishTime, tip_modifyTime ) " +
            "VALUES " +
            "(#{tip_title}, #{tip_content}, #{user_id}, #{tab_id}, #{tip_publishTime}, #{tip_modifyTime} " +
            ")")
    int insTip(Tip tip);

    /**
     * 添加贴子V2
     * 发贴时间和修改时间由数据库自动取当前时间
     *
     * @param tip 贴子对象
     * @return
     */
    @Insert("INSERT INTO tip " +
            "(tip_title, tip_content, user_id, tab_id ) " +
            "VALUES (" +
            "#{tip_title}, #{tip_content}, #{user_id}, #{tab_id} " +
            ")")
    int insTipV2(Tip tip);

    /**
     * 获取所有贴子
     *
     * @return List<Tip>
     */
    @Select("SELECT * FROM tip")
    List<Tip> selTipAll();

    /**
     * 查询贴子
     *
     * @param tip_id 贴子id
     * @return 贴子对象
     */
    @Select("SELECT * FROM tip WHERE tip_id = #{tip_id}")
    Tip selTipByTipId(int tip_id);

    /**
     * 贴子点击量+1
     *
     * @param tip_id 贴子id
     * @return
     */
    @Update("UPDATE tip SET " +
            "tip_click = tip_click + 1 " +
            "WHERE tip_id = #{tip_id}")
    int updTipClick(int tip_id);

    /**
     * 逻辑删贴
     * 修改入参tip_status为tip_isDeleted
     * 修改方法名updTipStatusToDisable为updTipIsDeleted
     *
     * @param tip_id 贴子id
     * @return
     */
    @Update("UPDATE tip SET " +
            "tip_isDeleted = 1 " +
            "WHERE tip_id = #{tip_id}")
    int updTipIsDeleted(int tip_id);

    /**
     * 取消逻辑删贴
     * 修改入参tip_status为tip_isDeleted
     * 修改方法名updTipStatusToEnable为updTipIsNotDeleted
     *
     * @param tip_id 贴子id
     * @return
     */
    @Update("UPDATE tip SET " +
            "tip_isDeleted = 0 " +
            "WHERE tip_id = #{tip_id}")
    int updTipIsNotDeleted(int tip_id);

    /**
     * 结贴操作
     *
     * @param tip_id 贴子id
     * @return
     */
    @Update("UPDATE tip SET " +
            "tip_isKnot = 1 " +
            "WHERE tip_id = #{tip_id}")
    int updTipToKnot(int tip_id);

    /**
     * 取消结贴
     *
     * @param tip_id 贴子id
     * @return
     */
    @Update("UPDATE tip SET " +
            "tip_isKnot = 0 " +
            "WHERE tip_id = #{tip_id}")
    int updTipToUnKnot(int tip_id);

    /**
     * 【已弃用，改为查询置顶和未置顶】
     * 获取所有贴子（按更新时间倒序排列）
     *
     * @return List<Tip>
     */
    @Deprecated
    @Select("SELECT * FROM tip ORDER BY tip_modifyTime DESC")
    List<Tip> selTipAllForModifyTimeDesc();

    /**
     * 统计贴子回复数
     *
     * @param tip_id 贴子id
     * @return
     */
    @Select("SELECT COUNT(reply_id) FROM reply " +
            "WHERE tip_id = #{tip_id}")
    int selReplyCountedByTipId(int tip_id);

    /**
     * 刷新贴子更新时间
     *
     * @param tip 贴子对象（包含id和修改时间）
     * @return
     */
    @Update("UPDATE tip SET " +
            "tip_modifyTime = #{tip_modifyTime} " +
            "WHERE tip_id = ${tip_id}")
    int updModifyTime(Tip tip);

    /**
     * 查询所有贴子id
     *
     * @return List<Integer>含有所有贴子的id
     */
    @Select("SELECT tip_id FROM tip")
    List<Integer> selTipIds();

    /**
     * 更新贴子回复数
     *
     * @param tip_id 贴子id
     * @return
     */
    @Update("UPDATE tip SET tip_replies = " +
            "(SELECT COUNT(reply_id) FROM reply WHERE tip_id = #{tip_id}) " +
            "WHERE tip_id = #{tip_id}")
    int updRepliesByTipId(int tip_id);

    /**
     * 根据关键词查询标题和内容的贴子
     * 仅查询未置顶的
     * @param keyword 关键词
     * @return List<Tip>
     */
    @Select("SELECT * FROM tip " +
            "WHERE (tip_title LIKE '%${_parameter}%'OR tip_content LIKE '%${_parameter}%') " +
            "AND tip_isTop = 0")
    List<Tip> selTipByKeyword(String keyword);

    /**
     * 修改贴子信息
     *
     * @param tip 贴子对象
     */
    @Update("UPDATE tip SET " +
            "tip_title = #{tip_title}, " +
            "tip_content = #{tip_content}, " +
            "tip_modifyTime = #{tip_modifyTime}, " +
            "tip.tab_id = ${tab_id} " +
            "WHERE tip_id = ${tip_id}")
    int updTip(Tip tip);

    /**
     * 修改贴子回复数（+1）
     *
     * @param tip 贴子对象
     * @return
     */
    @Update("UPDATE tip SET " +
            "tip_replies = tip_replies + 1 " +
            "WHERE tip_id = ${tip_id}")
    int updReplisAddOne(Tip tip);

    /**
     * 贴子置顶
     *
     * @param tip_id 贴子id
     * @return
     */
    @Update("UPDATE tip SET tip_isTop = 1 WHERE tip_id = #{tip_id}")
    int updTipToTop(int tip_id);

    /**
     * 取消置顶
     *
     * @param tip_id 贴子id
     * @return
     */
    @Update("UPDATE tip SET tip_isTop = 0 WHERE tip_id = #{tip_id}")
    int updTipToUnTop(int tip_id);

    /**
     * 更新置顶时间
     *
     * @param tip 贴子对象（需包含id和时间）
     * @return
     */
    @Update("UPDATE tip SET " +
            "tip_topTime = #{tip_topTime} " +
            "WHERE tip_id = ${tip_id}")
    int updTopTime(Tip tip);

    /**
     * 获取所有置顶贴子（按置顶时间倒序排列）
     *
     * @return List<Tip>
     */
    @Select("SELECT * FROM tip WHERE tip_isDeleted = 0 AND tip_isTop = 1 ORDER BY tip_topTime DESC")
    List<Tip> selAllTopTipForTopTimeDesc();

    /**
     * 获取所有未置顶的贴子（按更新时间倒序排列）
     *
     * @return List<Tip>
     */
    @Select("SELECT * FROM tip WHERE tip_isDeleted = 0 AND tip_isTop = 0 ORDER BY tip_modifyTime DESC")
    List<Tip> selAllUnTopTipForModifyTimeDesc();

    /**
     * 根据分类id查询所有贴子
     *
     * @param tab_Id 分类id
     * @return List<Tip>
     */
    @Select("SELECT * FROM tip WHERE tip_isDeleted = 0 AND tab_id = #{tab_id}")
    List<Tip> selAllTipByTabId(int tab_Id);

    /**
     * 根据分类id查询所有贴子id
     *
     * @param tab_Id 分类id
     * @return List<Integer>
     */
    @Select("SELECT tip_id FROM tip WHERE tip_isDeleted = 0 AND tab_id = #{tab_id}")
    List<Integer> selAllTipIdByTabId(int tab_Id);

    /**
     * 根据分类id逻辑删除所有贴子
     * @param tab_id 分类id
     * @return
     */
    @Update("UPDATE tip SET tip_isDeleted = 1 WHERE tab_id = #{tab_id}")
    int updAllTipIsDeletedByTabId(int tab_id);

    /**
     * 根据分类id取消逻辑删除所有贴子
     * @param tab_id 分类id
     * @return
     */
    @Update("UPDATE tip SET tip_isDeleted = 0 WHERE tab_id = #{tab_id}")
    int updAllTipIsNotDeletedByTabId(int tab_id);

    /**
     * 根据版块id查询所有贴子
     * @param forum_id 版块id
     * @return List<Tip>
     */
    @Select("SELECT * FROM tip WHERE tab_id IN (SELECT tab_id FROM tab WHERE forum_id = #{forum_id})")
    List<Tip> selAllTipByForumId(int forum_id);

    /**
     * 根据版块id查询所有贴子id
     * @param forum_id 版块id
     * @return List<Integer>
     */
    @Select("SELECT tip_id FROM tip WHERE tab_id IN (SELECT tab_id FROM tab WHERE forum_id = #{forum_id})")
    List<Integer> selAllTipIdByForumId(int forum_id);

    /**
     * 根据版块id逻辑删除所有贴子
     * @param forum_id 版块id
     * @return
     */
    @Update("UPDATE tip SET tip_isDeleted = 1 WHERE tab_id IN " +
            "(SELECT tab_id FROM tab WHERE forum_id = #{forum_id})")
    int updAllTipIsDeletedByForumId(int forum_id);

    /**
     * 根据版块id取消逻辑删除所有贴子
     * @param forum_id 版块id
     * @return
     */
    @Update("UPDATE tip SET tip_isDeleted = 0 WHERE tab_id IN " +
            "(SELECT tab_id FROM tab WHERE forum_id = #{forum_id})")
    int updAllTipIsNotDeletedByForumId(int forum_id);

    /**
     * 根据 type 查询 活跃帖子
     * @return
     */
    @Select("SELECT * FROM tip WHERE tip_isDeleted = 0 AND (tip_click >= 50 OR tip_replies >= 5) ORDER BY tip_isTop DESC")
    List<Tip> selAllTipByTypeActive();

    /**
     * 根据 type 查询 最近帖子(今天)
     * @return
     */
    @Select("SELECT * FROM tip WHERE tip_isDeleted = 0 AND TO_DAYS(tip_publishTime) = TO_DAYS(NOW()) ORDER BY tip_isTop DESC")
    List<Tip> selAllTipByTypeLately();

    /**
     * 根据 type 查询 结帖帖子
     * @return
     */
    @Select("SELECT * FROM tip WHERE tip_isDeleted = 0 AND tip_isKnot = 1 ORDER BY tip_isTop DESC")
    List<Tip> selAllTipByTypeStop();
}
