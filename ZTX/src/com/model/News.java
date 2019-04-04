package com.model;

import java.util.Date;

public class News {
   private int nid;
   private String title;
   private String imgUrl;
   private String context;
   
   private Date  createtime;
   private String cate;//分类
   private String newsFrom;//新闻来源
public int getNid() {
	return nid;
}
public void setNid(int nid) {
	this.nid = nid;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getImgUrl() {
	return imgUrl;
}
public void setImgUrl(String imgUrl) {
	this.imgUrl = imgUrl;
}
public String getContext() {
	return context;
}
public void setContext(String context) {
	this.context = context;
}
public Date getCreatetime() {
	return createtime;
}
public void setCreatetime(Date createtime) {
	this.createtime = createtime;
}
public String getCate() {
	return cate;
}
public void setCate(String cate) {
	this.cate = cate;
}
public String getNewsFrom() {
	return newsFrom;
}
public void setNewsFrom(String newsFrom) {
	this.newsFrom = newsFrom;
}
@Override
public String toString() {
	return "News [nid=" + nid + ", title=" + title + ", imgUrl=" + imgUrl + ", context=" + context + ", createtime="
			+ createtime + ", cate=" + cate + ", newsFrom=" + newsFrom + "]";
}

}
