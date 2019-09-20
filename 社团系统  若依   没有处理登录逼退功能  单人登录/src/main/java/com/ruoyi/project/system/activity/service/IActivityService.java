package com.ruoyi.project.system.activity.service;

import com.ruoyi.project.system.activity.domain.Activity;
import com.ruoyi.project.system.activity.domain.ActivityDTO;
import com.ruoyi.project.system.user.domain.User;

import java.util.List;

/**
 * author:zwy
 * Date:2019/3/24
 * Time:18:56
 */
public interface IActivityService {

    List<Activity> selectByDeptId(Long deptId);

    List<ActivityDTO> selectByUser(User user);


    int insertActivity(Activity activity);

    int deleteActivity(Long activityId);

    int updateActivity(Activity activity);
}
