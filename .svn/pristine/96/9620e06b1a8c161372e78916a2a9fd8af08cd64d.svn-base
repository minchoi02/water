<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<%pageContext.setAttribute("crlf", "\r\n"); %>
<title><spring:message code="ussIonPwm.bannerDetail.bannerDetail"/></title><!-- 팝업창관리 상세보기 -->
<link href="<c:url value="/css/egovframework/com/com.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/egovframework/com/button.css"/>" rel="stylesheet" type="text/css">
<script type="text/javaScript">
/* ********************************************************
 * 초기화
 ******************************************************** */
	$(document).ready(function(){
	    fn_egov_init_BannerManage();
	});

function fn_egov_init_BannerManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_BannerManage(){
	location.href = "<c:url value='/uss/ion/bwm/listBanner.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_BannerManage(){
	var vFrom = document.formUpdt;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/ion/bwm/updtBanner.do' />";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_BannerManage(){
	var vFrom = document.formDelete;
	if(confirm('<spring:message code="common.delete.msg"/>')){/* 삭제 하시겠습니까? */
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/ion/bwm/detailBanner.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2><spring:message code="ussIonBwm.bannerDetail.bannerDetail"/></h2><!-- 팝업창관리 상세보기 -->

	<form name="BannerManageForm" action="<c:url value='/uss/ion/bwm/detailBanner.do'/>" method="post">

	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:24%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="ussIonbwm.bannerDetail.bannerTitleNm"/> <span class="pilsu">*</span></th><!-- 배너창명 -->
			<td class="left">
			    <c:out value="${bannerManageVO.bannerTitleNm}" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonBwm.bannerDetail.fileUrl"/> <span class="pilsu">*</span></th><!-- 배너창URL -->
			<td class="left">
			    <c:out value="${bannerManageVO.fileUrl}" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonBwm.bannerDetail.bannerLoca"/> <span class="pilsu">*</span></th><!-- 배너창위치 -->
			<td class="left">
			    <spring:message code="ussIonBwm.bannerDetail.bannerWlce"/><c:out value="${bannerManageVO.bannerWlc}" />  <spring:message code="ussIonPwm.bannerDetail.bannerHlc"/><c:out value="${bannerManageVO.bannerHlc}" escapeXml="false" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonPwm.bannerDetail.bannerSize"/> <span class="pilsu">*</span></th><!-- 팝업창사이즈 -->
			<td class="left">
			    <spring:message code="ussIonPwm.bannerDetail.bannerWSize"/> : <c:out value="${bannerManageVO.bannerWSize}" />  <spring:message code="ussIonPwm.bannerDetail.bannerHSize"/> : <c:out value="${bannerManageVO.bannerHSize}" escapeXml="false" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonPwm.bannerDetail.ntcePeriod"/> <span class="pilsu">*</span></th><!-- 게시 기간 -->
			<td class="left">
			    <c:out value="${fn:substring(bannerManageVO.ntceBgnde, 0, 4)}"/>-<c:out value="${fn:substring(bannerManageVO.ntceBgnde, 4, 6)}"/>-<c:out value="${fn:substring(bannerManageVO.ntceBgnde, 6, 8)}"/> <c:out value="${fn:substring(bannerManageVO.ntceBgnde, 8, 10)}"/>H <c:out value="${fn:substring(bannerManageVO.ntceBgnde, 10, 12)}"/>M
			 	~
			 	<c:out value="${fn:substring(bannerManageVO.ntceEndde, 0, 4)}"/>-<c:out value="${fn:substring(bannerManageVO.ntceEndde, 4, 6)}"/>-<c:out value="${fn:substring(bannerManageVO.ntceEndde, 6, 8)}"/> <c:out value="${fn:substring(bannerManageVO.ntceEndde, 8, 10)}"/>H <c:out value="${fn:substring(bannerManageVO.ntceEndde, 10, 12)}"/>M
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonPwm.bannerDetail.stopVewAt"/> <span class="pilsu">*</span></th><!-- 그만보기 설정 여부 -->
			<td class="left">
			    <c:out value="${bannerManageVO.stopVewAt}"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="ussIonPwm.bannerDetail.ntceAt"/> <span class="pilsu">*</span></th><!-- 게시 상태 -->
			<td class="left">
			    <c:out value="${bannerManageVO.ntceAt}"/>
			</td>
		</tr>
	</table>
	<input name="cmd" type="hidden" value="<c:out value=''/>">
	<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/><c:if test="${searchVO.pageIndex eq null}">1</c:if>"/>
	</form>

	<!-- 하단 버튼 -->
	<div class="btn">
		<form name="formUpdt" action="<c:url value='/uss/ion/pwm/updtBanner.do'/>" method="post" style="display:inline">
			<input class="s_submit" type="submit" value='<spring:message code="button.update" />' onclick="fn_egov_modify_BannerManage(); return false;" />
			<input name="bannerId" type="hidden" value="${bannerManageVO.bannerId}">
			</form>

		<form name="formDelete" action="<c:url value='/uss/ion/pwm/detailBanner.do'/>" method="post" style="display:inline">
			<input class="s_submit" type="submit" value='<spring:message code="button.delete" />' onclick="fn_egov_delete_BannerManage(); return false;" />
			<input name="bannerId" type="hidden" value="${bannerManageVO.bannerId}">
			<input name="cmd" type="hidden" value="<c:out value='del'/>"/>
		</form>

		<form name="formList" action="<c:url value='/uss/ion/pwm/listBanner.do'/>" method="post" style="display:inline">
			<input class="s_submit" type="submit" value='<spring:message code="button.list" />' onclick="fn_egov_list_BannerManage(); return false;" />
		</form>
	</div>
	<div style="clear:both;"></div>
</div>

