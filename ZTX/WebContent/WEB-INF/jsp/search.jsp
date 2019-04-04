<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索信息</title>
<jsp:include page="/common/comStyle.jsp"/>
<link rel="stylesheet" href="css/news_list.css" />
</head>
<body>
<jsp:include page="/common/top.jsp"/>
<div class="content m_t100">
<c:if test="${user.permission eq 0 || user == null }">
<ul class="news_list m_l100">		 			  
		 			    <jsp:include page="/common/news_list.jsp"></jsp:include>
		 			  </ul>
 </c:if>
 <c:if test="${user.permission eq 1}">
<table id="customers" class="m_l100">
				<tr>
				  <th>新闻标题</th>		
				  <th>新闻分类</th>
				  <th>创建日期</th>
				  <th>新闻来源</th>
				  <th>操作</th>
				</tr>
				<c:forEach items="${news }" var="item">
				<tr>
				  <td>${item.title }</td>				 
				  <td>${item.cate }</td>
				  <td><fmt:formatDate value="${item.createtime}" pattern="yyyy年MM月dd日  HH时" /></td>
				  <td>${item.newsFrom }</td>
				  <td><a href="" id="${item.nid }" class="remove">删除</td>
				</tr>
				</c:forEach>
    </table>
 </c:if>
		 			
		 		</div>
<jsp:include page="/common/jsCommon.jsp"/>
<script type="text/javascript">
//删除新闻
$(".remove").bind("click",function(){
	  var tr=$(this).parents("tr");
	   var nid=$(this).attr("id");
	   alert(nid);
	   $.get("removeNews", {nid:nid},
	  	          function(data){			    
	  	            alert(data)
	  	            if(data=="删除成功"){
	  	              $(tr).remove();
	  	             window.location.reload();
	  	            }
	  	          });
	   
	   return false;
});
//跳转至新闻详细页面
$(".news_item  img,.news_context h3,.news_context p,a[href='addcomment']").click(function(){
   var nid=$(this).parents(".news_item").children(".newsId").text();
   $(location).prop('href', '/ZTX/detail?nid='+nid);
   return false;
 });


//点击登录操作
$(".login input[type='submit']").click(function(){
	  var uname=$(".uname").val();
	  var pass=$(".pass").val();
	  $.post("login",{uname:uname,pass:pass},function(data){
		  console.log(data);
		  if(data){
			  window.location.reload();
			  alert("登录成功");				 
		  }
		  else{
			  alert("登录失败 ");
		  }
		  
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
  $(".addlike").click(function(){
  	var username="${username}";
  	var uid="${uid}";
  	var nid=$(this).attr("id");
  	alert(uid+nid);
  	if(username==null || username == ""){
  		alert("你还没登录呢");
  	 }
  	else{
  		$.get("addLike", {nid:nid,uid:uid},
	  	          function(data){
			    
	  	           alert(data);
	  	            
	  	          });
  	}
  	return false;
  }); 
  </script>
</body>
</html>