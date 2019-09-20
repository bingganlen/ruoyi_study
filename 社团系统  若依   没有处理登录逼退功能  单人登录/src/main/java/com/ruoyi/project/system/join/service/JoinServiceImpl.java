package com.ruoyi.project.system.join.service;

import com.ruoyi.project.system.join.mapper.JoinMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author:zwy
 * Date:2019-05-12
 * Time:20:26
 */
@Service
public class JoinServiceImpl implements JoinService {

    @Autowired
    private JoinMapper joinMapper;

    @Override
    public void addJoin(Long userId, Long activityId) {

        int count = joinMapper.countJoinByActivityIdAndUserId(userId,activityId);
        if (count==0){
            joinMapper.insertJoin(userId,activityId);
        }
    }
}
