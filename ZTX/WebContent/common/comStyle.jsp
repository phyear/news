<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js" ></script>
<link rel="stylesheet" href="<%=basePath%>css/common.css" />
<link rel="stylesheet" href="<%=basePath%>css/header.css" />
<link rel="stylesheet" href="<%=basePath%>css/login.css" />
<link rel="stylesheet" href="<%=basePath%>css/footer.css" />
<link rel="stylesheet" href="<%=basePath%>css/sub_nav.css" />
<link rel="stylesheet" href="<%=basePath%>css/adminlist.css" />
<link rel="stylesheet" href="<%=basePath%>css/pagesize.css" />