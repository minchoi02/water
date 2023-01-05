<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<base target="_self">
<script type="text/javaScript">
<!--
$(function() {
	var activeTab = "0";
	var pwFind = '${fn:replace(fn:replace(pwFind, '<', '&lt;'), '>', '&gt;')}';

	if(pwFind == 'Y') activeTab = "1";

	$("#tabs").tabs({
		active : activeTab

	});
});
//-->
</script>


	<div id="pop_wrap">
		<div class="pop_tit3">ID/PW 찾기</div>
		<div class="pop_inner">
			<div id="tabs">
				<ul class="tabs">
					<li><a href="/sys/user/urm/IdPwFind.do?flag=ID&isAction=${isAction}&emplyrId=${result.emplyrId}&emplyrNm=${userManageVO.emplyrNm}&moblphonNo=${userManageVO.moblphonNo}&insttCode=${userManageVO.insttCode}">아이디 찾기</a></li>
					<li><a href="/sys/user/urm/IdPwFind.do?flag=PW&isAction=${isAction}&emplyrId=${userManageVO.emplyrId}&emplyrNm=${userManageVO.emplyrNm}&passwordCnsr=${userManageVO.passwordCnsr}">패스워드 찾기</a></li>
<!-- 							<li class="active"><a href="#tab1">기본정보</a></li> -->
<!-- 							<li><a href="#tab2">설명자료</a></li> -->
<!-- 							<li><a href="#tab3">이미지/도면</a></li> -->
				</ul>
				<div id="tab"></div>
			</div>
		</div>
	</div>

<!-- 	<div id="tabs"> -->
<!-- 		<ul> -->
<%-- 			<li><a href="/sys/user/urm/IdPwFind.do?flag=ID&isAction=${isAction}&emplyrId=${result.emplyrId}&emplyrNm=${userManageVO.emplyrNm}&moblphonNo=${userManageVO.moblphonNo}&insttCode=${userManageVO.insttCode}">아이디 찾기</a></li> --%>
<%-- 			<li><a href="/sys/user/urm/IdPwFind.do?flag=PW&isAction=${isAction}&emplyrId=${userManageVO.emplyrId}&emplyrNm=${userManageVO.emplyrNm}&passwordCnsr=${userManageVO.passwordCnsr}">패스워드 찾기</a></li> --%>
<!-- 		</ul> -->
<!-- 		<div id="tab"></div> -->
<!-- 	</div> -->
