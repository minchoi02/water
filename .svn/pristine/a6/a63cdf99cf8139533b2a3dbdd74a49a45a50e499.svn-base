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
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/sys/menu/mlm/BbsListSearch.do'/>";
   	document.listForm.submit();
}

/* ********************************************************
 * 게시판목록 선택 처리 함수
 ******************************************************** */
function choisBbsListSearch(bbsId) {
	var url = "/cop/bbs/selectBoardList.do?bbsId="+bbsId;
	opener.document.all.url.value = url;
    window.close();
}
//-->
</script>
<form name="listForm" action ="<c:url value='/sys/menu/mlm/BbsListSearch.do'/>" method="post">
	<div id="pop_wrap" style="width:800px;">
		<div class="pop_inner">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	<div id="sub_con_wrap">
    <div id="search_field">
            <fieldset><legend>조건정보 영역</legend>
            <div class="sf_start">
                <ul class="search_form">
                    <li>
                        <label for="searchKeyword" class="first">게시판명</label>
                        <input id="searchKeyword" name="searchKeyword" type="text" size="30" value="<c:out value='${searchVO.searchKeyword}'/>" maxlength="60" title="검색조건" class="input_style1 input_w7" >
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
        <table summary="게시판명 검색목록으로 게시판명 게시판명으로 구성됨">
            <caption>게시판명 검색</caption>
            <colgroup>
            <col width="50%" >
            <col width="50%" >
            </colgroup>
            <thead>
            <tr>
                <th scope="col" class="f_field" nowrap="nowrap">게시판ID</th>
                <th scope="col" nowrap="nowrap">게시판명</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="result" items="${list_bbs}" varStatus="status">
            <!-- loop 시작 -->
              <tr>
			    <td nowrap="nowrap">
			        <span class="link"><a href="#LINK" onclick="choisBbsListSearch('<c:out value="${result.bbsId}"/>'); return false;">
			      	<c:out value="${result.bbsId}"/></a></span>
			    </td>
			    <td nowrap="nowrap">
			    	<span class="link"><a href="#LINK" onclick="choisBbsListSearch('<c:out value="${result.bbsId}"/>'); return false;">
			      	<c:out value="${result.bbsNm}"/></a></span>
			    </td>
              </tr>
            </c:forEach>
            <c:if test="${fn:length(list_bbs) == 0}">
                        <tr>
	                        <td class="listCenter" colspan="2" ><spring:message code="common.nodata.msg" /></td>
			          	</tr>
				    </c:if>
            </tbody>
        </table>
    </div>

    <!-- 페이지 네비게이션 시작 -->
    <div id="paging_div">
        <ul class="paging_align">
            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/>
        </ul>
    </div>
    <!-- //페이지 네비게이션 끝 -->
	</div></div></div>
</form>