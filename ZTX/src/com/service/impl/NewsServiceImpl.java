package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.NewsMapper;
import com.model.Cate;
import com.model.News;
import com.service.NewsService;
import com.tools.DataTools;
import com.tools.StringFilter;
@Service
@Transactional
public class NewsServiceImpl implements NewsService{
	@Autowired
    NewsMapper ndao;
	@Override
	public int addNews(List<News> list) {
		int count=0;
		 for (News news : list) {
			  if(ndao.findNewsByTitle(StringFilter.removetesu(news.getTitle()))==null || news.getTitle()!="") {
				  int a=ndao.addNews(news);
				   if(a>0) {
					  count+=1;
				    }
			    }			
		     }
		return count;
	}
	
	@Override
	public List<News> findAll(String cate,int pagesize) {
		List<News> list=ndao.findNews(cate,pagesize);
		return list;
	}

	@Override
	public List<Cate > findCat() {
		List<Cate> list=new ArrayList<Cate>();
		list=ndao.findCate();
		return list;
	}

	@Override
	public News findByNid(int nid) {
		// TODO Auto-generated method stub
		return ndao.findNewsById(nid);
	}

	@Override
	public List<News> findAll() {
		
		return ndao.findAll();
	}

	@Override
	public String remove(String nid) {
		String aString="";
		  if(nid!=null && DataTools.ToInt(nid)>0){
			  int b=ndao.deleteNewsById(DataTools.ToInt(nid));
			  if(b>0) {
				  aString="删除成功";
			    }
			  else {
				  aString="删除失败";
			    }
		     }
		  else {
			  aString="数据异常";
		    }
		return aString;
	}

	@Override
	public List<News> search(String info, int ps) {
		
		return ndao.search(info,ps);
	}

	
}
