package com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.model.Cate;
import com.model.News;

public interface NewsMapper {
	/**
	 * 增加新闻
	 * @param news
	 * @return
	 */
    int addNews(News news);
    /**
     * 通过ID查找新闻
     * @param id
     * @return
     */
    News findNewsById(int id);
    /**
     * 通过title查询新闻
     * @param title
     * @return
     */
    List<News> findNewsByTitle(@Param("title")String title);
    /**
     * 通过类型值查询新闻
     * @param cate
     * @return
     */
    List<News> findNewsByCate(String cate);
    /**
     * 查询所有
     * @param cate
     * @return
     */
    List<News> findNews(@Param("cate")String cate,@Param("pagesize")int pagesize);
    /**
     * 删除新闻
     * @param id
     * @return
     */
    int  deleteNewsById(int id);
    /**
     * 查询所有的新闻类型
     * @return 
     */
    List<Cate> findCate();
	List<News> findAll();
	/**
	 * 搜索新闻根据查询信息和分页
	 * @param info
	 * @param ps
	 * @return
	 */
	List<News> search(@Param("info")String info,@Param("ps") int ps);
}
