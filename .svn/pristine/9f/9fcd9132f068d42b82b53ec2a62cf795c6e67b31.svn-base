<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<link href="<c:url value='/'/>css/popup.css" rel="stylesheet" type="text/css" >
<script type="text/javaScript" defer="defer">
<!--

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var returnValue = "";
    var checkCount = 0;
    var returnBoolean = false;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkCount++;
                    checkField[i].value = checkId[i].value;
                    returnValue = checkField[i].value;
                }
            }

            if(checkCount > 1) {
                alert("하나 이상의 그룹이 선택되었습니다.");
                return;
            } else if(checkCount < 1) {
                alert("선택된 그룹이 없습니다.");
                return;
            }
        } else {
        	if(checkField.checked == true) {
        		returnValue = checkId.value;
        	} else {
                alert("선택된 그룹이 없습니다.");
                return;
            }
        }

        returnBoolean = true;

    } else {
    	alert("조회 결과가 없습니다.");
    }

    document.listForm.groupId.value = returnValue;

    return returnBoolean;

}

function fncSelectGroup(groupId) {
 // window.returnValue = groupId;
    opener.listForm.searchKeyword.value = groupId;
    window.close();
}

function fncSelectGroupConfirm() {
	if(fncManageChecked()) {
		opener.listForm.searchKeyword.value = document.listForm.groupId.value;
     // window.returnValue = document.listForm.groupId.value;
		window.close();
	}
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
 // document.listForm.action = "<c:url value='/sys/author/gpm/GroupSearchList.do'/>";
    document.listForm.submit();
}

function fnClose() {
	window.close();
}
//-->
</script>

<form name="listForm" action="<c:url value='/sys/author/gpm/GroupSearchList.do'/>" method="post">
    <!-- 검색 필드 박스 시작 -->
    <div id="pop_wrap" style="width:600px;">
    	<div class="pop_tit">그룹 검색</div>
		<div class="pop_inner">
	<div id="sub_con_wrap">
    <div id="search_field">
            <fieldset><legend>조건정보 영역</legend>
            <div class="sf_start">
                <ul class="search_form">
                    <li>
                        <label for="searchKeyword" class="first">그룹명</label>
                        <input id="searchKeyword" name="searchKeyword" type="text" value="<c:out value='${groupManageVO.searchKeyword}'/>" title="검색" class="input_style1 input_w7" />
                    </li>
                </ul>

                <div class="search_btn_wrap">
                    <a href="#LINK" onclick="javascript:fnSearch(); return false;" class="search_btn"><spring:message code="button.search" /></a>
                </div>
            </div>
            </fieldset>
    </div>
    <!-- //검색 필드 박스 끝 -->

	${custld:renderPageInfoWithoutExcel(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount(), 'N')}
    <!-- table add start -->
    <div class="tablestyle_1">
        <table summary="그룹 조회 결과를  보여주는 테이블입니다.그룹 ID,그룹 명의 정보를 담고 있습니다.">
	        <caption>그룹 조회 팝업</caption>
	        <colgroup>
<%--     	        <col width="3%" > --%>
    	        <col width="15%" >
    	        <col width="25%" >
	        </colgroup>
	        <thead>
	        <tr>
<!-- 	            <th scope="col" class="f_field" nowrap="nowrap"></th> -->
	            <th scope="col" nowrap="nowrap">그룹 ID</th>
	            <th scope="col" nowrap="nowrap">그룹 명</th>
	        </tr>
	        </thead>
	        <tbody>

            <c:forEach var="group" items="${groupList}" varStatus="status">
            <!-- loop 시작 -->
			  <tr>
<%-- 			    <td nowrap="nowrap"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${group.groupId}"/>" /></td> --%>
			    <td nowrap="nowrap"><span class="link"><a href="#LINK" onclick="javascript:fncSelectGroup('<c:out value="${group.groupId}"/>')"><c:out value="${group.groupId}"/></a></span></td>
			    <td nowrap="nowrap"><span class="link"><a href="#LINK" onclick="javascript:fncSelectGroup('<c:out value="${group.groupId}"/>')"><c:out value="${group.groupNm}"/></a></span></td>
			  </tr>
			</c:forEach>
            <c:if test="${empty groupList}">
                <tr>
                    <td colspan="2"><spring:message code="common.nodata.msg" /></td>
                </tr>
            </c:if>
			</tbody>
        </table>
    </div>

    <!-- 페이지 네비게이션 시작 -->
    <c:if test="${!empty groupManageVO.pageIndex }">
	    <div id="paging_div">
	        <ul class="paging_align">
		        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
	        </ul>
	    </div>

	    <div class="board_btn_wrap">
		    <a href="#LINK" onclick="javascript:fnClose(); return false;" class="board_btn"><spring:message code="button.close" /></a>
		</div>
    </c:if>
    <!-- //페이지 네비게이션 끝 -->

	<input type="hidden" name="groupId"/>
	<input type="hidden" name="groupIds"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${groupManageVO.pageIndex}'/>"/>
	<input type="hidden" name="searchCondition" value="1"/>
	</div></div></div>
</form>
