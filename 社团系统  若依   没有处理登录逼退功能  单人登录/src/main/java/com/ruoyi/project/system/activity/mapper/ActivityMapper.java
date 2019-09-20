package com.ruoyi.project.system.activity.mapper;

import com.ruoyi.project.system.activity.domain.Activity;
import com.ruoyi.project.system.user.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * author:zwy
 * Date:2019/3/24
 * Time:17:25
 */
public interface ActivityMapper {

    List<Activity> selectByDeptId(@Param("deptId") Long deptId);

    int insertActivity(Activity activity);

    int deleteActivity(@Param("activityId") Long activityId);

    int updateActivity(Activity activity);

}
