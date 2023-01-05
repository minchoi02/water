<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<%
 /**
  * @Class Name : TcpMendngImprmnList.jsp
  * @Description : TcpMendngImprmn List 화면
  * @Modification Information
  *
  * @author 이희중
  * @since 2021-03-23
  * @version 1.0
  * @see
  *
  * Copyright (C) All right reserved.
  */
%>

<script type="text/javaScript" language="javascript" defer="defer">


function fn_search(pageNum) {
 	//var confmKey = "devU01TX0FVVEgyMDIxMDcxNTE0MDYwNDExMTQxNTQ=";
	// 개발키
	var confmKey = '${getPostKeyDev}';
	// 운영키
// 	var confmKey = '${getPostKeyOpr}';

	var currentPage;

	if(pageNum == 'Y'){
		currentPage = document.listForm.currentPage.value;
	}else{
		document.listForm.currentPage.value = 1;
		currentPage = 1;
	}

	var countPerPage = 10;

	var keyword =   $('#listForm input[name=keyword]').val();

	if(!keyword){
		alert("주소 검색어를 입력해주세요.");
		return;
	}

	var resultType = 'json';

    $.ajax({
        url:'<c:url value='https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do'/>',
    	type:"post",
        dataType:"jsonp",
        async: false,
    	crossDomain:true,
        data: {confmKey:confmKey,currentPage:currentPage,countPerPage:countPerPage,keyword:keyword,resultType:resultType},
        success:function(data){
            console.log(data);
        	$("#tbody").html("");
        	var html = "";

        	if(data.results.juso.length>0){
	        	$(data.results.juso).each(function(n){
	        		html += "<tr onclick = \"fn_select(parseInt("+parseInt(n+1)+"))\">";
	        		html +=	"<td nowrap=\"nowrap\">"+parseInt(n+1+((currentPage-1)*10))+"</td> ";
	        		html +=	"<td nowrap=\"nowrap\">"+this.zipNo+"</td> ";
	        		html +=	"<td nowrap=\"nowrap\">"+this.roadAddr+"</td> ";
	        		html +=	"<td nowrap=\"nowrap\">"+this.jibunAddr+"</td> ";
	        		html += "</tr>";
	        	});

	        	$("#page_info_left strong").text(data.results.common.totalCount + "건");

	        	pageMake(data);

        	}else{
				html += "<tr>";
				html += "<td class=\"listCenter\" colspan=\"4\" >검색한 주소가 없습니다.</td>"
				html += "</tr>";

				// 기존 페이징 처리 제거 용도
				$("#paging_div > ul").remove();
        	}
        	$("#tbody").append(html);

        }
    });
}

function pageMake(xmlStr){

	var total = xmlStr.results.common.totalCount; // 총건수
	var pageNum = document.listForm.currentPage.value;// 현재페이지
	var paggingStr = "";
	paggingStr += "<ul class=\"paging_align\">"
	if(total > 0){
		var PAGEBLOCK=document.listForm.countPerPage.value;
		var pageSize=document.listForm.countPerPage.value;
		var totalPages = Math.floor((total-1)/pageSize) + 1;
		var firstPage = Math.floor((pageNum-1)/PAGEBLOCK) * PAGEBLOCK + 1;
		if( firstPage <= 0 ) firstPage = 1;
		var lastPage = firstPage-1 + parseInt(PAGEBLOCK);
		if( lastPage > totalPages ) lastPage = totalPages;
		var nextPage = lastPage+1 ;
		var prePage = firstPage - parseInt(PAGEBLOCK) ;
		if( firstPage > PAGEBLOCK ){
			paggingStr +=  "<a href='javascript:goPage("+prePage+");' class=\"paging_control prev\">이전</a>  " ;
		}
		for( i=firstPage; i<=lastPage; i++ ){
			if( pageNum == i )
				paggingStr += "<li><a style='font-weight:bold;color:blue;font-size:15px;' href='javascript:goPage("+i+");'><strong>" + i + "</strong></a></li> ";
			else
				paggingStr += "<li><a href='javascript:goPage("+i+");'>" + i + "</a></li> ";
		}
		if( lastPage < totalPages ){
			paggingStr +=  "<a href='javascript:goPage("+nextPage+");' class=\"paging_control next\">다음</a>";
		}
		paggingStr += "</ul>"
		$("#paging_div").html(paggingStr);
	}
}

function goPage(pageNum){
	document.listForm.currentPage.value=pageNum;
	fn_search("Y");
}

function fn_select(row){
	<c:if test="${se eq 1}">window.opener.fnSetAdres($("tr:eq("+row+")>td:eq(1)").text(),$("tr:eq("+row+")>td:eq(2)").text());</c:if>
	<c:if test="${se eq 2}">window.opener.fnSetAdres2($("tr:eq("+row+")>td:eq(1)").text(),$("tr:eq("+row+")>td:eq(2)").text());</c:if>
	<c:if test="${se eq 3}">window.opener.fnSetAdres3($("tr:eq("+row+")>td:eq(1)").text(),$("tr:eq("+row+")>td:eq(2)").text());</c:if>
	window.close();
}

</script>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

              <form name="listForm" id="listForm" onsubmit="return false">

				<div id="sub_con_wrap">

	                <div id="pop_wrap">

	                	<div class="pop_tit">도로명 주소검색</div>

	                	<div class="pop_inner">

							<div id="search_field">

			                    <fieldset>
			                    	<legend>조건정보 영역</legend>
			                        <div class="sf_start">

			                            <ul class="search_form search_form2">
			                            	<li class="nline">

								                <label for="">주소검색</label>
												<input name="keyword" id="keyword" type="text" class="input_style1 input_w1" value="" onkeypress="if( event.keyCode == 13 ){fn_search();}" />
			                            	</li>
			                            </ul>

			                            <div class="search_btn_wrap search_btn_wrap2">
		                                    <a href="javascript:fn_search();" class="search_btn">검색<!-- spring:message code="button.inquire" /--></a>
		                                </div>
			                        </div>
			                    </fieldset>
			                </div>

			                <div id="page_info">
			                	<div id="page_info_left">총 <strong>0건</strong>이 검색 되었습니다.</div>
			                </div>

			                <div class="tablestyle_1">
			                    <table summary="요약">
			                    <caption>캡션</caption>
			                    <colgroup>
			                    <col width="10%" >
			                    <col width="10%" >
			                    <col width="40%" >
			                    <col width="40%" >
			                    </colgroup>
			                    <thead>
			                    <tr>
			                        <th scope="row" class="f_field" nowrap="nowrap">No.</th>
			                        <th scope="row" nowrap="nowrap">우편번호</th>
			                        <th scope="row" nowrap="nowrap">도로명주소</th>
									<th scope="row" nowrap="nowrap">지번주소</th>
			                    </tr>
			                    </thead>
			                    <tbody id="tbody" name="tbody">
			                    	<tr>
			                    		<td class="listCenter" colspan="4" >검색 결과가 없습니다.</td>
			                    	</tr>
			                    </tbody>
			                    </table>
			                </div>
			                <div id="paging_div">
			                </div>
							</div>
	                	</div>
	                </div>
				</div>
				<input type="hidden" name="currentPage" value="1"/> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
				<input type="hidden" name="countPerPage" value="10"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
              </form>

