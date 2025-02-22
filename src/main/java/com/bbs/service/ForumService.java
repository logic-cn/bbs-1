package com.bbs.service;

import com.bbs.domain.Forum;

import java.util.List;

public interface ForumService {

    /**
     * 获取所有的大板块
     * @return List<Forum>
     */
    List<Forum> getAllForum();

    /**
     * 由大板块id获得大板块
     * @param forum_id 大板块id
     * @return 大板块对象
     */
    Forum getForumByForumId(int forum_id);

    /**
     * 修改大板块信息
     * @param forum 大板块对象
     * @return
     */
    String modifyForum(Forum forum);

    /**
     * 添加版块
     * @param forum 版块对象
     * @return
     */
    String addForum(Forum forum);

    /**
     * 由板块name获得板块
     * @param forum_name 版块名
     * @return 版块对象
     */
    Forum getForumByForumName(String forum_name);

    /**
     * 逻辑删除版块
     * 2020-03-05 09:38
     * @param forum_id 版块id
     * @return
     */
    int deleteForumLogical(int forum_id);

    /**
     * 取消逻辑删除版块
     * 2020-03-05 09:38
     * @param forum_id 版块id
     *
     * @return
     */
    int disDeleteForumLogical(int forum_id);
}
