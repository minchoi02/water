<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/cmm/main/inc/incTop.jsp" %>

<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ page import ="java.util.List" %>
<%@ page import ="egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/prototype-1.6.0.3.js"></script>
<script type="text/javaScript">
/* ********************************************************
* 팝업창 정보 Ajax통신으로 정보 획득
******************************************************** */
function fn_ajaxPopupInfo_PopupManage(){
	<c:forEach var="popup" items="${reusltList}" varStatus="status">
		if(fnGetCookie('${popup.popupId}') == null ){
			fn_popupOpen_PopupManage('${popup.popupId}', '${popup.fileUrl}', '${popup.popupWSize}', '${popup.popupHSize}', '${popup.popupHlc}', '${popup.popupWlc}', '${popup.stopVewAt}');
		}
	</c:forEach>
}

/* ********************************************************
* 팝업창  오픈
******************************************************** */
function fn_popupOpen_PopupManage(popupId,fileUrl,width,height,top,left,stopVewAt){
	var url = "<c:url value='/sys/pwm/openPopupManage.do' />?";
	url = url + "fileUrl=" + fileUrl;
	url = url + "&stopVewAt=" + stopVewAt;
	url = url + "&popupId=" + popupId;
	var name = popupId;
	var openWindows = window.open(url,name,"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");

	if (window.focus) {openWindows.focus()}
}

/* ********************************************************
* 팝업창  오픈 쿠키 정보 OPEN
******************************************************** */
function fnGetCookie(name) {
	  var prefix = name + "=";

	  var cookieStartIndex = document.cookie.indexOf(prefix);
	  if (cookieStartIndex == -1) return null;
		  var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
	  if (cookieEndIndex == -1) cookieEndIndex = document.cookie.length;


	  return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex));
}
function fnMyPage(uniqId) {
	document.myPageForm.submit();
}
</script>
</head>
<body onLoad="fn_ajaxPopupInfo_PopupManage();">
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 전체 레이어 시작 -->

<div id="wrap">
	<!-- header 시작 -->
	<div id="header"><c:import url="/PageLink.do?link=cmm/main/inc/IncHeader" /></div>
	<%// <div id="topnavi"><c:import url="/cmm/main/MainMenuHead.do" /></div>%>
    <div id="topnavi"><c:import url="/cmm/main/MainMenuHead.do" /></div>
	<!-- //header 끝 -->
	<!-- container 시작 -->
	<div id="main_container">
		<div id="LoginStatus">
			  <fieldset><legend>조건정보 영역</legend>
			  	<%
			  	session.setAttribute("baseMenuNo", "9999999");
		        LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
			  	Boolean isAdmin = false;
		    	List<String> roleList = EgovUserDetailsHelper.getAuthorities();
		    	isAdmin = roleList.contains("ROLE_ADMIN");
		        if(loginVO == null){
		        %>
		        <ul>
			  		<li>로그인정보 없음</li>
			  		<li><a href="<c:url value='/cmm/login/LoginUsr.do'/>"><!--img src="<c:url value='/images/leftmenu/login.jpg' />" alt="" /-->로그인</a></li>
			  		<li>로그인후 사용하십시오</li>
			  	</ul>
			  	<%
		        }else{
			  	%>
		            <c:set var="loginName" value="<%= loginVO.getName()%>"/>
		            <c:set var="uniqId" value="<%= loginVO.getUniqId()%>"/>
		            <ul>
				  	    <li><a href="#LINK" onclick="fnMyPage(); return false;"><c:out value="${loginName}"/> 님</a></li>
			            <li><a href="<c:url value='/cmm/login/actionLogout.do'/>">로그아웃</a></li>
		            </ul>
			  	<%
			  	}
		        %>
			  </fieldset>
			  <a href="#" class="Sitemap">사이트맵</a>
		</div>

		<!-- title 시작 -->
		<div id="mainview_title_img">
			<img src="<c:url value='/'/>images/index/img_maintitle.jpg" alt="표준프레임워크 경량환경 내부업무" />
		<!-- //title 끝-->
		</div>
		<!-- 게시판 시작 -->
		<div id="mainview_wrap">
			<div id="main_leftcontent">
				<!-- 최종접속현황 시작 -->
				<div class="left_board01">
					<ul>
						 <li><div class="board_title"><img src="<c:url value='/'/>images/index/img_subtitle01.gif" width="77" height="16" alt="최종접속현황정보" /></div>
						 	<ul>
						 		<li><b>[기타정보의 메인화면 위치 예시]</b></li>
						 		<li>innovate님의 최종접속정보는 2011. 06. 07 19:30 입니다.</li>
						 	</ul>
						 </li>
					</ul>
				</div>
				<!-- //최종접속현황 끝 -->

				<!-- 오늘의 할일 시작 -->
				<div class="left_board02">
					<ul>
						 <li><div class="board_title"><img src="<c:url value='/'/>images/index/img_subtitle02.gif" width="71" height="16" alt="오늘의 할일" /></div>
						 	<c:if test="${isAdmin }">
							 	<ul>
							 		<li><div class="dot_bl">미처리 회원가입 요청</div></li>
							 		<li><div class="lcount"><a href="/sys/user/urm/UserManage.do?sbscrbSttus=A"><c:out value="${userReqCnt}" /> 건</a></div></li>
							 	</ul>
						 	</c:if>
						 	<c:forEach var="result" items="${bbsList}" varStatus="status">
						 	<ul>
						 		<li><div class="dot_bl">
						 		    <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_CCCCCCCCCCCC'/>">
						 		    <c:out value="${result.nttSj}" />
						 		    </a>
						 		    </div>
						 		</li>
						 		<li><div class="lcount"><c:out value="${result.frstRegisterPnttm}"/></div></li>
						 	</ul>
						 	</c:forEach>
						 	<!--
						 	<ul>
						 		<li><div class="dot_bl">직급변경요청접수</div></li>
						 		<li><div class="lcount"><a href="#LINK">113건</a></div></li>
						 	</ul>
						 	<ul>
						 		<li><div class="dot_bl">휴일근무 신청접수</div></li>
						 		<li><div class="lcount"><a href="#LINK">113건</a></div></li>
						 	</ul>
						 	<ul>
						 		<li><div class="dot_bl">미결제 현황</div></li>
						 		<li><div class="lcount"><a href="#LINK">113건</a></div></li>
						 	</ul>
						 	<ul>
						 		<li><div class="dot_bl">미결제 현황</div></li>
						 		<li><div class="lcount"><a href="#LINK">113건</a></div></li>
						 	</ul>
						 	<ul>
						 		<li><div class="dot_bl">미결제 현황</div></li>
						 		<li><div class="lcount"><a href="#LINK">113건</a></div></li>
						 	</ul>
						 	 -->
						 </li>
					</ul>
				</div>
				<!-- 오늘의 할일 끝 -->
			</div>
			<div id="main_rightcontent_wrap">
				<!-- 최신업무공지 시작 -->
				<div id="main_rightcontent">
					<ul>
						<li>
						<div class="board_title2">
						    <div class="t2_leftdiv">
						    <img src="<c:url value='/'/>images/index/img_subtitle03.gif" width="107" height="17" alt="최신 업무공지 정보" />
						    </div>
							<div class="t2_rightdiv">
							<a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA'/>" onclick="javascript:goMenuPage('1000000');">
							    more+
							</a>
							</div>
						</div>
						</li>
					</ul>
					<c:forEach var="result" items="${notiList}" varStatus="status">
					<ul>
						<li><div class="dot_bl2">
						<a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_CCCCCCCCCCCC'/>"><c:out value="${result.nttSj}" /></a></div></li>
						<li><div class="new"><img src="<c:url value='/'/>images/index/img_new.gif" alt="new" /></div></li>
						<li><div class="rwriter"><c:out value="${result.frstRegisterNm}" /></div></li>
						<li><div class="rdate"><c:out value="${result.frstRegisterPnttm}" /></div></li>
					</ul>
					</c:forEach>
				</div>
				<!-- //최신업무공지 끝 -->
			</div>
		</div>
	</div>
	<!-- //게시판 끝 -->
	<!-- footer 시작 -->
	<div id="footer"><c:import url="/PageLink.do?link=cmm/main/inc/IncFooter" /></div>
	<!-- //footer 끝 -->
</div>

<form id="myPageForm" name="myPageForm" action="/sys/user/urm/UserSelectUpdtView.do" method="post">
	<input type="hidden" name="selectedId" value="${uniqId}">
	<input type="hidden" name="reqFlag" value="user">
</form>

<!-- //전체 레이어 끝 -->
</body>
</html>