<%@page import="com.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>知天下</title>
<jsp:include page="common/comStyle.jsp"/>
<link rel="stylesheet" href="css/news_list.css" />
<script type="text/javascript">
  $(function(){	 
	 
	  //跳转至新闻详细页面
	  $(".news_item  img,.news_context h3,.news_context p,a[href='addcomment']").click(function(){
         var nid=$(this).parents(".news_item").children(".newsId").text();
         $(location).prop('href', '/ZTX/detail?nid='+nid);
         return false;
	   });
	  
    });
</script>
</head>
<%  
     if(session.getAttribute("Cate")==null)
     {
    	 request.getRequestDispatcher("init").forward(request, response);
    	 
       }
    
   %> 
<c:set var="username" value="${user.username}"/>
<c:set var="uid" value="${user.uid}"/>

<body>
<jsp:include page="/common/top.jsp"/>
<jsp:include page="/common/sub_nav.jsp"></jsp:include>
      <div class="content m_t100">
		 			<ul class="news_list m_l100">		 			 	 
		 			 	 	<jsp:include page="/common/news_list.jsp"></jsp:include>			 	 
		 			</ul>
		 			 <ul  class="pagesize content m_t100">	 
				 		     <c:forEach var="i" begin="0" end="${pages }">
				 		     <c:if test="${selectpage eq i}">
				 		     <li><a class="active" href="<%=basePath %>findALlNews?cate=${owncate}&&pagesize=${i}">${i+1}</a></li>
				 		     </c:if>
				 		     <c:if test="${selectpage ne i}">
				 		     <li><a  href="<%=basePath %>findALlNews?cate=${owncate}&&pagesize=${i}">${i+1}</a></li>
				 		     </c:if>					 			 
				 		     </c:forEach>
				 			 <div class="clear"></div>
		 	          </ul>
		 		</div>
		 		<p class="permission">${user.permission}<p>
<jsp:include page="/common/jsCommon.jsp"/>
<script type="text/javascript">
 
var role=$(".permission").text();
if(role!="" && role=="1"){
   $(location).prop('href', '/ZTX/findALlNews');
 }

//点击登录操作
$(".login input[type='submit']").click(function(){
	  var uname=$(".uname").val();
	  var pass=$(".pass").val();
	  $.post("login",{uname:uname,pass:pass},function(data){
		  if(data){			  
			  alert("登录成功");			 
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
  $(".addlike").click(function(){
  	var username="${username}";
  	var uid="${uid}";
  	var nid=$(this).attr("id");
  	//alert(uid+nid);
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