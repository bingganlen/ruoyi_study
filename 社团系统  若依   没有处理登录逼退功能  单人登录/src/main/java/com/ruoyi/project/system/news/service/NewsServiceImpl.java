package com.ruoyi.project.system.news.service;

import com.ruoyi.common.support.Convert;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.datascope.DataScopeUtils;
import com.ruoyi.project.system.news.domain.News;
import com.ruoyi.project.system.news.mapper.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author:zwy
 * Date:2019/3/30
 * Time:20:02
 */
@Service
public class NewsServiceImpl implements INewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public List<News> selectNewsList(News news) {
        news.getParams().put("dataScope", DataScopeUtils.dataScopeFilter("d"));
        if (news.getTitle()!=null&&!news.getTitle().equals("")){
            news.setTitle("%"+news.getTitle()+"%");
        }
        if (news.getContent()!=null&&!news.getContent().equals("")){
            news.setContent("%"+news.getContent()+"%");
        }

        return newsMapper.selectNewsList(news);
    }

    @Override
    public News selectByNewsId(Long newsId) {
        return newsMapper.selectByNewsId(newsId);
    }

    @Override
    public int insertNews(News news) {
        news.setCreateBy(ShiroUtils.getLoginName());
        return newsMapper.insertNews(news);
    }

    @Override
    public int updateNews(News news) {
        news.setUpdateBy(ShiroUtils.getLoginName());
        return newsMapper.updateNews(news);
    }

    @Override
    public int deleteNewsByIds(String newsIds) {
        return newsMapper.deleteNewsByIds(Convert.toStrArray(newsIds));
    }
}
