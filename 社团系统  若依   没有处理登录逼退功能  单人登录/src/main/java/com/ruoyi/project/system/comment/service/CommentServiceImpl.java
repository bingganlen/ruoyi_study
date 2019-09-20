package com.ruoyi.project.system.comment.service;

import com.ruoyi.common.support.Convert;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.system.comment.domain.Comment;
import com.ruoyi.project.system.comment.mapper.CommentMapper;
import com.ruoyi.project.system.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author:zwy
 * Date:2019/3/31
 * Time:00:16
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> selectCommentList(Comment comment) {
        if (comment.getContent()!=null&&!comment.getContent().equals("")){
            comment.setContent("%"+comment.getContent()+"%");
        }

        User user = ShiroUtils.getUser();
        if(user.isAdmin()){
            comment.setDeptId(null);
        }else {
            comment.setDeptId(user.getDeptId());
        }

        return commentMapper.selectCommentList(comment);
    }

    @Override
    public List<Comment> selectCommentMy() {
        Comment comment = new Comment();
        User user = ShiroUtils.getUser();
        comment.setUserId(user.getUserId());
        return commentMapper.selectCommentList(comment);
    }

    @Override
    public Comment selectByCommentId(Long commentId) {
        return commentMapper.selectByCommentId(commentId);
    }

    @Override
    public int insertComment(Comment comment) {
        User user = ShiroUtils.getUser();
        comment.setStatus("0");
        comment.setUserId(user.getUserId());
        comment.setCreateBy(ShiroUtils.getLoginName());
        return commentMapper.insertComment(comment);
    }

    @Override
    public int updateComment(Comment comment) {
        comment.setUpdateBy(ShiroUtils.getLoginName());
        return commentMapper.updateComment(comment);
    }

    @Override
    public int deleteNewsByIds(String commentIds) {
        return commentMapper.deleteCommentByIds(Convert.toStrArray(commentIds));
    }
}
