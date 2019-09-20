package com.ruoyi;

import com.ruoyi.framework.datascope.DataScopeUtils;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.user.mapper.UserMapper;
import com.ruoyi.project.system.user.service.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * author:zwy
 * Date:2019-05-12
 * Time:16:22
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class MyTest {

    @Autowired
    private UserMapper userMapper;


    @Autowired
    private IUserService userService;

    @Test
    public void queryTest(){
        userService.selectUserList(null);
    }
}
