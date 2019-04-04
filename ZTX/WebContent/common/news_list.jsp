<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <c:forEach  var="item" items="${news}">    
     <li class="news_item">
             <div class="newsId" style="display: none;">${item.nid }</div>
             <c:set var="imgUrl" value="${item.imgUrl}"></c:set>
              <c:set var="imgArray" value="${fn:split(imgUrl, ',')}"></c:set>
		     <div class="news_img">   		   
		          <c:if test="${not empty imgArray[0]}">
		          <img src="${imgArray[0]}"/>
		          </c:if>
		          <c:if test="${empty imgArray[0] || imgArray[0]==''}">
		          <img src="./img/11.jpg"/>
		          </c:if>		       	       		        	       
		     </div>
		 	 <div class="news_box m_r50">
		 				<div class="news_context">
		 					<h3 class="news_title color_color_4b4b4b">${item.title }</h3>
		 					<p class="color_626262">${item.context }</p>
		 					 </div>
		 					 <div class="news_opr">
		 					   <ul class="fl">
		 					      <li class="fl m_r50">${item.newsFrom }</li>
		 					      <li class="fl m_r50"><fmt:formatDate value="${item.createtime}" pattern="yyyy年MM月dd日  HH时" /></li>
		 					      <li class="clear"></li>
		 					   </ul>
		 					   <ul class="fr">
		 					      <li class="fl m_r50"><a href="addcomment">评论</a></li>
		 					      <li class="fl m_r50"><a href="addlike" class="addlike" id="${item.nid }">收藏</a></li>
		 					      <li class="clear"></li>
		 					   </ul>
		 					   <div class="clear"></div>
		 					 </div>
		 					</div>
		 					<div class="clear"></div>
		 				</li>
		 	</c:forEach>
