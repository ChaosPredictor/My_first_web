   var t=-20;
   v=1.15;
   
 $(document).ready(function(){
    $(".p1").click(function () {
      $(".p11").toggle("slow"); 
    });
  });

 $(document).ready(function(){
    $("#romantext").click(function () {
      $("#romanlist").toggle("slow"); 
    });
  });

  function myfluidFixrdFunction()
  {
	if (document.getElementById("Firsttilte").class=='row-fluid')
	{
		$('#Firsttilte').toggleClass('row-fixed');
	}
	else
	{
		$('#Firsttilte').toggleClass('row-fluid');
	}
	
  }
  
  
  function myTestFunction()
  {
    var textin="Yes you can";
    var time=new Date().getHours();
 
    if (t<600)
    {
      t=t+80;
      v=v/1.3;
    }
	else
	{
	  t=20;
	  v=1;
	}
    document.getElementById("demo").innerHTML=textin;
    $(document).ready(function(){
      $("#demo").animate({left:t+'px'});
      $("#demo").animate({opacity:v});
    });
  };

  $(document).ready(function(){
    $("#demo3").click(function(){
       $("#demo2").animate({height:'150px',opacity:'0.4'},"slow");
       $("#demo2").animate({width:'150px',opacity:'0.2'},"slow");
       $("#demo2").animate({height:'50px',opacity:'0.4'},"slow");
       $("#demo2").animate({width:'50px',opacity:'0.8'},"slow");
    });
 
			
	 		
	 		
	 		
	 		
	 		
		/*	#001F1F    
		AF3F20
		9F4F20
		8F5F10
		7F6F00
		6F7F00
		5F8F10
		4F9F20
		3FAF20*/
			
 /*background-color:transparent;*/
 
    $("#div1").hover(function(){
      $("#div1").css("background-color","#10FFF0");
      $("#div1").css("color","#000000");
                },function(){
      $("#div1").css("background-color","transparent");
      $("#div1").css("color","#0000D0");
    });
	
    $("#div2").hover(function(){
      $("#div2").css("background-color","#30DFF0");
      $("#div2").css("color","#000000");
         },function(){
      $("#div2").css("background-color","transparent");
      $("#div2").css("color","#0000D0");
    });
		
    $("#div3").hover(function(){
      $("#div3").css("background-color","#50BFF0");
      $("#div3").css("color","#000000");
         },function(){
      $("#div3").css("background-color","transparent");
      $("#div3").css("color","#0000D0");
    });

    $("#div4").hover(function(){
      $("#div4").css("background-color","#709FF0");
      $("#div4").css("color","#000000");
                },function(){
      $("#div4").css("background-color","transparent");
      $("#div4").css("color","#0000D0");
    });
	
    $("#div5").hover(function(){
      $("#div5").css("background-color","#9F70F0");
      $("#div5").css("color","#000000");
                },function(){
      $("#div5").css("background-color","transparent");
      $("#div5").css("color","#0000D0");
    });
	
    $("#div6").hover(function(){
      $("#div6").css("background-color","#BF50F0");
       $("#div6").css("color","#000000");
                },function(){
      $("#div6").css("background-color","transparent");
      $("#div6").css("color","#0000D0"); 
    });

    $("#div7").hover(function(){
      $("#div7").css("background-color","#DF30F0");
      $("#div7").css("color","#000000");
                },function(){
      $("#div7").css("background-color","transparent");
      $("#div7").css("color","#0000D0"); 
    });
	
    $("#div8").hover(function(){
      $("#div8").css("background-color","#FF10F0");
      $("#div8").css("color","#000000");
                },function(){
      $("#div8").css("background-color","transparent");
      $("#div8").css("color","#0000D0");    
	});
	
			
	
    $("#div9").hover(function(){
      $("#div9").css("background-color","Teal");
      $("#div9").css("color","#FFFFFF");
                },function(){
      $("#div9").css("background-color","#D7F1A0");
      $("#div9").css("color","#000000");
    });	
	
	
	

	
  /*  $("#div2").mouseenter(function () {
       $("#div1").animate({height:'20px',width:'50px',opacity:'0.6'},"slow"); 
    });
	
	$("#div2").mouseleave(function () {
       $("#div1").animate({height:'20px',width:'1px',opacity:'1'},"slow"); 
    }); */
  });