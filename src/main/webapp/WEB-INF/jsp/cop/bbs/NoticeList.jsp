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

    paging(totalRecordCount, recordCountPerPage, pageSize, currentPageNo);

});

    function fn_addNotice() {

        document.listForm.action = "<c:url value='/cop/bbs/addBoardArticle.do'/>";
        document.listForm.submit();
    }

    function fn_select_noticeList(pageNo) {
        document.listForm.pageIndex.value = pageNo;
        document.listForm.action = "<c:url value='/cop/bbs/selectBoardList.do'/>";
        document.listForm.submit();
    }

    function fn_inqire_notice(nttId, bbsId) {
        document.subForm.searchCnd.value = document.listForm.searchCnd.value;
        document.subForm.searchWrd.value = document.listForm.searchWrd.value;
        document.subForm.nttId.value = nttId;
        document.subForm.bbsId.value = bbsId;
        document.subForm.action = "<c:url value='/cop/bbs/selectBoardArticle.do'/>";
        document.subForm.submit();
    }

    /* 검색 function */
    function fnSearch(){
    	document.listForm.submit();
//         var param = {
//             firstIndex : '0',
//             searchCnd : $("#searchCnd").val(),
//             searchWrd : $("#searchWrd").val(),
//             bbsId : '${boardVO.bbsId}',
//             recordCountPerPage : $("#recordCountPerPage").val(),
//         }
//         // search_select
//         $.ajax({
//             url : "<c:url value='/cop/bbs/searchNoticeList.do'/>",
//             type : "POST",
//             dataType:'json',
//             contentType:"application/json; charset=UTF-8",
//             data : JSON.stringify(param),
//             success : function(data){

//             }
//         });

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
         <h3>${boardVO.bbsNm} 목록</h3>
     </div>
     <form name="listForm" action ="<c:url value='/cop/bbs/selectBoardList.do'/>" method="post">
        <div class="panel-body">
            <div class="search-area">
                 <input type="hidden" name="nttId"  value="<c:out value='${boardVO.nttId}'/>" />
	             <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
	             <input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
	             <input type="hidden" name="bbsNm" value="<c:out value='${boardVO.bbsNm}'/>" />
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

            <div class="table-box table-border table-hover">
                <table>
                    <caption>자료실</caption>
                    <colgroup>
                        <col style="width:5%;">
                        <col style="width:auto;">
                        <c:if test="${boardVO.bbsId eq 'BBS03'}">
                            <col style="width:5%;">
                        </c:if>
                        <col style="width:10%;">
                        <col style="width:5%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">순번</th>
                            <th scope="col">제목</th>
                            <c:if test="${boardVO.bbsId eq 'BBS03' }">
                                <th scope="col">댓글</th>
                            </c:if>
                            <th scope="col">작성자</th>
                            <th scope="col">첨부</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="result" items="${resultList}" varStatus="status">
	                        <tr>
	                            <td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
	                            <c:choose>
	                               <c:when test="${result.replyLc != 0}">
	                                   <td class="comment textL"><c:out value="${result.nttSj}"/></td>
	                               </c:when>
	                               <c:otherwise>
	                                   <td class="textL" onclick="fnDetail('${result.nttId}', '${result.bbsId}'); return false;"><c:out value="${result.nttSj}"/></td>
	                               </c:otherwise>
	                            </c:choose>
	                            <c:if test="${boardVO.bbsId eq 'BBS03'}">
	                                <td>1</td>
                                </c:if>
		                        <td><c:out value="${result.frstRegisterNm}"/></td>
		                        <td class="file"><i class="fas fa-save" title="첨부파일" <c:if test="${result.atchFileId eq '                    '}"> style="display: none;"</c:if>></i></td>
		                        <td><c:out value="${result.frstRegisterPnttm}"/></td>
		                        <td><c:out value="${result.inqireCo}"/></td>
	                        </tr>
                        </c:forEach>
                    </tbody>
	            </table>
            </div>
	    </div>
        <div class="panel-footer justify-content-center">
	        <div class="page">
                <ul id="paging"></ul>
	        </div>
			<div class="btn-area">
			    <button type="button" class="btn btn-primary btn-lg" onclick="fn_addNotice(); return false;">등록</button>
			</div>
	    </div>
    </form>

<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
