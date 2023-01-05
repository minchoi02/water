<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<%
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/sym/mpm/icon/";
  String imagePath_button = "/images/egovframework/sym/mpm/button/";
%>

<link href="<c:url value='/'/>css/popup.css" rel="stylesheet" type="text/css" >
<script type="text/javaScript">
<!--
var imgpath = "<c:url value='/'/>images/tree/";
//-->
</script>
<script type="text/javaScript" src="<c:url value='/js/EgovMenuCreat.js'/>"></script>
<script type="text/javaScript">
<!--
/* ********************************************************
 * 멀티입력 처리 함수
 ******************************************************** */
function fInsertMenuCreat() {
    var checkField = document.menuCreatManageForm.checkField;
    var checkMenuNos = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkMenuNos += ((checkedCount==0? "" : ",") + checkField[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkMenuNos = checkField.value;
            }
        }
    }
    document.menuCreatManageForm.checkedMenuNoForInsert.value=checkMenuNos;
    document.menuCreatManageForm.checkedAuthorForInsert.value=document.menuCreatManageForm.authorCode.value;
    document.menuCreatManageForm.action = "<c:url value='/sys/menu/mcm/MenuCreatInsert.do'/>";
    document.menuCreatManageForm.submit();
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
//-->
</script>

</head>

<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="menuCreatManageForm" action ="/sys/menu/mcm/MenuCreatSelect.do" method="post">
	<div id="pop_wrap" style="width:620px;">
    	<div class="pop_tit">메뉴생성관리</div>
		<div class="pop_inner">
			<input name="checkedMenuNoForInsert" type="hidden" >
			<input name="checkedAuthorForInsert"  type="hidden" >

			<div id="sub_con_wrap">
				<div id="search_field">
					<fieldset><legend>조건정보 영역</legend>
						<div class="sf_start">
							<ul class="search_form">
								<li>
									<label for="authorCode" class="first">권한코드</label>
									<input id="authorCode" name="authorCode" type="text" size="30"  maxlength="30" title="권한코드" value="${fn:replace(fn:replace(resultVO.authorCode, '<', '&lt;'), '>', '&gt;')}" readonly="readonly" class="input_style1 input_w7" >
								</li>
							</ul>

							<div class="search_btn_wrap">
								<a href="#LINK" onclick="javascript:fInsertMenuCreat(); return false;" class="search_btn">메뉴생성</a>
							</div>
						</div>
					</fieldset>
				</div>
				<div id="page_info"><div id="page_info_right"></div></div>

				<!-- table add start -->
				<div>
						<c:forEach var="result1" items="${list_menulist}" varStatus="status" >
							<input type="hidden" name="tmp_menuNmVal" value="${result1.menuNo}|${result1.upperMenuId}|${result1.menuNm}|${result1.progrmFileNm}|${result1.chkYeoBu}|">
						</c:forEach>
	                    <table summary="메뉴일괄등록">
	                        <caption>메뉴일괄등록</caption>
						    <tr>
							    <td>
								    <!-- div class="tree" style="position:absolute; left:24px; top:70px; width:179px; height:25px; z-index:10;" -->
								    <div class="tree" style="border:1px solid #e8e8e8; padding:10px; padding-left:30px;">
								        <script type="text/javaScript">
								            var chk_Object = true;
								            var chk_browse = "";
								            if (eval(document.menuCreatManageForm.authorCode)=="[object]") chk_browse = "IE";
								            if (eval(document.menuCreatManageForm.authorCode)=="[object NodeList]") chk_browse = "Fox";
								            if (eval(document.menuCreatManageForm.authorCode)=="[object Collection]") chk_browse = "safai";

								            var Tree = new Array;
								            if(chk_browse=="IE"&&eval(document.menuCreatManageForm.tmp_menuNmVal)!="[object]"){
								               alert("메뉴 목록 데이타가 존재하지 않습니다.");
								               chk_Object = false;
								            }
								            if(chk_browse=="Fox"&&eval(document.menuCreatManageForm.tmp_menuNmVal)!="[object NodeList]"){
								               alert("메뉴 목록 데이타가 존재하지 않습니다.");
								               chk_Object = false;
								            }
								            if(chk_browse=="safai"&&eval(document.menuCreatManageForm.tmp_menuNmVal)!="[object Collection]"){
								                   alert("메뉴 목록 데이타가 존재하지 않습니다.");
								                   chk_Object = false;
								            }
								            console.log(document.menuCreatManageForm.tmp_menuNmVal.length);

								            if( chk_Object ){
								                for (var j = 0; j < document.menuCreatManageForm.tmp_menuNmVal.length; j++) {
								                    Tree[j] = document.menuCreatManageForm.tmp_menuNmVal[j].value;
								                }
								               createTree(Tree);
								            }else{
								                alert("메뉴가 존재하지 않습니다. 메뉴 등록 후 사용하세요.");
								                window.close();
								            }
								        </script>
								    </div>
						       </td>
						   </tr>
						</table>
				     </div>
	                 <input type="hidden" name="req_menuNo">
	                 </div></div></div>
	            </form>

        <!-- footer 시작 -->
<%--         <div id="footer"><c:import url="/PageLink.do?link=cmm/main/inc/IncFooter" /></div> --%>
        <!-- //footer 끝 -->

    <!-- //전체 레이어 끝 -->
