package com.ruoyi.project.system.comment.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.comment.domain.Comment;
import com.ruoyi.project.system.comment.service.CommentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * author:zwy
 * Date:2019/3/31
 * Time:00:20
 */
@Controller
@RequestMapping("/system/comment")
public class CommentController extends BaseController {

    private String prefix = "system/comment";

    @Autowired
    private CommentService commentService;

    @RequiresPermissions("system:comment:view")
    @GetMapping()
    public String comment(){
        return prefix+"/comment";
    }

    @RequiresPermissions("system:comment:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Comment comment){
        startPage();
        List<Comment> list = commentService.selectCommentList(comment);
        return getDataTable(list);
    }

    @RequiresPermissions("system:comment:my")
    @GetMapping("/my")
    public String commentMy(){
        return prefix+"/commentMy";
    }

    @RequiresPermissions("system:comment:my")
    @PostMapping("/myComment")
    @ResponseBody
    public TableDataInfo findMy(){
        startPage();
        List<Comment> list = commentService.selectCommentMy();
        return getDataTable(list);
    }

    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    @RequiresPermissions("system:comment:add")
    @Log(title = "评论管理管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @Transactional(rollbackFor = Exception.class)
    @ResponseBody
    public AjaxResult addSave(Comment comment)
    {
        return toAjax(commentService.insertComment(comment));
    }

    @RequiresPermissions("system:comment:remove")
    @Log(title = "评论管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        try
        {
            return toAjax(commentService.deleteNewsByIds(ids));
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }
    }

    @RequiresPermissions("system:comment:removeMy")
    @Log(title = "评论管理", businessType = BusinessType.DELETE)
    @PostMapping("/removeMy")
    @ResponseBody
    public AjaxResult removeMy(String ids)
    {
        try
        {
            return toAjax(commentService.deleteNewsByIds(ids));
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }
    }

    @GetMapping("/edit/{commentId}")
    public String edit(@PathVariable("commentId") Long commentId, ModelMap mmap)
    {
        mmap.put("comment", commentService.selectByCommentId(commentId));
        return prefix + "/edit";
    }

    @RequiresPermissions("system:comment:edit")
    @Log(title = "评论管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @Transactional(rollbackFor = Exception.class)
    @ResponseBody
    public AjaxResult editSave(Comment comment)
    {
        return toAjax(commentService.updateComment(comment));
    }


    @GetMapping("/editMy/{commentId}")
    public String editMy(@PathVariable("commentId") Long commentId, ModelMap mmap)
    {
        mmap.put("comment", commentService.selectByCommentId(commentId));
        return prefix + "/editMy";
    }

    @RequiresPermissions("system:comment:editMy")
    @Log(title = "评论管理", businessType = BusinessType.UPDATE)
    @PostMapping("/editMy")
    @Transactional(rollbackFor = Exception.class)
    @ResponseBody
    public AjaxResult editSaveMy(Comment comment)
    {
        return toAjax(commentService.updateComment(comment));
    }
}
