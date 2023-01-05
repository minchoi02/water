<%--
  Class Name : EgovIncLeftmenu.jsp
  Description : 좌메뉴화면(include)
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ page import ="java.util.List" %>
<%@ page import ="egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value="/js/EgovMainMenu.js"/>"></script>
<script type="text/javascript">
function fn_goBbs(bbsId, nodeNum, nttId) {
	document.menuListForm.activeMenuId.value=nodeNum;
	document.getElementById("baseMenuNo").value="8000000";

	if(nttId == '' || nttId == null) document.getElementById("link").value="forward:/cop/bbs/selectBoardList.do?bbsId="+bbsId;
	else document.getElementById("link").value="forward:/cop/bbs/selectBoardArticle.do?bbsId=" + bbsId + "&nttId=" + nttId;

document.menuListForm.action = "<c:url value='/PageLink.do'/>";
document.menuListForm.submit();
}
<!--
/* ********************************************************
 * 상세내역조회 함수
 ******************************************************** */
function fn_MovePage(nodeNum) {
    var nodeValues = treeNodes[nodeNum].split("|");
    //parent.main_right.location.href = nodeValues[5];
    document.menuListForm.activeMenuId.value = nodeNum;
    document.menuListForm.action = "${pageContext.request.contextPath}"+nodeValues[5];
    //alert(document.menuListForm.action);
    document.menuListForm.submit();
}
function fnMyPage(uniqId) {
	document.myPageForm.submit();
}
/* lnb */
(function($){
	var lnbUI = {
		click : function (target, speed) {
			var _self = this,
			$target = $(target);
			_self.speed = speed || 300;

			$target.each(function(){
				if($(this).next()[0] != null && $(this).next()[0].nodeName == 'DIV') {
					return;
				}
				$(this).addClass('noDepth');
			});

			$target.on('click','a', function(e){
				e.stopPropagation();
				var $this = $(this),
				$depthTarget = $this.parent().next(),
				$siblings = $this.parent().siblings();

				$this.parent('div').find('ul li').removeClass('on');
				$this.parent().siblings('li').removeClass('on');
				$siblings.find('div').slideUp(250);

				if($depthTarget.css('display') == 'none') {
					_self.activeOn($this);
					$depthTarget.slideDown(_self.speed);
				} else {
					$depthTarget.slideUp(_self.speed);
					_self.activeOff($this);
				}


			})
		},
		activeOff : function($target) {
			$target.parent().removeClass('on');
		},
		activeOn : function($target) {
			$target.parent().addClass('on');
		}
	};

	function fn_ActiveMenu() {
		var activeMenuId = document.menuListForm.activeMenuId.value;
		if(activeMenuId != "") {
			var node = $("#" + activeMenuId);
	 		node.addClass("on");
	 		if(node.parent().length > 0 && node.parent()[0].nodeName == "DIV") {
				node.parent().addClass("on");
				node.parent().prev().addClass("on");
	 		}
		} else {
			$("#nav li").first().addClass("on");
			if($("#nav li").first().next().length > 0 && $("#nav li").first().next()[0].nodeName == "DIV") {
				$("#nav li").first().next().addClass("on");
				$("#nav li").first().next().children().first().addClass("on");
			}
		}
	}

	// Call lnbUI
	$(function(){
		lnbUI.click('#nav li', 300);
		fn_ActiveMenu();
	});
}(jQuery));
//-->
function fn_egov_downFile(atchFileId, fileSn){
    window.open("<c:url value='/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
}

</script>
<!-- 메뉴 시작 -->
<div id="LoginStatus">

	<a href="https://www.e-heritage.go.kr/sysm/LoginForm01.jsp" target="_balnk" title="새창열림">문화재 전자행정시스템</a>

	  <fieldset><legend>조건정보 영역</legend>
	  	<%
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
<!--             <a href="#" class="NewMember">신규회원 7건</a> -->
            <ul>
	  	    <li><a href="#LINK" onclick="fnMyPage(); return false;"><c:out value="${loginName}"/> 님</a></li>
            <li><a href="<c:url value='/cmm/login/actionLogout.do'/>">
            <!-- img src="<c:url value='/images/leftmenu/logout.jpg' />" alt="로그아웃" /-->로그아웃</a></li>
            <!-- <li><a href="#LINK" onclick="fnMyPage(); return false;">회원정보</a></li> -->
            </ul>
	  	<%
	  	}
        %>
	  </fieldset>

	  <a href="javascript:;" class="Sitemap">사이트맵</a>

</div>
<div id="nav">
	<%
	String menuNm = "사용자 서비스";
	String classId = "left_tit left_tit7";
	if(loginVO != null){
		String menuId = session.getAttribute("baseMenuNo").toString();
		switch(menuId) {
		 case "1000000" :
			 menuNm = "위원회관리";
			 classId = "left_tit left_tit1";
			 break;
		 case "2000000" :
			 menuNm = "문화재관리";
			 classId = "left_tit left_tit2";
			 break;
		 case "3000000" :
			 menuNm = "공간정보";
			 classId = "left_tit left_tit3";
			 break;
		 case "4000000" :
			 menuNm = "통계관리";
			 classId = "left_tit left_tit4";
			 break;
		 case "8000000" :
			 menuNm = "커뮤니티";
			 classId = "left_tit left_tit5";
			 break;
		 case "9000000" :
			 menuNm = "시스템관리";
			 classId = "left_tit left_tit6";
			 break;
		 default :
			 menuNm = "사용자 서비스";
			 classId = "left_tit left_tit7";
			 break;
		}
	}
	%>
	<div class="<%=classId%>"><%=menuNm%></div>
    <div class="nav_style">
     <script type="text/javascript">
     <!--
         var Tree = new Array;
         if(document.menuListForm.tmp_menuNm != null){
             for (var j = 0; j < document.menuListForm.tmp_menuNm.length; j++) {
                 Tree[j] = document.menuListForm.tmp_menuNm[j].value;
             }
         }
         createTree(Tree, true, document.getElementById("baseMenuNo").value);
     //-->
     </script>
     <a class="manual_down" href="#" onclick="javascript:fn_egov_downFile('FILE_000000000010521','0')"><span>사용자 메뉴얼 다운로드</span></a>
	</div>
</div>
<button type="button" class="slideBtn slide"></button>

<form id="myPageForm" name="myPageForm" action="/sys/user/urm/UserSelectUpdtView.do" method="post">
	<input type="hidden" name="selectedId" value="${uniqId}">
	<input type="hidden" name="reqFlag" value="user">
</form>
<!-- //메뉴 끝 -->