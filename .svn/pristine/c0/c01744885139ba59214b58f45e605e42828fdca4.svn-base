<%--
  Class Name : EgovIncTopnav.jsp
  Description : 상단메뉴화면(include)
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:importAttribute name="list_headmenu"/>
<tiles:importAttribute name="list_menulist"/>

<!-- topmenu start -->
<script type="text/javascript">
<!--
    function getLastLink(baseMenuNo){
    	var tNode = new Array;
        for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
            tNode[i] = document.menuListForm.tmp_menuNm[i].value;
            var nValue = tNode[i].split("|");
            //선택된 메뉴(baseMenuNo)의 하위 메뉴중 첫번재 메뉴의 링크정보를 리턴한다.
            if (nValue[1]==baseMenuNo) {
                if(nValue[5]!="dir" && nValue[5]!="" && nValue[5]!="/"){
                    //링크정보가 있으면 링크정보를 리턴한다.
                    return nValue[5];
                }else{
                    //링크정보가 없으면 하위 메뉴중 첫번째 메뉴의 링크정보를 리턴한다.
                    return getLastLink(nValue[0]);
                }
            }
        }
    }
    function goMenuPage(baseMenuNo){
    	document.menuListForm.activeMenuId.value="";
    	document.getElementById("baseMenuNo").value=baseMenuNo;
    	document.getElementById("link").value="forward:"+getLastLink(baseMenuNo);
        //document.menuListForm.chkURL.value=url;
        document.menuListForm.action = "<c:url value='/PageLink.do'/>";
        document.menuListForm.submit();
    }
    function actionLogout()
    {
        document.selectOne.action = "<c:url value='/cmm/login/actionLogout.do'/>";
        document.selectOne.submit();
        //document.location.href = "<c:url value='/j_spring_security_logout'/>";
    }

    function fn_goManage(baseMenuNo, uurl, url) {
     	var turl;
     	if(uurl != "")
     		turl = uurl;
     	else
     		turl = url;

     	document.getElementById("baseMenuNo").value=baseMenuNo;
        var tNode = new Array;
        for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
            tNode[i] = document.menuListForm.tmp_menuNm[i].value;
            var nValue = tNode[i].split("|");
            if (nValue[5]==turl) {
            	document.menuListForm.activeMenuId.value=i;
            	document.getElementById("link").value="forward:" + url;

                document.menuListForm.action = "<c:url value='/PageLink.do'/>";
                document.menuListForm.submit();
            }
        }
    }
    function fn_goManage2(baseMenuNo, uurl, url,param) {
     	var turl;
     	if(uurl != "")
     		turl = uurl;
     	else
     		turl = url;

     	document.getElementById("baseMenuNo").value=baseMenuNo;
        var tNode = new Array;
        for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
            tNode[i] = document.menuListForm.tmp_menuNm[i].value;
            var nValue = tNode[i].split("|");
            if (nValue[5]==turl) {
            	document.menuListForm.activeMenuId.value=i;
            	document.getElementById("link").value="forward:" + url+param;

                document.menuListForm.action = "<c:url value='/PageLink.do'/>";
                document.menuListForm.submit();
            }
        }
    }

    function fnFindIdPw(se) {
    	document.getElementById("pwFind").value=se;
	    document.popupForm.action = "<c:url value='/sys/user/urm/IdPwFindView.do'/>";
	    window.open("#", "_popupForm", "scrollbars = no, top=100px, left=100px, height=600px, width=440px");
	    document.popupForm.target = "_popupForm";
	    document.popupForm.submit();
	}
//-->
</script>

<!-- <ul> -->
<%--    <c:forEach var="result" items="${list_headmenu}" varStatus="status"> --%>
<%--        <c:if test="${result.menuNo ne 3000000 }"> --%>
<%--         <li><a href="#LINK" onclick="javascript:goMenuPage('<c:out value="${result.menuNo}"/>')"><c:out value="${result.menuNm}"/></a></li> --%>
<%--         </c:if> --%>
<%--         <c:if test="${result.menuNo eq 3000000 }"> --%>
<%--         <li><a href="#" onclick="javascript:window.open('https://space.chungnam.go.kr:8100')"><c:out value="${result.menuNm}"/></a></li> --%>
<%--         </c:if> --%>
<%--     </c:forEach> --%>
<%--     <c:if test="${fn:length(list_headmenu) == 0 }"> --%>
<!--           <li>등록된 메뉴가 없습니다.</li> -->
<%--     </c:if> --%>
<!-- </ul> -->
<!-- //topmenu end -->

<!-- menu list -->
    <form name="menuListForm" action="" method="post">
        <input type="hidden" id="baseMenuNo" name="baseMenuNo" value="<%=session.getAttribute("baseMenuNo")%>" />
        <input type="hidden" id="activeMenuId" name="activeMenuId" value="<%=session.getAttribute("activeMenuId")%>" />
        <input type="hidden" id="link" name="link" value="" />
        <div style="width:0px; height:0px;">
        <c:forEach var="result" items="${list_menulist}" varStatus="status" >
            <input type="hidden" name="tmp_menuNm" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.relateImagePath}|${result.relateImageNm}|${result.chkURL}|" />
        </c:forEach>
        </div>
    </form>

<div id="overlay"></div>
