<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.model.Users"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
<jsp:include page="/common/comStyle.jsp"/>
<%
     Users users=(Users)session.getAttribute("user");
     if(session.getAttribute("user")==null || users.getPermission()!=1 )
     {
    	System.out.println("aaa");
        response.sendRedirect("init");
      }
%>
</head>
<body>

<jsp:include page="/common/top.jsp"/>
<ul class="sub_nav">	 	
<li><a style="color:white;background:#D43B33;" href="#">管理</a></li>
<li><a  href="httpNews">抓取</a></li>	
</ul>
<div class="content m_t100">
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
     <ul  class="pagesize content m_t100">	 
				 		     <c:forEach var="i" begin="0" end="${pages}">
				 		     <c:if test="${selectpage eq i}">
				 		     <li><a class="active" href="findALlNews?cate=${owncate}&&pagesize=${i}">${i+1}</a></li>
				 		     </c:if>
				 		     <c:if test="${selectpage ne i}">
				 		     <li><a  href="findALlNews?cate=${owncate}&&pagesize=${i}">${i+1}</a></li>
				 		     </c:if>					 			 
				 		     </c:forEach>
	  <div class="clear">
	</div>
		 	          </ul>
</div>
<jsp:include page="/common/jsCommon.jsp"/>
<script type="text/javascript">
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
 
</script>
</body>
</html>