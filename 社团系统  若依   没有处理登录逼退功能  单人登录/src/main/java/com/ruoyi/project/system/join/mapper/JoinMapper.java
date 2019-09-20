package com.ruoyi.project.system.join.mapper;

import org.apache.ibatis.annotations.Param;

/**
 * author:zwy
 * Date:2019-05-12
 * Time:20:20
 */
public interface JoinMapper {

    void insertJoin(@Param("userId") Long userId, @Param("activityId") Long activityId);

    int countJoinByActivityId(Long activityId);

    int countJoinByActivityIdAndUserId(@Param("userId") Long userId,@Param("activityId") Long activityId);

}
