package com.ruoyi.project.system.activity.service;

import com.ruoyi.project.system.activity.domain.Activity;
import com.ruoyi.project.system.activity.domain.ActivityDTO;
import com.ruoyi.project.system.activity.mapper.ActivityMapper;
import com.ruoyi.project.system.join.mapper.JoinMapper;
import com.ruoyi.project.system.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * author:zwy
 * Date:2019/3/24
 * Time:18:57
 */
@Service
public class ActivityServiceImpl implements IActivityService {

    @Autowired
    private ActivityMapper activityMapper;

    @Override
    public List<Activity> selectByDeptId(Long deptId) {
        return activityMapper.selectByDeptId(deptId);
    }

    @Override
    public int insertActivity(Activity activity) {
        activity.setStatus(0);
        return activityMapper.insertActivity(activity);
    }

    @Override
    public int deleteActivity(Long activityId) {
        return activityMapper.deleteActivity(activityId);
    }

    @Override
    public int updateActivity(Activity activity) {
        return activityMapper.updateActivity(activity);
    }

    @Override
    public List<ActivityDTO> selectByUser(User user) {
        List<Activity> activities;
        if (user.isAdmin()){
            activities = activityMapper.selectByDeptId(null);
        }else{
            Long deptId = user.getDeptId();
            activities = activityMapper.selectByDeptId(deptId);
        }
        return transformActivity(activities);
    }

    @Autowired
    private JoinMapper joinMapper;

    private List<ActivityDTO> transformActivity(List<Activity> activities){

        final List<ActivityDTO> activityDTOS = new ArrayList<>();
        activities.forEach(activity -> {
            ActivityDTO activityDTO = new ActivityDTO();
            activityDTO.setActivityId(activity.getActivityId());
            activityDTO.setDept(activity.getDept());
            activityDTO.setDeptId(activity.getDeptId());
            activityDTO.setEndTime(activity.getEndTime());
            activityDTO.setHostDeptment(activity.getHostDeptment());
            activityDTO.setManager(activity.getManager());
            activityDTO.setMoney(activity.getMoney());
            activityDTO.setOperateTime(activity.getOperateTime());
            activityDTO.setPlace(activity.getPlace());
            activityDTO.setScore(activity.getScore());
            activityDTO.setStatus(activity.getStatus());
            activityDTO.setTitle(activity.getTitle());
            activityDTO.setCount(joinMapper.countJoinByActivityId(activity.getActivityId()));
            activityDTOS.add(activityDTO);
        });
        return activityDTOS;
    }
}
