<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<jsp:include page="../../common/comStyle.jsp"/>
<link rel="stylesheet" href="<%=basePath%>css/register.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/messages_zh.js"></script>
<script>
$(function(){
	$(".reg").validate({
		rules:{
			uname:{
				required:true,
				rangelength:[4,12],
                 remote:{
                 url:"ajax_check",
                 type:"POST"
                  }
			},
			pass:{
			    required:true,
				minlength:5	
			},
			repass:{
				required:true,
				minlength:5,
				equalTo:'#pass'
			}
			
		},
		messages:{
			uname:{
				required:'用户名不能为空',
				remote:'该用户名已存在！'
			},
			pass:{
			    required:'请输入密码',
				minlength:'密码长度不能少于五位'	
			},
			repass:{
				required:'请输入密码',
				minlength:'密码长度不能少于五位',
				equalTO:'密码不一致'
			}
		 }
	});	
	 
		
  });
</script>
</head>
<body>
<jsp:include page="../../common/top.jsp"/>
<div class="register" style="margin-top:100px;">
			<div class="content">
		    <div class="l_head mc_tb10">
				<h3>用户注册</h3>
			</div>
			<form method="POST" action="register" class="m_b20 reg">
				<table>
					<tr align="left">
						<td><input type="text" name="uname" class="uname" id="uname" placeholder="username"></td>
						<td style="width:150px"></td>
					</tr>
					<tr align="left">
						<td><input type="password" name="pass" class="pass" id="pass" placeholder="password"></td>
						<td style="width:150px"></td>
					</tr>
					<tr align="left">
						<td><input type="password" name="repass" class="repass" id="repass" placeholder="repass"></td>
						<td style="width:150px"></td>
					</tr>
					<tr>
						<td><input type="submit" value="注册" id="submit"><a href="<%=basePath%>index.jsp" class="close">回到首页</a></td>
						<td></td>
					</tr>
				</table>
			</form>
			</div>
		  </div> 
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>