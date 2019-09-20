package com.ruoyi.project.system.news.mapper;

import com.ruoyi.project.system.news.domain.News;

import java.util.List;

/**
 * author:zwy
 * Date:2019/3/30
 * Time:18:13
 */
public interface NewsMapper {

    List<News> selectNewsList(News news);

    News selectByNewsId(Long newsId);

    int insertNews(News news);

    int updateNews(News news);

    int deleteNewsByIds(String[] newsIds);


}
