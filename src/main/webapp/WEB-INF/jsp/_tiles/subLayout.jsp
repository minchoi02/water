<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<!DOCTYPE html>
<html lang="ko">
<link type="text/css" rel="shortcut icon" href="/water/images/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="viewport" content="width=1920" />
<meta http-equiv="Content-Language" content="ko" >
<title>상수도 원격검침 시스템(사용자)</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/app/lib/slick/css/slick.grid.css" />
<link rel="stylesheet" type="text/css" href="/app/lib/slick/css/smoothness/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" href="/app/lib/slick/css/theme.css" />
<link rel="stylesheet" type="text/css" href="/app/css/namocrossuploader.css" />
<link rel="stylesheet" type="text/css" href="/app/lib/contextmenu/jquery.contextMenu.css" />

<script src="/js/jquery/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/app/lib/jquery-1.11.3.min.js"></script>

<script type="text/javascript" src="/app/lib/jquery.event.drag-2.2.js"></script>
<script type="text/javascript" src="/app/lib/slick/slick.core.js"></script>
<script type="text/javascript" src="/app/lib/slick/slick.grid.js"></script>
<script type="text/javascript" src="/app/lib/slick/slick.dataview.js"></script>
<script type="text/javascript" src="/app/lib/slick/plugins/slick.checkboxselectcolumn.js"></script>
<script type="text/javascript" src="/app/lib/slick/plugins/slick.rowselectionmodel.js"></script>
<script type="text/javascript" src="/app/js/namocrossuploader-config.js"></script>
<script type="text/javascript" src="/app/js/namocrossuploader.js"></script>
<script type="text/javascript" src="/app/lib/contextmenu/jquery.contextMenu.js"></script>
<script type="text/javascript" src="/app/lib/contextmenu/jquery.ui.position.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js" integrity="sha512-2XuQYSojalNmRQyWxr1Dr+KWZ7Gn6JgWMZvPxIYwGFRVA1r8RPWHRWybIu8zp/G2EtTTAXh56aMpk99pkrrpNA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link type="text/css" rel="stylesheet" href="/water/css/common.css" />

<!-- NamoCrossUploader Client HTML5 Edition 이 동작하기 위한 필수 파일입니다. -->




<%-- <link rel="stylesheet" href="/js/jquery/jquery-ui.css">

<script src="<c:url value='/js/jquery/jquery-ui.js'/>" ></script> --%>
<script src="<c:url value='/js/jquery_chained/jquery.chained.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/showModalDialogCallee.js'/>" ></script>
<%-- <script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script> --%>
<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script>
/* $(document).ready(function(){

    var activeMenuId = document.menuListForm.activeMenuId.value;
	if(activeMenuId!=''){

	var node = $("#" + activeMenuId);
	console.log(node);

	 if(node.parent().prev().text().length>20){
	    console.log($('.left_tit.left_tit6').text());
		console.log(node.text());
	}else{
	    console.log($('.left_tit.left_tit6').text());
	    console.log(node.parent().prev().text());
		console.log(node.text());
	}

	//var liArray = .find('a');
	//var liArray = $('li')
	$('li').each(function(){
	   console.log($(this).attr("id")+"::"+$(this).attr("class"));
	});

	//var depth2 = $('#'+document.menuListForm.activeMenuId.value).text();
	}else{
	    console.log($('.left_tit').text());
	    console.log($('.left_tit').next().find('li:first-child').text());
	}


}); */


</script>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 전체 레이어 시작 -->
	<div id="wrap" class="main-wrap sub-wrap">
		<div class="sub-area">
	    <!-- header 시작 -->
	    <header class="header-wrap">
                <tiles:insertAttribute name="top"/>
                <tiles:insertAttribute name="header" />
		<div id="topnavi"><tiles:insertAttribute name="topNav" /></div>
		</header>
		<!-- header 끝 -->
	    <!-- container 시작 -->
	    <div id="container" class="container container-wrap">
	       <!-- main -->
            <main id="contents">
                <div class="content-wrap">
                <%
                LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
                String menuNm = "";

			    if(loginVO != null){
			    	String menuId = session.getAttribute("baseMenuNo").toString();
// 			        String menuId = "9000000";
			        switch(menuId) {
			         case "1000000" :
			             menuNm = "자산관리";
			             break;
			         case "2000000" :
			             menuNm = "자산모니터링";
			             break;
			         case "3000000" :
			             menuNm = "장애처리관리";
			             break;
			         case "5000000" :
			             menuNm = "통계현황";
			             break;
			         case "6000000" :
			             menuNm = "커뮤니티";
			             break;
			         case "9000000" :
			             menuNm = "시스템관리";
			             break;
			         default :
			        	   menuNm = "사용자 서비스";
			        	   break;
			        }
			    }
            %>
                <div class="main-title" data-aos="fade-up">
                	<p><strong><%=menuNm%></strong></p>
                </div>
                 <section class="panel-wrap">
                 	<h2 class="hidden">컨텐츠영역</h2>
			        <!-- 서브메뉴 시작 -->
			        <tiles:insertAttribute name="left" />
			        <!-- //서브메뉴 끝 -->
                    <div><tiles:insertAttribute name="content" /></div>
                 </section>
            <!-- content 끝 -->
	            </div>

            </main>
            <!-- //content 끝 -->
		</div>
	    <!-- //container 끝 -->
	    </div>
	</div>
	<!-- footer 시작 -->
	<div><tiles:insertAttribute name="footer" /></div>
	<!-- //footer 끝 -->
<!-- //전체 레이어 끝 -->
</body>
</html>
