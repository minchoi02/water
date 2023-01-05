<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/cmm/main/inc/incTop.jsp" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/zip.css'/>" >
<script type="text/javaScript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_pageview(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/sys/code/zip/CcmZipSearchList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리
 ******************************************************** */
function fn_search_Zip(){
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}
/* ********************************************************
 * 결과 우편번호,주소 반환
 ******************************************************** */
function fn_return_Zip(zipSn,zipCd,obj){

	var addrTxt = obj.cells.item(1).innerText;

	var retVal   = new Object();
	retVal.zipSn = zipSn;
	retVal.zipCd = zipCd;
	retVal.addr  = addrTxt.substring(0, addrTxt.indexOf('[')-1);

    setReturnValue(retVal);

	parent.window.returnValue = retVal;
	parent.window.close();
}
//-->
</script>
</head>

<body>
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="listForm" action="<c:url value='/sys/code/zip/CcmZipSearchList.do'/>" method="post">
	<input name="searchCondition" type="hidden" size="35" value="1" />

	<h1><img src="<c:url value='/images/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="제목"/>우편번호 찾기</h1>
<!-- 	<center> -->
		<br/>
		<input name="searchKeyword" type="text" size="60" value="${searchVO.searchKeyword}"  maxlength="20" title="검색입력" autofocus/>
		<img src="<c:url value='/images/img_search.gif'/>" alt="조회" width="16" height="16" onclick="javascript:fn_search_Zip();" style="cursor: pointer;"/>
		<br/><h6 style="color:#1a90d8;">검색어 예 : 도로명(반포대로), 건물명(독립기념관), 지번(삼성동)</h6><br/>
<!-- 	</center> -->

    <table style="width:550px" class="table-line" border="0" summary="우편번호 건색 결과를 알려주는 테이블입니다.우편번호 및 주소 내용을 담고 있습니다">
        <thead>
            <tr>
            	<th class="title" style="width:10%" scope="col" nowrap="nowrap">No</th>
            	<th class="title" style="width:70%" scope="col" nowrap="nowrap">주소</th>
            	<th class="title" style="width:20%" scope="col" nowrap="nowrap">우편번호</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
                <tr style="cursor:pointer;cursor:hand;" onclick="javascript:fn_return_Zip( '${resultInfo.zipSn}', '${resultInfo.zipCd}', this )">
                	<td nowrap="nowrap" style="text-align:center;"><strong><c:out value="${status.count}"/></strong></td>
                	<td nowrap="nowrap" style="padding: 3px;">
                		<div name="addr" style="font-weight:bold; font-size:13px;">
	                		${resultInfo.ctprvnNm} ${resultInfo.signguNm}
	                		<c:if test="${resultInfo.emNm !=''}">${resultInfo.emNm} </c:if>
	                		${resultInfo.rnNm}
	                		${resultInfo.bdnbrMnnm}<c:if test="${resultInfo.bdnbrSlno !='0'}">-${resultInfo.bdnbrSlno}</c:if>
	                		<c:if test="${resultInfo.legaldongNm !=''}">(${resultInfo.legaldongNm})</c:if>
                		</div>
                		<div>
	                		[지번] ${resultInfo.ctprvnNm} ${resultInfo.signguNm}
	                		<c:if test="${resultInfo.legaldongNm !=''}">${resultInfo.legaldongNm} </c:if>
	                		<c:if test="${resultInfo.emNm !=''}">${resultInfo.emNm} </c:if>
	                		<c:if test="${resultInfo.liNm !=''}">${resultInfo.liNm} </c:if>
	                		${resultInfo.lnmMnnm}<c:if test="${resultInfo.lnmSlno !='0'}">-${resultInfo.lnmSlno}</c:if>
	                		<c:if test="${resultInfo.detailBuldNm !=''}"> ${resultInfo.detailBuldNm}</c:if>
                		</div>
                	</td>
                	<td nowrap="nowrap" style="text-align:center;"><c:out value='${resultInfo.zipCd}'/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <table style="width:550px" border="0">
        <tr>
        	<td height="3px"></td>
        </tr>
    </table>

    <div align="center">
        	<ul class="paging_align">
        		<ui:pagination paginationInfo = "${paginationInfo}"
        				type="image"
        				jsFunction="fn_pageview"
        				/>
        	</ul>
    </div>

    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>
</body>
</html>


