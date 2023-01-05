<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<base target="_self">
<script type="text/javaScript">

</script>

<div class="login-area">
	<h1><em class="hidden">상수도 원격검침 시스템</em></h1>
	<div class="login-box">
		<div class="login-header">
			<h3>아이디/패스워드 찾기</h3>
		</div>
		<div class="login-footer">
			<ul class="row join idpw">
				<li class="col-6"><a href="/cmm/login/IdFindView.do">아이디 찾기</a></li>
				<li class="col-6"><a href="/cmm/login/PwFindView.do">패스워드 찾기</a></li>
			</ul>
		</div>
	</div>
</div>
