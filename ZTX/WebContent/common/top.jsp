<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath= request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="nav">
    		<div class="content">
    			<div class="logo fl">
    						<a href="findALlNews">
    						<img src="<%=basePath%>img/logo.png" />
    					    </a>
    			</div>
    			<div class="fl m_l100">
    			  <form action="search" method="post">
    			    <input type="text" name="info" class="info"/> <input type="submit" class="searchen" value="搜索">
    			   </form>
    			</div>
    			<ul class="main_nav fr">
    						<li><a href="findALlNews">首页</a></li>
    						<c:if test="${user.permission eq 0 || user==null}">
    						  <li><a href="" class="toMyLike">我的收藏</a></li>
    						 </c:if>
    						<c:if test="${user==null }">
    						<li><a href="#" class="tologin">登录</a>|<a href="<%=basePath%>topage?pagename=register">注册</a></li>
    						</c:if>
    						<c:if test="${user!=null }">
    						<li class="choic">${user.username}|<a class="exit" href="#">退出</a></li>
    						</c:if>
    					</ul>	
    		    <div class="clear"></div>	
    				
    			</div>
    		</div>