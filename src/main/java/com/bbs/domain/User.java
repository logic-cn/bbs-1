package com.bbs.domain;

import lombok.Data;

import java.util.Date;

/**
 * 用户实体类
 */
@Data
public class User {
    private int user_id; // 用户id
    private String user_name; // 用户名
    private String user_nick; // 昵称
    private String user_password; // 密码
    private String user_college; // 学院
    private String user_major; // 专业
    private String user_grade; // 年级
    private int user_status; // 状态，0-正常，1-禁用，2-锁定
    private int user_type; // 权限，0-超级管理员，1-管理员，2-普通用户
    private Date user_regTime; // 注册时间
    private Date user_lastLoginTime; // 最近登录时间
    private Date user_modifyTime; // 修改时间
}
