package com.bbs.domain;

import lombok.Data;

import java.util.Date;

/**
 * 贴子实体类
 */
@Data
public class Tip {

    private User user; // 用户
    private Tab tab; // 分类对象
    private int user_id; // 楼主id（发贴人id）
    private int tab_id; // 分类id

    private int tip_id; // 贴子id
    private String tip_title; // 标题
    private String tip_content; // 内容
    private Date tip_publishTime; // 发表时间
    private Date tip_modifyTime; // 修改时间
    private int tip_click; // 点击量
    private int tip_isDeleted; // 是否逻辑删除，0-否，1-是
    private int tip_isKnot; // 是否结贴，0-否，1-是
    private int tip_replies; // 贴子回复数
    private int tip_isTop; // 是否置顶，0-否，1-是
    private Date tip_topTime; // 置顶时间

}
