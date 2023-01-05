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

<script type="text/javaScript">

var totalRecordCount = ${paginationInfo.totalRecordCount};          // 총 게시물 건 수
var recordCountPerPage = 10;                                        // 보여지는 페이지 개수
var pageSize = 5;                                                   // 페이지 크기
var currentPageNo = 1;                                              // 현재 페이지 번호
var pageGroup;                                                      // 페이지 그룹
var totalPageCount;                                                 // 총 페이지 수
var lastPageNo;                                                     // 마지막 페이지 번호
var firstPageNo;                                                    // 첫번째 페이지 번호
var nextPageNo;                                                     // 다음 페이지 번호
var prevPageNo;                                                     // 이전 페이지 번호
var pageHtml = "";

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
 $(document).ready(function(){
    //그리드 시작
    const gridData =${resultList};
 	grid = new tui.Grid({
 	  el: document.getElementById('grid'),
 	  data: gridData,
 	  scrollX: false,
 	  scrollY: false,
 	  rowHeaders: ["rowNum"],
 	  columns: [
 	    {
 	      header: '코드ID',
 	      name: 'codeId',
 	      sortingType: 'desc',
 	      sortable: true
 	    },
 	    {
 	      header: '코드명',
 	      name: 'codeNm',
 	      sortingType: 'desc',
 		  sortable: true
 	    },
 	    {
 	      header: '사용여부',
 	      name: 'useYn',
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
 	grid.on('click', function(object)  {
	    if(object.rowKey!=undefined){
	        if(object.columnName =='codeNm'){
	            fnDetail(grid.getValue(object.rowKey,"codeId"))
	        }else{
	       	 	fnSelect(grid.getValue(object.rowKey,"codeId"));
	        }
	    }
	  })

    //그리드 시작
    const gridData2 =${resultList2};
 	grid2 = new tui.Grid({
 	  el: document.getElementById('grid2'),
 	  data: gridData2,
 	  scrollX: false,
 	  scrollY: false,
 	  rowHeaders: ['rowNum'],
 	  columns: [
 	    {
 	      header: '코드',
 	      name: 'code',
 	      sortingType: 'desc',
 	      sortable: true,
 	      hidden:true
 	 	},
 	    {
 	      header: '코드ID',
 	      name: 'codeId',
 	      sortingType: 'desc',
 	      sortable: true
 	    },
 	    {
 	      header: '코드ID명',
 	      name: 'codeNm',
 	      sortingType: 'desc',
 		  sortable: true
 	    },
 	    {
 	      header: '사용여부',
 	      name: 'useYn',
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
	grid2.on('click', function(object) {
	    if(object.rowKey!=undefined){
	        if(object.columnName =='codeNm'){
	            fnDetail2(grid2.getValue(object.rowKey,"code"),grid2.getValue(object.rowKey,"codeId"))
	        }
	    }
	  });

	paging(totalRecordCount, recordCountPerPage, pageSize, currentPageNo);
 });

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sys/code/hcm/CcmCmmnCodeList.do'/>";
    document.listForm.submit();
}
function fnExcel(){
	document.listForm.action = "<c:url value='/sys/code/hcm/CcmCmmnCodeListExcel.do'/>";
	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fnRegist(){
	document.listForm.action           = "<c:url value='/sys/code/hcm/CcmCmmnCodeRegist.do'/>";
	document.listForm.submit();
}
function fnRegistDetail(codeId){
	document.listForm.action           = "<c:url value='/sys/code/lcm/CcmCmmnDetailCodeRegist.do'/>";
	document.listForm.codeId.value     = codeId;
	document.listForm.submit();
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fnModify(){
    location.href = "";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fnDetail(codeId){
    document.listForm.action           = "<c:url value='/sys/code/hcm/CcmCmmnCodeModify.do'/>";
    document.listForm.codeId.value     = codeId;
    document.listForm.submit();
}
function fnDetail2(code,codeId){
    document.listForm.action           = "<c:url value='/sys/code/lcm/CcmCmmnDetailCodeModify.do'/>";
    document.listForm.codeId.value     = codeId;
    document.listForm.code.value       = code;
    document.listForm.submit();
}
function fnSelect(codeId){
    var param = {
    		codeId : codeId
    }
    $.ajax({
    	url : "<c:url value='/sys/code/hcm/selectCcmCmmnCodeList.do'/>",
    	type : "POST",
    	dataType : "json",
    	contentType : "application/json; charset=UTF-8",
    	data : JSON.stringify(param),
    	success : function(data){
    		grid2.resetData(data);
    	}
    })

    $.ajax({
        url : "<c:url value='/sys/code/hcm/pageDetailCcmCmmnCodeList.do'/>",
        type : "POST",
        dataType : "JSON",
        contentType:"application/json; charset=UTF-8",
        data : JSON.stringify(param),
        success : function(data){
            console.log(data);
            $("#totalPageCntDetail").text(data);
        }
    })
}
/* 검색 function */
function fnSearch(){
	var param = {
		firstIndex : '0',
        searchCondition : $("#searchCondition").val(),
        searchKeyword : $("#searchKeyword").val(),
        recordCountPerPage : $("#recordCountPerPage").val(),
	}
	// search_select
	$.ajax({
	    url : "<c:url value='/sys/code/hcm/searchCcmCmmnCodeList.do'/>",
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
	     url : "<c:url value='/sys/code/hcm/pageCcmCmmnCodeList.do'/>",
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
            searchCondition : $("#searchCondition").val(),
            searchKeyword : $("#searchKeyword").val(),
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
        url : "<c:url value='/sys/code/hcm/CcmCmmnCodeListPage.do'/>",
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

    if(totalPageCount < pageSize){
        pageSize = totalPageCount;
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
<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
</script>
</head>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>코드 관리 목록</h3>
    </div>
    <form name="listForm" action ="<c:url value='/sys/code/hcm/CcmCmmnCodeList.do'/>" method="post">
        <div class="panel-body">
		    <div class="search-area">
	            <input type=hidden name="code">
	            <input type=hidden name="codeId">
	            <input type=hidden name="pageIndex" value="${searchVO.pageIndex}" >

	            <label for="searchCondition" class="hidden">검색</label>
	            <select id="searchCondition" name="searchCondition">
                    <option value="1">코드ID</option>
                    <option value="2">코드명</option>
	            </select>
	            <input type="text" id="searchKeyword" name="searchKeyword" size="35" placeholder="검색어를 입력하세요." />
	            <button type="button" class="btn btn-primary" onclick="javascript:fnSearch(); return false;">검색</button>
		    </div>
		    <div class="row">
		       <div class="col-6">
                    <div class="table-header">
                        <div>총 <strong class="secondary" id="totalPageCnt">${paginationInfo.totalRecordCount}</strong>건이 검색 되었습니다.
                        	<div class="bg-infor code-infor"><i class="fa-solid fa-circle-info danger"></i><strong>상세코드 보기</strong> : 해당 [코드 ID] 클릭</div>
                            <div class="bg-infor code-infor"><i class="fa-solid fa-circle-info danger"></i><strong>공통코드 수정</strong> : 해당 [코드명] 클릭</div>
                        </div>
                        <div>
                            <select id='recordCountPerPage' name='recordCountPerPage' onchange='fnSearch();'>
                             <option value='10' <c:if test="${paginationInfo.recordCountPerPage eq 10}"> selected </c:if> >10개씩보기</option>
                             <option value='30' <c:if test="${paginationInfo.recordCountPerPage eq 30}"> selected </c:if> >30개씩보기</option>
                             <option value='50' <c:if test="${paginationInfo.recordCountPerPage eq 50}"> selected </c:if> >50개씩보기</option>
                            </select>
                        </div>
                    </div>
                    <div class="y-scroll content-height-4">
	                    <table>
	                        <div id="grid"></div>
	                        <div id="fl"></div>
	                    </table>
                    </div>
					<div class="panel-footer justify-content-left ml0 mr0">
					    <div class="page">
					        <ul id="paging"></ul>
					    </div>
					    <div class="btn-area">
					        <button type="button" class="btn btn-primary btn-lg" onclick="fnRegist(); return false;">코드등록</button>
					    </div>
					</div>
		       </div>
	           <div class="col-6">
                    <div class="table-header">
                        <div>총 <strong class="secondary" id="totalPageCntDetail">${paginationInfo2.totalRecordCount}</strong>건이 검색 되었습니다.</div>
                    </div>
                    <div class="y-scroll content-height-4">
	                    <table>
	                        <div id="grid2"></div>
	                        <div id="fl"></div>
	                    </table>
                    </div>
                    <div class="panel-footer justify-content-left ml0 mr0">
                        <div class="btn-area">
                            <button type="button" class="btn btn-primary btn-lg" onclick="fnRegistDetail('${searchVO.codeId}'); return false;">상세코드등록</button>
                        </div>
                    </div>
		       </div>
		    </div>
	   </div>
   </form>
</section>