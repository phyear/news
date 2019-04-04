<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="/common/login.jsp"></jsp:include>
<jsp:include page="/common/footer.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>js/loginshoworhide.js" ></script>
<script type="text/javascript" src="<%=basePath%>js/check.js" ></script>
<script type="text/javascript" src="<%=basePath%>js/exit.js" ></script>
<script type="text/javascript" src="<%=basePath%>js/toMylike.js" ></script>