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

<script type="text/javaScript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sys/menu/mcm/MenuCreatManage.do'/>";
    document.listForm.submit();
}

/* ********************************************************
 * 메뉴생성 화면 호출
 ******************************************************** */
function selectMenuCreat(vAuthorCode) {
    document.listForm.authorCode.value = vAuthorCode;
    document.listForm.action = "<c:url value='/sys/menu/mcm/MenuCreatSelect.do'/>";
    window.open("#", "_menuCreat", "scrollbars = yes, top=100px, left=100px, height=700px, width=640px");
    document.listForm.target = "_menuCreat";
    document.listForm.submit();
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
//-->
</script>
            <form name="listForm" action ="<c:url value='/sys/menu/mcm/MenuCreatManage.do'/>" method="post">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>시스템관리</li>
                            <li>메뉴관리</li>
                            <li class="last"><strong>메뉴생성관리</strong></li>
                        </ul>
                    </div>
                </div>

				<div class="sub_tit_wrap">
                	<h2>메뉴생성관리 <strong>목록</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
					<input name="checkedMenuNoForDel" type="hidden" />
					<input name="authorCode"          type="hidden" />
					<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

                        <fieldset><legend>조건정보 영역</legend>
                        <div class="sf_start">
                            <ul class="search_form">
                                <li>
                                    <label for="searchKeyword" class="first">사용자ID</label>
                                    <input id="searchKeyword" name="searchKeyword" type="text" size="80" value=""  maxlength="60" title="검색조건" class="input_style1 input_w1" />
                                </li>
                            </ul>

                            <div class="search_btn_wrap">
                            	<a href="#LINK" onclick="javascript:fnSearch(); return false;" class="search_btn"><spring:message code="button.search" /></a>
                            </div>
                        </div>
                        </fieldset>
                </div>
                <!-- //검색 필드 박스 끝 -->
                ${custld:renderPageInfoWithoutExcel(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount(), 'Y')}
                <!-- table add start -->
                <div class="tablestyle_1">
                    <table summary="메뉴생성관리  목록화면으로 권한코드, 권한명, 권한설명, 메뉴생성여부, 메뉴생성으로 구성됨">
                    <caption>메뉴생성관리 목록</caption>
                    <colgroup>
                    <col width="25%" >
                    <col width="20%" >
                    <col width="25%" >
                    <col width="15%" >
                    <col width="15%" >
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap">권한코드</th>
                        <th scope="col" nowrap="nowrap">권한명</th>
                        <th scope="col" nowrap="nowrap">권한 설명</th>
                        <th scope="col" nowrap="nowrap">메뉴생성여부</th>
                        <th scope="col" nowrap="nowrap">메뉴생성</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="result" items="${list_menumanage}" varStatus="status">
                    <!-- loop 시작 -->
                      <tr>
					    <td nowrap="nowrap"  ><c:out value="${result.authorCode}"/></td>
					    <td nowrap="nowrap"  ><c:out value="${result.authorNm}"/></td>
					    <td nowrap="nowrap"  ><c:out value="${result.authorDc}"/></td>
					    <td nowrap="nowrap"  >
					          <c:if test="${result.chkYeoBu > 0}">Y</c:if>
					          <c:if test="${result.chkYeoBu == 0}">N</c:if>
					    </td>
					    <td nowrap="nowrap" >
                            <a href="<c:url value='/sys/menu/mcm/MenuCreatSelect.do'/>?authorCode='<c:out value="${result.authorCode}"/>'"  onclick="selectMenuCreat('<c:out value="${result.authorCode}"/>'); return false;"><img src="<c:url value='/images/img_search.png'/>" width="15" height="15" align="middle" alt="메뉴생성"></a>
					    </td>
                      </tr>
                     </c:forEach>
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

                <input type="hidden" name="req_menuNo">
                </div>
            </form>