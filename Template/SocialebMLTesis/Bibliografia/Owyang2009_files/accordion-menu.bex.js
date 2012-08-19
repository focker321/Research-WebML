$(document).ready(function() {
	 
	//ACCORDION BUTTON ACTION (ON CLICK DO THE FOLLOWING)
	$('.accordionButton').click(function() {

		//REMOVE THE ON CLASS FROM ALL BUTTONS
		$('.accordionButton').removeClass('on');
		  
		//NO MATTER WHAT WE CLOSE ALL OPEN SLIDES
	 	$('.accordionContent').slideUp('normal');
   
		//IF THE NEXT SLIDE WASN'T OPEN THEN OPEN IT
		if($(this).next().is(':hidden') == true) {
			
			//ADD THE ON CLASS TO THE BUTTON
			$(this).addClass('on');
			
			
			  
			//OPEN THE SLIDE
			$('#menu-wrapper li.open').removeClass('active open');
			$(this).next().slideDown('normal').children('li:first-child').addClass('active open');
			
			
		 } 
		  
	 });
	  
	
	/*** REMOVE IF MOUSEOVER IS NOT REQUIRED ***/
	
	//ADDS THE .OVER CLASS FROM THE STYLESHEET ON MOUSEOVER 
	$('.accordionButton').mouseover(function() {
		$(this).addClass('over');
		
	//ON MOUSEOUT REMOVE THE OVER CLASS
	}).mouseout(function() {
		$(this).removeClass('over');										
	});
	
		$('.accordionButton2').mouseover(function() {
		$(this).addClass('over2');
		
	//ON MOUSEOUT REMOVE THE OVER CLASS
	}).mouseout(function() {
		$(this).removeClass('over2');										
	});
	
	/*** END REMOVE IF MOUSEOVER IS NOT REQUIRED ***/
	
	
	/********************************************************************************************************************
	CLOSES ALL S ON PAGE LOAD
	********************************************************************************************************************/	
	//$('.accordionContent').hide();
	
	/*** Adding active states to submenu items ***/
	$('#menu-wrapper li').click(function(e) {
		$('#menu-wrapper li').removeClass('active open');
		$(this).addClass('active open');	
	});
	
	/*** Adding hover states to submenu items ***/
	$('#menu-wrapper li').hover(function() {
	
		$('#menu-wrapper li.open').removeClass('active');
		$(this).addClass('active');
		
	}, function() {
	
		$(this).removeClass('active');
		$('#menu-wrapper li.open').addClass('active');
		
	});	

});


/*************/


$(document).ready(function() {
	 
	//ACCORDION BUTTON ACTION (ON CLICK DO THE FOLLOWING)
	$('.accordionButton2').click(function() {

		//REMOVE THE ON CLASS FROM ALL BUTTONS
		$('.accordionButton2').removeClass('on');
		  
		//NO MATTER WHAT WE CLOSE ALL OPEN SLIDES
	 	$('.accordionContent2').slideUp('normal');
   
		//IF THE NEXT SLIDE WASN'T OPEN THEN OPEN IT
		if($(this).next().is(':hidden') == true) {
			
			//ADD THE ON CLASS TO THE BUTTON
			$(this).addClass('on');
			
			
			  
			//OPEN THE SLIDE
			$('#menu-wrapper2 li.open').removeClass('active open');
			$(this).next().slideDown('normal').children('li:first-child').addClass('active open');
			
			
		 } 
		  
	 });
	  
	


});


