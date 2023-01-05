<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
$(document).ready(function(){
	const rowData =${resultList};
	const grid = new tui.Grid({
	  el: document.getElementById('grid'),
	  data: rowData,
	  scrollX: false,
	  scrollY: false,
	  columns: [
	    {
	      header: '유니크아이디',
	      name: 'uniqId',
	      sortingType: 'desc',
	      sortable: true
	    },
	    {
	      header: '유저타입',
	      name: 'userTy'
	    },
	    {
	      header: '아이디',
	      name: 'userId',
	      sortingType: 'desc',
		  sortable: true
	    },
	    {
	      header: '이름',
	      name: 'userNm',
	      filter: 'select'
	    }
	  ]
	});
	tui.Grid.applyTheme('striped', {
	    grid: {
	        border: '#aaa',
	        text: '#333'
	    },
	    cell: {
	        disabled: {
	            text: '#999'
	        }
	    }
	});

});
function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/cmm/sample/basicGrid.do'/>";
    document.listForm.submit();
}
/* 검색 function */
function fnSearch(){
	document.listForm.pageIndex.value = "1";
	document.listForm.action = "<c:url value='/cmm/sample/basicGrid.do'/>";
    document.listForm.submit();
}
</script>
</head>
<body>

<main id="contents">
    <div class="content-wrap">
        <h2 class="hidden">컨텐츠영역</h2>
            <!-- panel -->
            <section class="panel-wrap">
            <div class="panel-header">
                <h3>회원관리 목록</h3>
            </div>
            <div class="panel-body">
                <div class="search-area">
                    <form name="listForm" action="<c:url value='/cmm/sample/basicGrid.do'/>" method="post">
		                <input name="selectedId" type="hidden" />
		                <input name="checkedIdForDel" type="hidden" />
		                <input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>

                        <label for="searchCondition" class="hidden">검색조건</label>
	                    <select id="searchCondition" name="searchCondition" title="검색조건 선택" class="select_style1">
                            <option value="" selected>선택하세요</option>
	                        <option value="0">아이디</option>
	                        <option value="1">이름</option>
	                    </select>
                        <input type="text" id="SearchKeyword" name="searchKeyword" size="35" maxlength="35" title="검색어 입력"/>
                        <button type="submit" class="btn btn-primary" onclick="javascript:fnSearch(); return false;">검색</button>
                    </form>
                </div>
                <div class="table-header">
                    <div>총&nbsp<strong class="secondary">${paginationInfo.totalRecordCount}</strong>건이 검색 되었습니다.</div>
<%--                         ${custld:renderPageInfoWithoutExcel(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount(), 'Y')} --%>
                </div>
                <div class="y-scroll content-height-4">
                    <table>
                       <td>
                             <div id="grid"></div>
                             <div id="fl"></div>
                       </td>
                    </table>
                </div>
            </div>


            <div class="panel-footer">
                <div class="page">
                    <ul>
                        <li><a href="#"><i class="fas fa-angle-left"></i></a></li>
                        <li>
                            <ui:pagination paginationInfo="${paginationInfo}"  jsFunction="fn_select_noticeList" />
                        </li>
                        <li><a href="#"><i class="fas fa-angle-right"></i></a></li>
                    </ul>
                </div>
<!--                 <div class="btn-area"> -->
<!--                     <button type="button" class="btn btn-primary btn-lg" onclick="fn_addNotice(); return false;">등록</button> -->
<!--                 </div> -->
            </div>
        </section>
    </div>
</main>

<%-- <form:form name="listForm" action="<c:url value='/cmm/sample/basicGrid.do'/>" method="post"> --%>
<!--  <div id="cur_loc"> -->
<!--                    <div id="cur_loc_align"> -->
<!--                        <ul> -->
<!--                            <li>HOME</li> -->
<!--                            <li>시스템관리</li> -->
<!--                            <li>회원관리</li> -->
<!--                            <li class="last"><strong>회원관리</strong></li> -->
<!--                        </ul> -->
<!--                    </div> -->
<!--                </div> -->

<!-- 			<div class="sub_tit_wrap"> -->
<!--                	<h2>회원관리 <strong>목록</strong></h2> -->
<!--                </div> -->
<!--                <div id="sub_con_wrap"> -->
               <!-- 검색 필드 박스 시작 -->
<!--                <div id="search_field"> -->
<!-- 		        <input name="selectedId" type="hidden" /> -->
<!-- 		        <input name="checkedIdForDel" type="hidden" /> -->
<%-- 		        <input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/> --%>

<!--                       <fieldset><legend>조건정보 영역</legend> -->
	<!--                       <div class="sf_start"> -->
	<!--                           <ul class="search_form"> -->
	<!--                               <li> -->
	<!--                               	<label for="sbscrbSttus" class="first">가입상태</label> -->
	<!-- 			                <select name="sbscrbSttus" id="sbscrbSttus" title="검색조건1-회원상태" class="select_style1"> -->
	<%-- 			                    <option value="0" <c:if test="${empty userSearchVO.sbscrbSttus || userSearchVO.sbscrbSttus == '0'}">selected="selected"</c:if> >전체</option> --%>
	<%-- 			                    <option value="A" <c:if test="${userSearchVO.sbscrbSttus == 'A'}">selected="selected"</c:if> >신청</option> --%>
	<%-- 			                    <option value="P" <c:if test="${userSearchVO.sbscrbSttus == 'P'}">selected="selected"</c:if> >승인</option> --%>
	<%-- 			                    <option value="D" <c:if test="${userSearchVO.sbscrbSttus == 'D'}">selected="selected"</c:if> >삭제</option> --%>
	<!-- 			                </select> -->

	<!--                               	<label for="searchCondition">검색조건</label> -->
	<!-- 			                <select name="searchCondition" id="searchCondition" title="검색조건2-검색어구분" class="select_style1"> -->
	<%-- 			                    <option value="0" <c:if test="${userSearchVO.searchCondition == '0'}">selected="selected"</c:if> >아이디</option> --%>
	<%-- 			                    <option value="1" <c:if test="${empty userSearchVO.searchCondition || userSearchVO.searchCondition == '1'}">selected="selected"</c:if> >이름</option> --%>
	<!-- 			                </select> -->
	<%-- 			                <input name="searchKeyword" title="검색어" type="text" value="<c:out value="${userSearchVO.searchKeyword}"/>" class="input_style1 input_w1" /> --%>
	<!--                               </li> -->
	<!--                           </ul> -->

	<!--                           <div class="search_btn_wrap"> -->
	<%--                               <a href="#LINK" onclick="javascript:fnSearch(); return false;" class="search_btn"><spring:message code="button.search" /></a> --%>
	<!--                           </div> -->
	<!--                       </div> -->
<!--                       </fieldset> -->
<!--                </div> -->
               <!-- //검색 필드 박스 끝 -->
<%--                ${custld:renderPageInfo(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount())} --%>
<!-- <div id="grid"></div> -->
<!-- <div id="fl"></div> -->
 <!-- 페이지 네비게이션 시작 -->
<!--  <div id="paging_div"> -->
<!--      <ul class="paging_align"> -->
<%--          <ui:pagination paginationInfo = "${paginationInfo}"  type="image" jsFunction="fnLinkPage" /> --%>
<!--      </ul> -->
<!--  </div> -->
 <!-- //페이지 네비게이션 끝 -->
<!-- </div> -->
<%--  </form:form> --%>
