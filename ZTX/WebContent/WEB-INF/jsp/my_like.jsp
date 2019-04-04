<%@page import="com.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的收藏</title>
<jsp:include page="/common/comStyle.jsp"/>
<style type="text/css">
.show_count{
	    		width: 300px;
	    		height: 300px;
	    		border: 1px solid #d43b33;
	    		position: fixed;
	    		top:100px;
	    		left: 100px;
	    	}
	    	.count{
	    		border-top: 1px solid #d43b33;
	    		height: 100px;
	    		line-height: 50px;
	    	}
	.news_list{
       width:90%;
        }
	.news_item{
		height: 100px;
		border-bottom: 1px solid #A8A8A8;
		padding-bottom: 10px;
		margin-top:50px;
		margin-left:250px;
	 }
	 .news_img{
	   float:left;
	 }
	 .news_img img{
	     width:120px;
	     height:100px;
	    }
	  .news_box{
	    width:70%;
	    float:right;
	   } 
	   .news_context p{
	     width:300px;
	     height:40px;  
	     margin-top:10px;      
         white-space:nowrap;
	     text-overflow:ellipsis;
	     overflow:hidden;
	   }
	   .m_r10{
	   margin-right:10px;}
	   .news_opr{
	    
	    }
	 
</style>
<% Users users=(Users)session.getAttribute("user");
   if(users==null){
	   response.sendRedirect("findALlNews");
    }
%>
</head>
<body>
<c:set var="username" value="${user.username}"/>
<c:set var="uid" value="${user.uid}"/>
<jsp:include page="/common/top.jsp"/>
 <div class="show_count">
		   	<h2 align="center" class="color_d43b33 m_t20 p_b40">ZTX</h2>
		   	<div class="count content font_24 color_d43b33">
		   		<p align="center">我的收藏</p>
		   		<p align="center">${fn:length(myLike)}</p>
		   	</div>
		   </div>
		   <div class="content m_t100">
		 			<ul class="news_list m_l100">
		 <c:forEach  var="item" items="${myLike}">    
           <li class="news_item">
             <div class="newsId" style="display: none;">${item.news.nid }</div>
             <c:set var="imgUrl" value="${item.news.imgUrl}"></c:set>
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
		 					<h4 class="news_title color_color_4b4b4b">${item.news.title }</h4>
		 					<p class="color_626262">${item.news.context }</p>
		 					 </div>
		 					 <div class="news_opr">
		 					   <ul class="fl">
		 					      <li class="fl m_r10">${item.news.newsFrom }</li>
		 					      <li class="fl m_r10"><fmt:formatDate value="${item.news.createtime}" pattern="yyyy年MM月dd日  HH时" /></li>
		 					      <li class="clear"></li>
		 					   </ul>
		 					   <ul class="fr">
		 					      <li class="fl m_r10"><a href="addcomment">评论</a></li>
		 					      <li class="fl m_r10"><a href="removeLike" class="removeLike" id="${item.lid}">取消收藏</a></li>
		 					      <li class="clear"></li>
		 					   </ul>
		 					   <div class="clear"></div>
		 					 </div>
		 					</div>
		 					<div class="clear"></div>
		 				</li>
		 	</c:forEach>				
		 			</ul>
		 	</div>
<jsp:include page="/common/jsCommon.jsp"/>

<script type="text/javascript">
$(".login input[type='submit']").click(function(){
	  var uname=$(".uname").val();
	  var pass=$(".pass").val();
	  $.post("login",{uname:uname,pass:pass},function(data){
		  console.log(data);
		  if(data){
			  alert("登录成功 ");			  		  
		  }
		  else{
			  alert("登录失败 ");
		  }
		  window.location.reload();
	  });
	  return false;
});

$(".toMyLike").click(function(){
  	var username="${username}";
  	 if(username==null || username == ""){
  		alert("你还没登录呢");
  	   }
  	 else{
  		 var uid="${uid}";
  		 $(location).prop('href', '/ZTX/myLike?uid='+uid); 
  	     }
  	return false;
     });  
  $(".removeLike").click(function(){
  	var username="${username}";
  	var uid="${uid}";
  	var lid=$(this).attr("id");
  	
  			if(username==null || username == ""){
  		  		alert("你还没登录呢");
  		  	 }
  		  	else{
  		  	$.get("removeLike", {uid:uid,lid:lid},
  			  	          function(data){ 
  		  	                alert(data);
  					        
  					        	window.location.reload();  					         			       
  			  	          });
  		  	}
  	return false;
  }); 
//跳转至新闻详细页面
  $(".news_item  img,.news_context h3,.news_context p,a[href='addcomment']").click(function(){
     var nid=$(this).parents(".news_item").children(".newsId").text();
     $(location).prop('href', '/ZTX/detail?nid='+nid);
     return false;
   });
</script>
</body>
</html>