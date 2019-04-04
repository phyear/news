<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   <div class="login">
			<div class="content">
				<div class="l_head mc_tb10">
				<h3>账号登录</h3>
			</div>
			<form method="POSt" action="login" class="m_b20">
				<table>
					<tr align="left">
						<td><input type="text" name="uname" class="uname" placeholder="username"></td>
						<td style="width:50px"></td>
					</tr>
					<tr align="right">
						<td><input type="password" name="pass" class="pass" placeholder="password"></td>
						<td style="width:50px"></td>
					</tr>
					<tr>
						<td><input type="submit" value="登录" id="submit"><a href="#" class="close">暂不登录</a></td>
						<td></td>
					</tr>
				</table>
			    
			</form>
			</div>
		</div>