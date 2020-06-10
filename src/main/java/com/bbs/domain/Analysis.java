package com.bbs.domain;

import lombok.Data;

import java.util.Date;

/**
 * @description: 分析实体类
 **/
@Data
public class Analysis {

    private int analysis_id;
    private int tip_id;
    private int user_id;
    private Date create_date;

}
