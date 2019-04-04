package com.service;

import java.util.List;

import com.model.Cate;
import com.model.News;

public interface NewsService {
	 List<News> findAll(String cate,int pagesize);
	 int addNews(List<News> list);
	 List<Cate> findCat();
	News findByNid(int nid);
	List<News> findAll();
	String remove(String nid);
	List<News> search(String info, int ps); 	
	 
}
