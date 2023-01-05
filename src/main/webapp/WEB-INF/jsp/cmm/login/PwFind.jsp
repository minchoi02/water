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
function fnFind_pw() {
    var id = $("#emplyrId").val();
    var nm = $("#emplyrNm").val();
    var mbtlnum = $("#moblphonNo1").val() + "-" + $("#moblphonNo2").val() + "-" + $("#moblphonNo3").val();


    $.ajax({
        url:'<c:url value='/cmm/login/checkIdNmPhone.do'/>',
        type:'POST',
        dataType:'json',
        contentType:"application/json; charset=UTF-8",
        data:id+","+nm+","+mbtlnum,
        success:function(data){
            if(data.userId ==null){
                $("#message").html('입력하신 아이디, 이름 및 전화번호에 해당하는 아이디는 없습니다');
            }else{
                location.href = "/cmm/login/PwFindView2.do?emplyrId="+id;
            }
        }
    });
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
		<form name="checkForm" action ="<c:url value='/sys/user/urm/IdFindAction.do'/>">
				<fieldset>
					<legend id="login" class="hidden">패스워드 찾기</legend>
					<ul class="row">
						<li class="col-12">
							<label for="id" class="hidden">아이디</label>
							<input type="text" name="emplyrId" id="emplyrId" placeholder="아이디" />
						</li>
						<li class="col-12">
							<label for="id" class="hidden">이름</label>
							<input type="text" name="emplyrNm" id="emplyrNm" placeholder="이름" />
						</li>
						<li class="col-4">
							<label for="mbtlnum" class="hidden">휴대전화</label>
							<input type="hidden" name="mbtlnum" id="mbtlnum" placeholder="휴대전화" />
							<select name="moblphonNo1" id="moblphonNo1" title="휴대폰">
								  <c:forEach var="obj" items="${com015}">
								  	<option <c:if test="${fn:split(userManageVO.moblphonNo,'-')[0] eq obj.code}">selected="selected"</c:if> value="${obj.code}">${obj.code}</option>
								  </c:forEach>
							</select>
						</li>
						<li class="col-4">
							<input name="moblphonNo2" id="moblphonNo2" type="text" value="" title="휴대전화1" />
						</li>
						<li class="col-4">
							<input name="moblphonNo3" id="moblphonNo3" type="text" value=""   title="휴대전화2" />
						</li>
						<li>
							<span class="message" id="message">* 가입시 등록한 정보를 입력하세요.</span>
						</li>
						<li class="col-12">
							<button type="button" class="btn btn-secondary" onclick="javascript:fnFind_pw();">찾기</button>
						</li>
					</ul>
				</fieldset>
			</form>
		</div>
	</div>
</div>
