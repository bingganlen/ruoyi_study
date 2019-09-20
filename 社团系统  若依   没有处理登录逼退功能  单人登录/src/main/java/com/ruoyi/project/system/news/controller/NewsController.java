package com.ruoyi.project.system.news.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.news.domain.News;
import com.ruoyi.project.system.news.service.INewsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * author:zwy
 * Date:2019/3/30
 * Time:20:10
 */
@Controller
@RequestMapping("/system/news")
public class NewsController extends BaseController{

    private String prefix = "system/news";

    @Autowired
    private INewsService newsService;


    @RequiresPermissions("system:news:view")
    @GetMapping()
    public String news(){
        return prefix+"/news";
    }

    @RequiresPermissions("system:news:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(News news){
        startPage();
        List<News> list = newsService.selectNewsList(news);
        return getDataTable(list);
    }

    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    @RequiresPermissions("system:news:add")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @Transactional(rollbackFor = Exception.class)
    @ResponseBody
    public AjaxResult addSave(News news)
    {
        return toAjax(newsService.insertNews(news));
    }

    @RequiresPermissions("system:enws:remove")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        try
        {
            return toAjax(newsService.deleteNewsByIds(ids));
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }
    }

    @GetMapping("/edit/{newsId}")
    public String edit(@PathVariable("newsId") Long newsId, ModelMap mmap)
    {
        mmap.put("news", newsService.selectByNewsId(newsId));
        return prefix + "/edit";
    }

    @RequiresPermissions("system:news:edit")
    @Log(title = "新闻管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @Transactional(rollbackFor = Exception.class)
    @ResponseBody
    public AjaxResult editSave(News news)
    {
        return toAjax(newsService.updateNews(news));
    }
}
