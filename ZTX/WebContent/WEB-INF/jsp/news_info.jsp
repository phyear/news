<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻详情</title>
<jsp:include page="../../common/comStyle.jsp"/>
<link rel="stylesheet" href="<%=basePath %>css/news_info.css" />
</head>
<body>
<c:set var="username" value="${user.username}"/>
<c:set var="nid" value="${detail.nid}"/>
<c:set var="uid" value="${user.uid}"/>
<jsp:include page="../../common/top.jsp"/>
<div class="content m_t100">
		  <div class="pageinfo">
		  	<div class="pageHead">
		  	   <h1 align="center">${detail.title }</h1>
		  	   <div class="news_ta font_18">
		  	   	<span class="fl">新闻来源：${detail.newsFrom}</span><span class="fr"><fmt:formatDate value="${detail.createtime}" pattern="yyyy年MM月dd日  HH时" /></span>
		  	   	<div class="clear"></div>
		  	   </div>
		  	</div>
		  	<div class="news_Atri font_24 color_626262">
		  	 <c:set var="p" value="${detail.context}"></c:set>
              <c:set var="pArray" value="${fn:split(p, '#')}"></c:set>
		  	     <c:forEach items="${pArray}" var="i">
		  	       <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${i}</p>
		  	     </c:forEach>
		  	   <c:set var="imgUrl" value="${detail.imgUrl}"></c:set>
               <c:set var="imgArray" value="${fn:split(imgUrl, ',')}"></c:set>
		  	    <ul class="imgUrl">
		  	    <c:forEach items="${imgArray}" var="img" end="7" >
		  	    <li class="fl" style="margin-right: 10px;"><img alt="" src="${img }" style="height: 200px;width:250px;"></li>
		  	    </c:forEach>
		  	    <li class="clear"></li>
		  	    </ul>
		  	
		  	</div>
		  </div>
		</div>
		<!--
        	作者：offline
        	时间：2018-06-25
        	描述：增加评论以及显示评论
        -->
<div class="content m_t100 b_box">
			<div class="Review_box">
				<form action="addCommont?u" method="post" class="fl">
					<input type="text" name="comment_context" class="comment_context"/>
					<input type="submit" value="评论"  class="c_submit"/>
				</form>
				<div class="fl tag_a">
					<a href="">显示评论</a><a href="" class="addlike">收藏</a>
				</div>
				<div class="clear">					
				</div>
			</div>
			
				<ul class="D_commments content" id="D_commments">
					
				</ul>
			
		</div>
		<p class="permission" style="display: none;">${user.permission}<p>
<jsp:include page="/common/jsCommon.jsp"/>
       <script>  
       var role=$(".permission").text();
       if(role!="" && role=="1"){
          $(location).prop('href', '/ZTX/findALlNews');
        }

        //点击登录操作
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
        	  var flag=true;
			  $(".tag_a > a:eq(0)").click(function(){
				 var nid="${nid}";
				if(flag){
						$(this).text("隐藏评论");
						$(".D_commments").show();	
						$.get("findCommentBynid", { nid:nid},
                           function(data){
                           	console.log(data);
                           for(var i=0;i<data.length;i++){
                           	  $(".D_commments").append("<li class='c_list'>");
					          $(".D_commments > li:eq("+i+")").append("<p class='username'>"+data[i].users.username+":</p>");	  
                              $(".D_commments > li:eq("+i+")").append("<p class='c_comtext'>"+data[i].comments_context+"</p><br/>");
                              $(".D_commments > li:eq("+i+")").append("<p class='fr c_date'>"+timeStamp2String(data[i].comments_date)+"</p>");                         					    
                              $(".D_commments > li:eq("+i+")").trigger("create");                       
                           }
                             $(".D_commments").append("<li class='clear'></li>");
                             $(".D_commments").trigger("create");                         
                          });
					   flag=false;
				     }										
			      else{
						$(this).text("显示评论");
						$(".D_commments").hide();
						$(".D_commments > li").remove();
						flag=true;
					}
					
				return false;
			});
          
				
			$(".c_submit").click(function(){
				var username="${username}";
				var uid="${uid}";
				var nid="${nid}";
				
				var context=$(".comment_context").val();
			  	if(username==null || username == ""){
			  		alert("你还没登录呢");
			  	 }
			  	else{
			  		if(context==null || context==""){
			  			alert("评论不能为空");
			  		}
			  		else{
			  			$.post("addComment", { nid:nid, uid:uid,context:context },
					  	          function(data){
			  				     $(".comment_context").val("");
					  	           alert(data);
					  	            
					  	          });
			  		}
			  	  }
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
				  	var nid="${nid}";			  
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
			 //时间转换函数
 function timeStamp2String(time){
    var datetime = new Date();
    datetime.setTime(time);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
    return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
}
			</script>
		

</body>
</html>