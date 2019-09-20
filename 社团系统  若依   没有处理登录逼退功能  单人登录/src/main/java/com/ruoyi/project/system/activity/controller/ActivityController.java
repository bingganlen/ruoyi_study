package com.ruoyi.project.system.activity.controller;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.system.activity.domain.Activity;
import com.ruoyi.project.system.activity.domain.ActivityDTO;
import com.ruoyi.project.system.activity.service.IActivityService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * author:zwy
 * Date:2019/3/24
 * Time:19:02
 */
@Controller
@RequestMapping("/system/activity")
public class ActivityController extends BaseController {

    private String prefix = "/system/activity";

    @Autowired
    private IActivityService activityService;

    @RequiresPermissions("system:activity:view")
    @GetMapping()
    public String activity(){
        return prefix+"/activity";
    }

    @RequiresPermissions("system:activity:view")
    @RequestMapping("/list")
    @ResponseBody
    public List<ActivityDTO> list(){
        return activityService.selectByUser(ShiroUtils.getUser());
    }

    @RequiresPermissions("system:activity:delete")
    @RequestMapping("/delete")
    @ResponseBody
    public AjaxResult deleteActivity(Long activityId){
        activityService.deleteActivity(activityId);
        return AjaxResult.success();
    }

    @PostMapping("/add")
    @ResponseBody
    @RequiresPermissions("system:activity:add")
    public AjaxResult addActivity(String title,Long deptId,String place,String operateTime,String manager,String hostDeptment,Float score,Double money,String endTime ){
        Activity activity = new Activity();
        activity.setTitle(title);
        activity.setStatus(0);
        activity.setDeptId(deptId);
        activity.setPlace(place);
        activity.setManager(manager);
        activity.setHostDeptment(hostDeptment);
        activity.setScore(score);
        activity.setMoney(money);
        Date date = DateUtils.dateTime("yyyy-MM-dd",operateTime);
        activity.setOperateTime(date);
        activity.setEndTime(DateUtils.dateTime("yyyy-MM-dd",endTime));
        activityService.insertActivity(activity);
        return AjaxResult.success();
    }

    @GetMapping("/add")
    public String add(){
        return prefix+"/add";
    }

    @RequestMapping("/pass")
    @ResponseBody
    @RequiresPermissions("system:activity:pass")
    public AjaxResult passActivity(Long activityId, Integer status){
        Activity activity = new Activity();
        activity.setActivityId(activityId);
        activity.setStatus(status);
        activityService.updateActivity(activity);
        return AjaxResult.success();
    }

}
