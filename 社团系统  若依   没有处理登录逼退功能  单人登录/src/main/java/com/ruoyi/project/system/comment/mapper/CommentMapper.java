package com.ruoyi.project.system.comment.mapper;

import com.ruoyi.project.system.comment.domain.Comment;

import java.util.List;

/**
 * author:zwy
 * Date:2019/3/30
 * Time:23:05
 */
public interface CommentMapper {

    List<Comment> selectCommentList(Comment comment);

    Comment selectByCommentId(Long commentId);

    int insertComment(Comment comment);

    int updateComment(Comment comment);

    int deleteCommentByIds(String[] commentIds);
}
