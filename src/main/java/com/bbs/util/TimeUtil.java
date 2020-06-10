package com.bbs.util;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;

/**
 * 时间处理类
 */
public class TimeUtil {

    /**
     * LocalDateTime转换为Date
     *
     * @param localDateTime
     * @author 二十六画生的博客 https://blog.csdn.net/u010002184/article/details/79713573
     */
    public static Date convertLocalDateTimeToDate(LocalDateTime localDateTime) {
        ZoneId zoneId = ZoneId.systemDefault();
        //Combines this date-time with a time-zone to create a  ZonedDateTime.
        ZonedDateTime zdt = localDateTime.atZone(zoneId);
        Date date = Date.from(zdt.toInstant());
        return date;
    }
}
