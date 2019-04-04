 //验证用户名
	  $(".uname").change(function(){
		   var d=$(this).val();
		    $.get("lcheckname", {uname:d},
		      function(data){
		    	if(data){
		    		$(".uname").parent("td").next("td").text("Success").css({"color":"green"});	
		    	 }
		    	else{
		    		$(".uname").parent("td").next("td").text("Fail").css({"color":"red"});
		    	}
		   });
	  });

	