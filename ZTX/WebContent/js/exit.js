
//退出
	  $(".exit").click(function(){
			if(confirm("确认要退出吗？")){
		    $.get("exit",
             function(data){
  	         if(data){
  	        	window.location.reload()
  	           }
              });
			}					
	    });