jQuery(function(){

  // 비주얼 영역 그래프

  jQuery('.graph').circleProgress({
    startAngle:300,
    size:80,
    animation:{
      duration:2200,
      easing:"swing"
    },
    lineCap : "butt",
    reverse:false

    })


    // 상세검색 온오프
    var layer = jQuery('.loginlayer');

    var btnOpen = jQuery('#popOpenBtn');
    var btnClose = jQuery('#popCloseBtn');

    btnOpen.on('click', function (event) {

      event.preventDefault();


      if(jQuery(".loginlayer").is(":hidden")){
         layer.fadeIn(300);
         jQuery(this).addClass("on");
         }else{
            layer.fadeOut(300);
            jQuery(this).removeClass("on");
         }

    });

	//On Click Event
	jQuery("ul.tabs li").click(function() {

		jQuery("ul.tabs li").removeClass("active"); //Remove any "active" class
		jQuery(this).addClass("active"); //Add "active" class to selected tab
		jQuery(".tab_content").hide(); //Hide all tab content

		var activeTab = jQuery(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		jQuery(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

	jQuery("ul.tabs2 li").click(function() {

		jQuery("ul.tabs2 li").removeClass("active"); //Remove any "active" class
		jQuery(this).addClass("active"); //Add "active" class to selected tab
		jQuery(".tab_content2").hide(); //Hide all tab content

		var activeTab = jQuery(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		jQuery(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});