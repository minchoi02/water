<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/"/>

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css">
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />" ></script>
<script type="text/javascript">

var totalRecordCount = ${paginationInfo.totalRecordCount};          // 총 게시물 건 수
var recordCountPerPage = 10;                                        // 보여지는 페이지 개수
var pageSize;                                                       // 페이지 크기
var currentPageNo = 1;                                              // 현재 페이지 번호
var pageGroup;                                                      // 페이지 그룹
var totalPageCount;                                                 // 총 페이지 수
var lastPageNo;                                                     // 마지막 페이지 번호
var firstPageNo;                                                    // 첫번째 페이지 번호
var nextPageNo;                                                     // 다음 페이지 번호
var prevPageNo;                                                     // 이전 페이지 번호
var pageHtml = "";

<!--
$(document).ready(function(){


});

    function fn_addGallery() {

        document.listForm.action = "<c:url value='/cop/bbs/addBoardArticle.do'/>";
        document.listForm.submit();
    }

    function fn_select_noticeList(pageNo) {
        document.listForm.pageIndex.value = pageNo;
        document.listForm.action = "<c:url value='/cop/bbs/selectBoardList.do'/>";
        document.listForm.submit();
    }

    function fn_inqire_notice(nttId, bbsId) {
        document.listForm.nttId.value = nttId;
        document.listForm.bbsId.value = bbsId;
        document.listForm.action = "<c:url value='/cop/bbs/selectBoardArticle.do'/>";
        document.listForm.submit();
    }

    /* 검색 function */
    function fnSearch(){
        var param = {
            firstIndex : '0',
            searchCnd : $("#searchCnd").val(),
            searchWrd : $("#searchWrd").val(),
            bbsId : '${boardVO.bbsId}',
            recordCountPerPage : $("#recordCountPerPage").val(),
        }
        // search_select
        $.ajax({
            url : "<c:url value='/cop/bbs/searchNoticeList.do'/>",
            type : "POST",
            dataType:'json',
            contentType:"application/json; charset=UTF-8",
            data : JSON.stringify(param),
            success : function(data){
                grid.resetData(data);
            }
        });

        // search_page(totalpagination)
        $.ajax({
             url : "<c:url value='/cop/bbs/pageNoticeList.do'/>",
             type : "POST",
             dataType:'json',
             contentType:"application/json; charset=UTF-8",
             data : JSON.stringify(param),
             success : function(data){
                 $("#totalPageCnt").text(data);
                 totalRecordCount = data;
                 pageHtml = "";
                 paging(totalRecordCount, param.recordCountPerPage, pageSize, currentPageNo);
             }
         });

    }

    /* 페이지 function*/
    function fn_select_page(page){
        var param = {
                pageIndex : page,
                firstIndex : "",
                searchCnd : $("#searchCnd").val(),
                searchWrd : $("#searchWrd").val(),
                bbsId : '${boardVO.bbsId}',
                recordCountPerPage : $("#recordCountPerPage").val()
        }
        if(param.recordCountPerPage == 30){
            param.firstIndex = (page - 1) * 30;
        } else if(param.recordCountPerPage == 50){
            param.firstIndex = (page - 1) * 50;
        } else {
            param.firstIndex = (page - 1) * 10;
        }

        $.ajax({
            url : "<c:url value='/cop/bbs/NoticeListPage.do'/>",
            type : "POST",
            dataType:'json',
            contentType:"application/json; charset=UTF-8",
            data : JSON.stringify(param),
            success : function(data){
                grid.resetData(data);

            }
        });

    }

    function paging(totalRecordCount, recordCountPerPage, pageSize, currentPageNo){
        totalPageCount = Math.ceil(totalRecordCount / recordCountPerPage);

        if(totalPageCount < 1){
            pageSize = 1;
        } else {
            pageSize = 5;
        }

        pageGroup = Math.ceil(currentPageNo / pageSize);
        lastPageNo = pageGroup * pageSize;

        firstPageNo = lastPageNo - (pageSize - 1);

        if(lastPageNo > totalPageCount){
            lastPageNo = totalPageCount;
        }

        nextPageNo = lastPageNo + 1;
        prevPageNo = firstPageNo - 1;

        if(prevPageNo > 0){
            pageHtml += "<li><a href='#' id='prev' onclick='javascript:fn_select_page(" + prevPageNo + "); return false;'><i class='fas fa-angle-left'></i></a></li>";
        }

        for(var i = firstPageNo; i <= lastPageNo; i++){
            if(currentPageNo == i){
                pageHtml += "<li class='active'><a href='#'" + i + ">" + i + "</a></li>";
            } else {
             pageHtml += "<li><a href='?pageIndex=" + i + "' onclick='javascript:fn_select_page(" + i + "); return false;'>" + i + "</a></li>";
            }
        }

        if(lastPageNo < totalPageCount){
            pageHtml += "<li><a href='?pageIndex=" + nextPageNo + "' id='next' onclick='javascript:fn_select_page(" + nextPageNo + "); return false;'><i class = 'fas fa-angle-right'></i></a></li>";
        }

        $("#paging").html(pageHtml);

        $("#paging li a").click(function (){
            var $id = $(this).attr("id");
            selectedPageNo = $(this).text();

            if($id == "prev") selectedPageNo = prevPageNo;
            if($id == "next") selectedPageNo = nextPageNo;

            currentPageNo = selectedPageNo;

            pageHtml = "";
            paging(totalRecordCount, recordCountPerPage, pageSize, selectedPageNo);
        });
    }

    function fnDetail(nttId, bbsId){
    	document.listForm.nttId.value = nttId;
    	document.listForm.bbsId.value = bbsId;
    	document.listForm.action = "<c:url value='/cop/bbs/selectBoardArticle.do'/>";
    	document.listForm.submit();
    }
-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
    <!-- panel -->
     <div class="panel-header">
         <h3>${boardVO.bbsNm} 갤러리 목록</h3>
     </div>
     <form name="listForm" action ="<c:url value='/cop/bbs/selectBoardList.do'/>" method="post">
        <div class="panel-body">
            <div class="search-area">
                 <input type="hidden" name="nttId"  value="0" />
	             <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
	             <input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
	             <input type="hidden" name="bbsNm" value="<c:out value='${boardVO.bbsNm}'/>" />
	             <input type="hidden" name="bbsTy" value="2" />
	             <input type="hidden" name="adminLimitAt"  value="<c:out value='${boardVO.adminLimitAt}'/>" />
	             <input type="hidden" name="fileAtchAt"  value="<c:out value='${boardVO.fileAtchAt}'/>" />
	             <input type="hidden" name="fileAtchCnt"  value="<c:out value='${boardVO.fileAtchCnt}'/>" />
	             <input type="hidden" name="replyPosbAt"  value="<c:out value='${boardVO.replyPosbAt}'/>" />

	             <label for="searchCnd" class="hidden">검색조건</label>
	             <select id="searchCnd" name="searchCnd" title="검색조건 선택">
	                 <option value="1">제목</option>
	                 <option value="2">작성자</option>
	             </select>
	             <input type="text" id="searchWrd" name="searchWrd" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" title="검색어 입력"/>
	             <button type="button" class="btn btn-primary" onclick="javascript:fnSearch(); return false;">검색</button>
            </div>
            <div class="table-header">
                <div>총 <strong class="secondary" id="totalPageCnt">${paginationInfo.totalRecordCount}</strong>건이 검색 되었습니다.</div>
                <div>
                    <select id='recordCountPerPage' name='recordCountPerPage' onchange='fnSearch();'>
                        <option value='10' <c:if test="${paginationInfo.recordCountPerPage eq 10}"> selected </c:if> >10개씩보기</option>
                        <option value='30' <c:if test="${paginationInfo.recordCountPerPage eq 30}"> selected </c:if> >30개씩보기</option>
                        <option value='50' <c:if test="${paginationInfo.recordCountPerPage eq 50}"> selected </c:if> >50개씩보기</option>
                    </select>
                </div>
            </div>
            <ul class="gallery-area">
            	<c:forEach var="result" items="${resultList}" varStatus="status">
	            <li>
	                <a href="#" onclick="fn_inqire_notice('${result.nttId}','${result.bbsId}');">
	                    <div><img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fn:replace(fn:replace(result.atchFileId, '<', '&lt;'), '>', '&gt;')}"/>&fileSn=0' alt="갤러리" /></div>
	                    <p>${result.nttSj}</p>
	                </a>
	            </li>
	            </c:forEach>
	            <c:if test="${fn:length(resultList) == 0}">
			 		<p class="txt"><spring:message code="common.nodata.msg" /></p>
				</c:if>
	        </ul>
	    </div>
        <div class="panel-footer justify-content-center">
	        <div class="page">
                 <ul>
                 	<li>
                    	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_select_noticeList" />
               		</li>
                 </ul>
	        </div>
			<div class="btn-area">
			    <button type="button" class="btn btn-primary btn-lg" onclick="fn_addGallery(); return false;">등록</button>
			</div>
	    </div>
    </form>

<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
