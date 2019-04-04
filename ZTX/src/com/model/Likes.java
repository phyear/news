package com.model;

import java.util.Date;

public class Likes {
   private int lid;
   private Users users;
   private News  news;
   private Date  like_date;
public int getLid() {
	return lid;
}
public void setLid(int lid) {
	this.lid = lid;
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
public Date getLike_date() {
	return like_date;
}
public void setLike_date(Date like_date) {
	this.like_date = like_date;
}
@Override
public String toString() {
	return "Likes [lid=" + lid + ", users=" + users + ", news=" + news + ", like_date=" + like_date + "]";
}
   
}
