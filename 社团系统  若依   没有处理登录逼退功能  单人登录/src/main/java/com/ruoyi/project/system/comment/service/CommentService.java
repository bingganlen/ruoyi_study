package com.ruoyi.project.system.comment.service;

import com.ruoyi.project.system.comment.domain.Comment;
import com.ruoyi.project.system.news.domain.News;

import java.util.List;

/**
 * author:zwy
 * Date:2019/3/31
 * Time:00:15
 */
public interface CommentService {

    List<Comment> selectCommentList(Comment comment);

    List<Comment> selectCommentMy();

    Comment selectByCommentId(Long commentId);

    int insertComment(Comment comment);

    int updateComment(Comment comment);

    int deleteNewsByIds(String commentIds);
}
