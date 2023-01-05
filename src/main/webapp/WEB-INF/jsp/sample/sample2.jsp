<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='/'/>css/board.css" rel="stylesheet" type="text/css" ><!-- 20210204 장주연추가 -->
<title>샘플화면1</title>
<script src="/js/jquery/jquery-3.5.1.min.js"></script>
<script type="text/javaScript" defer="defer">
	$(document).ready(function() {
		
		//When page loads...
		//$(".tab_content").hide(); //Hide all content
		//$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		//$(".tab_content:first").show(); //Show first tab content
	
		//On Click Event
		$("ul.tabs li").click(function() {
	
			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content
	
			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});
	
		$("ul.tabs2 li").click(function() {
	
			$("ul.tabs2 li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content2").hide(); //Hide all tab content
	
			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});
	
	});
</script>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header"><c:import url="/PageLink.do?link=cmm/main/inc/IncHeader" /></div>
    <div id="topnavi"><c:import url="/cmm/main/MainMenuHead.do" /></div>
    <!-- //header 끝 -->
    <!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/cmm/main/MainMenuLeft.do" /></div>
        <!-- //좌측메뉴 끝 -->
            <!-- 현재위치 네비게이션 시작 -->
            <div id="content">
              <form name="frm">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            
                            <li>디자인템플릿</li>
                            
                            <li><strong>화면구성샘플1</strong></li>
                        </ul>
                    </div>
                </div>
                
                <!-- 팝업창 시작 -->
                <div id="pop_wrap"><!-- 이 부분 넓이값만 조정하면 됨 -->
                	
                	<div class="pop_tit">문화재 관리 대장</div>
                	
                	<div class="pop_inner">
                	
                		<!--탭 메뉴 영역 -->
						<ul class="tabs">
							<li class="active"><a href="#tab1">기본정보</a></li>
							<li><a href="#tab2">설명자료</a></li>
							<li><a href="#tab3">이미지/도면</a></li>
						</ul>
						<!--//탭 메뉴 영역 -->
                		
						<!--탭 콘텐츠 영역 -->
						<div class="tab_container">
			
							<!--tab1_contents-->
							<div id="tab1" class="tab_content active">
								<!--Content-->
								<div class="pop_h3">문화재 설명자료</div>
								내용영역		
							</div>
							<!--//tab1_contents-->
			
							<!--tab2_contents-->
							<div id="tab2" class="tab_content">
								<!--Content-->
								<div class="pop_h3">문화재 설명자료</div>
								내용영역
							</div>
							<!--//tab2_contents-->
							
							<!--tab3_contents-->
							<div id="tab3" class="tab_content">
								<!--Content-->
								<div class="pop_h3">문화재 설명자료</div>
								내용영역
							</div>
							<!--//tab3_contents-->
			
						</div>

                	</div>
                	
                </div>
                <!-- //팝업창 시작  끝 -->
                
              </form>

            </div>
            <!-- //content 끝 -->
        </div>
        <!-- //container 끝 -->
        <!-- footer 시작 -->
        <div id="footer"><c:import url="/PageLink.do?link=cmm/main/inc/IncFooter" /></div>
        <!-- //footer 끝 -->
    </div>
    <!-- //전체 레이어 끝 -->
 </body>
</html>