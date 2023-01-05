<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/prototype-1.6.0.3.js"></script>
<script type="text/javaScript">
function fnCheckAll() {
    var checkField = document.listForm.checkList;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************* */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/sys/pwm/listPopup.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_regist_PopupManage(){
	var vFrom = document.listForm;
	vFrom.action = "<c:url value='/sys/pwm/registPopup.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 상세화면 처리 함수
 ******************************************************** */
function fn_detail_PopupManage(popupId){
	var vFrom = document.listForm;
	vFrom.popupId.value = popupId;
	vFrom.action = "<c:url value='/sys/pwm/updtPopup.do' />";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_search_PopupManage(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/sys/pwm/listPopup.do' />";
	vFrom.submit();

}
/* ********************************************************
* 체크 박스 선택 함수
******************************************************** */
function fn_checkAll_PopupManage(){

	var FLength = document.getElementsByName("checkList").length;
	var checkAllValue = document.getElementById('checkAll').checked;

	//undefined
	if( FLength == 1){
		document.getElementById("checkList").checked = checkAllValue;
	}{
			for(var i=0; i < FLength; i++)
			{
				document.getElementsByName("checkList")[i].checked = checkAllValue;
			}
		}

}
/* ********************************************************
* 팝업창 미리보기
******************************************************** */
function fn_view_PopupManage(){


	var FLength = document.getElementsByName("checkList").length;
	var check = 0;

	if( FLength == 1){
		if(document.getElementById("checkList").checked == true){
			fn_ajaxPopupInfo_PopupManage( document.getElementById("checkList").value );
			check ++;
		}
	}else{
		for(var i=0; i < FLength; i++)
		{
			if(document.getElementsByName("checkList")[i].checked == true){
				check ++;
				fn_ajaxPopupInfo_PopupManage( document.getElementsByName("checkList")[i].value );
				}
		}
		}

	if(check == 0){
		alert("체크박스를 하나 이상 선택해 주세요");/* 체크박스를 하나 이상 선택해 주세요. */
			}

	return;

}
/* ********************************************************
* 팝업창 정보 Ajax통신으로 정보 획득
******************************************************** */
function fn_ajaxPopupInfo_PopupManage(popupIds){
	var url = "<c:url value='/sys/pwm/ajaxPopupManageInfo.do' />";

	var param = {
			popupId: popupIds
	};
	new Ajax.Request(url,
   {
     asynchronous:true,
     method:"post",
     parameters: param ,
     evalJSON:     false,
     evalJS:       false,
    onLoading  : function() {/*로딩중*/ },
    onSuccess  : function(returnValue)
    {
    	var returnValueArr = returnValue.responseText.split("||");

    	//if(fnGetCookie(popupIds) == null ){
    	   	fn_popupOpen_PopupManage(popupIds,
        	    	returnValueArr[0],
        	    	returnValueArr[1],
        	    	returnValueArr[2],
        	    	returnValueArr[3],
        	    	returnValueArr[4],
        	    	returnValueArr[5]);
    	//}

    },
    onFailure: function() {/*불러오기 실패*/},
    onComplete : function() {/*모든 것을 완료*/}
   });
}

/* ********************************************************
* 팝업창  오픈
******************************************************** */
function fn_popupOpen_PopupManage(popupId,fileUrl,width,height,top,left,stopVewAt){

	var url = "<c:url value='/sys/pwm/openPopupManage.do' />?";
	url = url + "fileUrl=" + fileUrl;
	url = url + "&stopVewAt=" + stopVewAt;
	url = url + "&popupId=" + popupId;
	var name = popupId;
	var openWindows = window.open(url,name,"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");

	if (window.focus) {openWindows.focus()}
}

/* ********************************************************
* 팝업창  오픈 쿠키 정보 OPEN
******************************************************** */
function fnGetCookie(name) {
	  var prefix = name + "=";

	  var cookieStartIndex = document.cookie.indexOf(prefix);
	  if (cookieStartIndex == -1) return null;
		  var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
	  if (cookieEndIndex == -1) cookieEndIndex = document.cookie.length;


	  return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex));
}

</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>팝업 관리 목록</h3>
    </div>
    <form name="listForm" action="<c:url value='/sys/pwm/listPopup.do'/>" method="post">
        <input name="popupId" type="hidden" value="">
        <input name="pageIndex" type="hidden" value="<c:out value='${popupManageVO.pageIndex}'/>"/>
	    <div class="panel-body">
	        <div class="search-area">
	                <label for="Search" class="hidden">검색</label>
	                <select id="searchCondition" name="searchCondition" >
	                    <option value="1">팝업명</option>
	                    <option value="2">URL</option>
	                </select>
	                <input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요." value="<c:out value='${searchKeyword}'/>" />
	                <button type="button" onclick="javascript:fn_search_PopupManage()" class="btn btn-primary">검색</button>
	        </div>
	        <div class="table-header">
	            <div>총 <strong class="secondary">${paginationInfo.totalRecordCount}</strong>건이 검색 되었습니다.</div>
	        </div>
	        <div class="table-box y-scroll content-height-4">
	            <table>
	                <caption>팝업 관리 목록</caption>
	                <colgroup>
	                    <col style="width:5%;">
	                    <col style="width:20%;">
	                    <col style="width:auto;">
	                    <col style="width:15%;">
	                    <col style="width:10%;">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col"><input type="checkbox" /></th>
	                        <th scope="col">팝업 이미지</th>
	                        <th scope="col">팝업 정보</th>
	                        <th scope="col">게사 기간</th>
	                        <th scope="col">상태</th>
	                    </tr>
	                </thead>
	                <tbody>
	                   <c:forEach var="resultInfo" items="${resultList}" varStatus="status">
	                    <tr>
	                        <td><input type="checkbox" name="checkList" id="checkList" value="${resultInfo.popupId}"</td>
	                        <td><img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fn:replace(fn:replace(resultInfo.atchFileId, '<', '&lt;'), '>', '&gt;')}"/>&fileSn=${resultInfo.fileSn}' alt="배너이미지" /></td>
	                        <td>
	                            <dl class="list-area-dl">
	                                <dt class="badge bg-lightgray">팝업명</dt>
	                                <dd><a href="#LINK" onclick="fn_detail_PopupManage('${resultInfo.popupId}'); return false;"><c:out value="${resultInfo.popupTitleNm}"/></a></dd>
	                                <dt class="badge bg-lightgray">URL</dt>
	                                <dd><c:out value="${resultInfo.fileUrl}"/></dd>
	                                <dt class="badge bg-lightgray">연결</dt>
	                                <dd>새창</dd>
	                            </dl>
	                        </td>
	                        <td><c:out value="${fn:substring(resultInfo.ntceBgnde, 0, 4)}"/>-<c:out value="${fn:substring(resultInfo.ntceBgnde, 4, 6)}"/>-<c:out value="${fn:substring(resultInfo.ntceBgnde, 6, 8)}"/> <c:out value="${fn:substring(resultInfo.ntceBgnde, 8, 10)}"/>H <c:out value="${fn:substring(resultInfo.ntceBgnde, 10, 12)}"/>M
	                    	~
							<c:out value="${fn:substring(resultInfo.ntceEndde, 0, 4)}"/>-<c:out value="${fn:substring(resultInfo.ntceEndde, 4, 6)}"/>-<c:out value="${fn:substring(resultInfo.ntceEndde, 6, 8)}"/> <c:out value="${fn:substring(resultInfo.ntceEndde, 8, 10)}"/>H <c:out value="${fn:substring(resultInfo.ntceEndde, 10, 12)}"/>M</td>
	                        <td><c:out value="${resultInfo.ntceAt}"/></td>
	                    </tr>
	                    </c:forEach>

	                </tbody>
	            </table>
	        </div>
	    </div>
    </form>
    <div class="panel-footer">
        <div class="page">
            <ul>
                <li><a href="#"><i class="fas fa-angle-left"></i></a></li>
                <li>
                    <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_select_noticeList" />
                </li>
                <li><a href="#"><i class="fas fa-angle-right"></i></a></li>
            </ul>
        </div>
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fn_view_PopupManage(); return false;">미리보기</button>
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fn_regist_PopupManage(); return false;">등록</button>
        </div>
    </div>
</section>
<!-- panel -->