<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<script type="text/javaScript">
/* ********************************************************
 * 쿠키설정
 ******************************************************** */
function fnSetCookiePopup( name, value, expiredays ) {
	  var todayDate = new Date();
	  todayDate.setDate( todayDate.getDate() + expiredays );
	  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
/* ********************************************************
* 체크버튼 클릭시
******************************************************** */
function fnPopupCheck() {
	console.log("${popupId}");
	fnSetCookiePopup( "${popupId}", "done" , 1);
	window.close();
}
</script>

<div class="notice_pop_tit">팝업테스트</div>
<div class="notice_pop_txt" style="height: 319px;">팝업 내용 작성 부분<br>새로운 팝업 생성시 JSP 작성이 필요합니다</div>
<div class="notice_pop_btm">
	<c:if test="${stopVewAt eq 'Y'}">
		<input name="chkPopup" type="checkbox" title="하루동안 이 창을 열지 않음" onclick="fnPopupCheck()"> 하루동안 이 창을 열지 않음
	</c:if>
</div>

