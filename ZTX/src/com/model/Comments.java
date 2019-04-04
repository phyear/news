package com.model;

import java.util.Date;

public class Comments {
	 private int cid;   
	 private Users users;
	 private News news;	
	 private String comments_context ;
	 private  Date   comments_date;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public String getComments_context() {
		return comments_context;
	}
	public void setComments_context(String comments_context) {
		this.comments_context = comments_context;
	}
	public Date getComments_date() {
		return comments_date;
	}
	public void setComments_date(Date comments_date) {
		this.comments_date = comments_date;
	}
	@Override
	public String toString() {
		return "Comments [cid=" + cid + ", users=" + users + ", news=" + news + ", comments_context=" + comments_context
				+ ", comments_date=" + comments_date + "]";
	}
	 

} 
