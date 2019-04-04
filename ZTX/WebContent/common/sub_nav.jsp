<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<ul class="sub_nav">
		 	<c:forEach items="${Cate}" var="item" end="8" >
		 	<c:if test="${! empty item.cate}">
		 	 <c:if test="${item.cate eq owncate}">
		 	 <li><a style="color:white;background: #D43B33;" href="<%=basePath %>findALlNews?cate=${item.cate}">${item.cate}</a></li>
		 	 </c:if>
		 	  <c:if test="${owncate ne item.cate}">
		 	   <li><a  href="<%=basePath %>findALlNews?cate=${item.cate}">${item.cate}</a></li>
		 	   </c:if>
		 	</c:if>
		 	</c:forEach>
		 	
</ul>