<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript">

	$(document).ready(function(){
	    fnInit();

	    if('${loginVO.error}'=='role'){
	        alert('권한이 없습니다.');
	    }
	    if('${loginVO.error}'=='failIdPass'){
	    	alert('아이디나 패스워드가 잘못되었습니다.');
	    }
	    if('${loginVO.error}'=='admin'){
	        alert('관리자용 화면을 이용해주세요.');
	    }
	    if('${loginVO.error}'=='insertUser'){
	        alert('회원가입 되었습니다.');
	    }
	    if('${loginVO.error}'=='updatePw'){
	        alert('패스워드가 수정되었습니다..');
	    }

	});

	function actionLogin() {
		if (document.loginForm.user_id.value =="") {
	        alert("아이디를 입력하세요");
	        $("#user_id").focus();
	        return false;
	    } else if (document.loginForm.user_pw.value =="") {
	        alert("패스워드를 입력하세요");
	        $("#user_pw").focus();
	        return false;
	    } else {
	    	$("#loginForm").attr('action', '/cmm/login/loginproc').submit();
	    }
	}

	function fnInit() {
	    //var message = document.loginForm.message.value;
// 	    var message = $(":hidden[name='message']").val();
// 	    if (message != "") {
// 	        alert(message);
// 	    }

	    getid(document.loginForm);
	    //getid();
	}

	function getid(form) {
	    form.check.checked = ((form.id.value = getCookie("saveid")) != "");
	}

	function saveid(form) {
	    var expdate = new Date();
	    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
	    if (form.check.checked)
	        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
	    else
	        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
	    setCookie("saveid", $("#id").val(), expdate);
	}

	function setCookie (name, value, expires) {
	    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
	}

	function getCookie(Name) {
	    var search = Name + "="
	    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
	        offset = document.cookie.indexOf(search)
	        if (offset != -1) { // 쿠키가 존재하면
	            offset += search.length
	            // set index of beginning of value
	            end = document.cookie.indexOf(";", offset)
	            // 쿠키 값의 마지막 위치 인덱스 번호 설정
	            if (end == -1)
	                end = document.cookie.length
	            return unescape(document.cookie.substring(offset, end))
	        }
	    }
	    return "";
	}

	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
	<c:if test="${!empty message}">alert("${message}");</c:if>

<!-- //-->
</script>

<div class="login-area">
    <h1><em class="hidden">상수도 원격검침 시스템</em></h1>
    <div class="login-box login">
        <div class="login-header hidden">
            <h3>로그인</h3>
        </div>
        <div class="login-body">
            <form id="loginForm" name="loginForm"  method="POST">
                <fieldset>
                    <legend id="login" class="hidden">로그인</legend>
                    <label for="id" class="hidden">이메일 아이디</label>
                    <input type="text" id="user_id" name="user_id" class="mb-gutter" placeholder="이메일 아이디" />
                    <label for="pw1" class="hidden">패스워드</label>
                    <input type="password" id="user_pw" name="user_pw" placeholder="패스워드" onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }"/>
<!--                            <span class="message red">아이디 혹은 패스워드가 일치하지 않습니다.</span>                            -->
                    <button type="button" class="btn btn-secondary mb-gutter" onclick="javascript:actionLogin();">로그인</button>
                    <label for="check" class="hidden">아이디 저장</label>
                    <input type="checkbox" id="check" name="checkId" onclick="javascript:saveid(this.form);" />아이디 저장
                </fieldset>
            </form>
            <ul class="signup">
                <li><a href="<c:url value='/cmm/login/UserInsertStep1.do'/>">회원가입</a></li>
                <li><a href="<c:url value='/cmm/login/IdPwFindView.do'/>">아이디/패스워드찾기</a></li>
            </ul>
        </div>
<!--         <div class="login-footer"> -->
<!--             <ul class="row social"> -->
<!--                 <li class="col-12 onepass"><a href="#">디지털원패스로 로그인</a></li> -->
<!--                 <li class="col-6 naver"><a href="#">네이버로 시작하기</a></li> -->
<!--                 <li class="col-6 kakao"><a href="#">카카오로 시작하기</a></li> -->
<!--             </ul> -->
<!--         </div> -->
    </div>
</div>

<form id="popupForm" name="popupForm"></form>
