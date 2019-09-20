package com.ruoyi.project.system.join.Controller;

import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.system.join.service.JoinService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * author:zwy
 * Date:2019-05-12
 * Time:20:27
 */
@Controller
@RequestMapping("/system/join")
public class JoinController extends BaseController {

    @Autowired
    private JoinService joinService;

    @RequiresPermissions("system:activity:view")
    @RequestMapping("/addJoin")
    @ResponseBody
    public AjaxResult addJoin(Long activityId){
        joinService.addJoin(ShiroUtils.getUserId(),activityId);
        return AjaxResult.success();
    }
}
