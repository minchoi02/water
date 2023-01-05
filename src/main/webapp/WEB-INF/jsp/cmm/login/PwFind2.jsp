<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>


<script type="text/javaScript">
<!--
function fnChange_pw() {

    var emplyrId  = $("#emplyrId").val();
    var password  = $("#password").val();
    var password2 = $("#password2").val();

    if(/^(?=.*[a-z]).((?=.*\d)|(?=.*\W)).{8,20}$/.test(password)){
    }else{
       alert('특수문자, 영문, 숫자를 조합하여 8자리 이상으로 설정해주세요.');
       return false;
    }

    if(password==password2){
    }else{
       alert('패스워드가 서로 다릅니다.');
       return false;
    }

    $.ajax({
        url:'<c:url value='/cmm/login/updatePw.do'/>',
        type:'POST',
        dataType:'json',
        contentType:"application/json; charset=UTF-8",
        data:emplyrId+","+password,
        success:function(data){
            if(data.updatePwSuccess =='updatePwSuccess'){
                location.href = "/cmm/login/LoginUsr.do?error=updatePw";
            }else{
                $("#message").html('오류가 발생했습니다.');
            }
        }
    });
}
function fn_checkPass(){
    var password  = $("#password").val();
    var password2 = $("#password2").val();

    if(/^(?=.*[a-z]).((?=.*\d)|(?=.*\W)).{8,20}$/.test(password)){
        $("#message").html('');
    }else{
        $("#message").html('특수문자, 영문, 숫자를 조합하여 8자리 이상으로 설정해주세요.');
    }

    if(password==password2){
        $("#message2").html('');
    }else{
        $("#message2").html('패스워드가 서로 다릅니다.');
    }
}

//-->
</script>

<div class="login-area">
	<h1><em class="hidden">상수도 원격검침 시스템</em></h1>
	<div class="login-box">
		<div class="login-header">
			<h3>패스워드 찾기</h3>
		</div>
		<div class="login-body">
		<form name="checkForm" action ="<c:url value='/sys/user/urm/IdChangeAction.do'/>">
		<input type="text" name="emplyrId" id="emplyrId" placeholder="아이디" value="${emplyrId}" readonly="readonly"/>
				<fieldset>
					<legend id="login" class="hidden">패스워드 찾기</legend>
					<ul class="row">
						<li class="col-12">
							<label for="password" class="hidden">변경 패스워드</label>
							<input type="password" name="password" id="password" placeholder="변경 패스워드" onkeyup="javascript:fn_checkPass();"/>
						</li>
						<li>
							<span class="message" id="message">* 영문 대소문자, 숫자를 조합하여 8~16자 사이로 입력하세요.</span>
						</li>
						<li class="col-12">
							<label for="password2" class="hidden">변경 패스워드 확인</label>
							<input type="password" name="password2" id="password2" placeholder="변경 패스워드 확인" onkeyup="javascript:fn_checkPass();"/>
						</li>
						<li class="col-12">
							<span class="message" id="message2">* 패스워드 확인을 입력하세요.</span>
						</li>
						<li class="col-12">
							<button type="button" class="btn btn-secondary" onclick="javascript:fnChange_pw();">변경하기</button>
						</li>
					</ul>
				</fieldset>
			</form>
		</div>
	</div>
</div>
