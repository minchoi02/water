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
function fnCheckId(){
	if(document.checkForm.checkId.value==""){
		document.getElementById("txt_info").innerHTML = '중복조회할 아이디를 입력하십시오.';
		document.checkForm.focus();
        return;
	}
	var id = document.checkForm.checkId.value;
	if(/^[a-z0-9]{5,20}$/.test(id)){
		if(fnCheckNotKorean(document.checkForm.checkId.value)){
			document.checkForm.submit();
	    }else{
	    	document.getElementById("txt_info").innerHTML = '한글은 사용할 수 없습니다.';
	        return;
	    }
	}else{
	    document.getElementById("txt_info").innerHTML = '아이디는 5~20자의 영문소문자, 숫자만 사용 가능합니다.';
	    return;
	}
}
function fnReturnId(){
	var retVal="";
    if (document.checkForm.usedCnt.value == 0){
	    retVal = document.checkForm.resultId.value;
	    setReturnValue(retVal);
	    window.returnValue = retVal;
        window.close();
    }else if (document.checkForm.usedCnt.value == 1){
    	document.getElementById("txt_info").innerHTML = '이미사용중인 아이디입니다.';
        return;
    }else{
    	document.getElementById("txt_info").innerHTML = '먼저 중복확인을 실행하십시오.';
        return;
    }
}
function fnClose(){
    var retVal="";
    window.returnValue = retVal;
    window.close();
}
function fnCheckNotKorean(koreanStr){
    for(var i=0;i<koreanStr.length;i++){
        var koreanChar = koreanStr.charCodeAt(i);
        if( !( 0xAC00 <= koreanChar && koreanChar <= 0xD7A3 ) && !( 0x3131 <= koreanChar && koreanChar <= 0x318E ) ) {
        }else{
            //hangul finding....
            return false;
        }
    }
    return true;
}
//-->
</script>
<style type="text/css">
.pop_h3 {margin: 0 0 20px !important;}
</style>


    <form name="checkForm" action ="<c:url value='/sys/user/urm/IdDplctCnfirm.do'/>">
		<div id="pop_wrap" style="width:400px;">
			<div class="pop_tit3">아이디 중복확인</div>
			<div class="pop_inner">
			    <div class="pop_h3">아이디 조회</div>
				<div id="sub_con_wrap">
					<input type="hidden" name="resultId" value="<c:out value="${checkId}"/>" />
				    <input type="hidden" name="usedCnt" value="<c:out value="${usedCnt}"/>" />
				    <input type="text" name="checkId" title="선택여부" value="<c:out value="${checkId}"/>" maxlength="20" autofocus class="input_style1 input_w1" />
					<br/>
				    <c:choose>
					    <c:when test="${usedCnt eq -1}">
					        <p class="info_txt2"><span id="txt_info">중복확인을 실행하십시오</span></p>
					    </c:when>
					    <c:when test="${usedCnt eq 0}">
					        <p class="info_txt2"><span id="txt_info">${checkId} 는 사용가능한 아이디입니다.</span></p>
					    </c:when>
					    <c:otherwise>
					        <p class="info_txt2"><span id="txt_info">${checkId} 는 사용할수 없는 아이디입니다.</span></p>
					    </c:otherwise>
				    </c:choose>

				    <!-- 버튼 시작(상세지정 style로 div에 지정) -->
				    <div class="board_btn_wrap">
					    <a href="#LINK" onclick="javascript:fnCheckId(); return false;" class="board_btn"><spring:message code="button.inquire" /></a>
					    <a href="#LINK" onclick="javascript:fnReturnId(); return false;" class="board_btn"><spring:message code="button.use" /></a>
					    <a href="#LINK" onclick="javascript:fnClose(); return false;" class="board_btn"><spring:message code="button.close" /></a>
					</div>
				</div>
		    </div>
	    </div>
    </form>
