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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script type="text/javascript" src="<c:url value="/js/EgovMainMenu.js"/>"></script>
<tiles:importAttribute name="list_headmenu"/>
<tiles:importAttribute name="list_menulist"/>
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
	 		node.addClass("active");
	 		node.parent().addClass("show");
	 		if(node.parent().parent().length > 0 && node.parent().parent()[0].nodeName == "LI") {
				node.parent().parent().addClass("active");
	 		}
		} else {
			$("#sidebar li").first().addClass("active");
			if($("#sidebar li").first().next().length > 0 && $("#sidebar li").first().next()[0].nodeName == "LI") {
				$("#sidebar li").first().next().children().first().addClass("active");
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
// function fn_egov_downFile(atchFileId, fileSn){
//     window.open("<c:url value='/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
// }

</script>
<!-- 메뉴 시작 -->
<div id="LoginStatus">

<!-- 	<a href="https://www.e-heritage.go.kr/sysm/LoginForm01.jsp" target="_balnk" title="새창열림">문화재 전자행정시스템</a> -->

	  <fieldset><legend>조건정보 영역</legend>
	  	<%
        LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");

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
<%-- 	  	    <li><a href="#LINK" onclick="fnMyPage(); return false;"><c:out value="${loginName}"/> 님</a></li> --%>
            <li>
<!--             	<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a> -->
<%-- 				<form id="logout-form" action='<c:url value='/cmm/login/logout.do'/>' method="POST"> --%>
<%-- 				   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/> --%>
<!-- 				</form> -->
			</li>
            <!-- <li><a href="#LINK" onclick="fnMyPage(); return false;">회원정보</a></li> -->
            </ul>
	  	<%
	  	}
        %>
	  </fieldset>

<!-- 	  <a href="javascript:;" class="Sitemap">사이트맵</a> -->

</div>
	<!-- left menu -->
	<nav id="sidebar" class="collapse-horizontal collapse show">
        <div class="sidebar-header">
	        <%
                String menuNm = "시스템관리";

			    if(loginVO != null){
			    	String menuId = session.getAttribute("baseMenuNo").toString();
// 			        String menuId = "9000000";
			        switch(menuId) {
			         case "1000000" :
			             menuNm = "샘플관리";
			             break;
			         case "2000000" :
			             menuNm = "문화재관리";
			             break;
			         case "3000000" :
			             menuNm = "공간정보";
			             break;
			         case "4000000" :
			             menuNm = "통계관리";
			             break;
			         case "8000000" :
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

            <h2><%=menuNm%></h2>
<%--                <strong><%=menuNm%><br />관리</strong> --%>
        </div>
	    <script type="text/javascript">
	    <!--
			var Tree = new Array;
			if(document.menuListForm.tmp_menuNm != null){
			    for (var j = 0; j < document.menuListForm.tmp_menuNm.length; j++) {
			        Tree[j] = document.menuListForm.tmp_menuNm[j].value;
			    }
			}
		    createTree(Tree, true, document.getElementById("baseMenuNo").value);
		    -->
	    </script>


    </nav>
<!--    	<button type="button" class="btn-sidebar" data-bs-toggle="collapse" data-bs-target="#sidebar" aria-expanded="true" aria-controls="sidebar"></button> -->
<!-- </div> -->

<!-- //메뉴 끝 -->