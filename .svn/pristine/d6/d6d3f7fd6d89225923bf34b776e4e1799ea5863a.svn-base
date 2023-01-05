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
	if(!fnValid2()) return;
	document.checkForm2.submit();
}

function fnClose2(){
    var retVal="";
    window.returnValue = retVal;
    window.close();
}
function fnValid2() {
	var emplyrId = document.getElementById("emplyrId2").value;
	var emplyrNm = document.getElementById("emplyrNm2").value;
	var passwordCnsr = document.getElementById("passwordCnsr").value;

	if(emplyrNm.trim() == '' || emplyrId.trim() == ''|| passwordCnsr.trim() == '') 	return false;

	return true;

}
//-->
</script>
<STYLE type="text/css">
    BODY {overflow:hidden; margin:20px;}
</STYLE>
	<form name="checkForm2" action ="<c:url value='/sys/user/urm/pwFindAction.do'/>">

		<div id="sub_con_wrap">
			<div class="pop_h3_2">아이디</div>
			<input type="text" id="emplyrId2" name="emplyrId" title="아이디" value="<c:out value="${userManageVO.emplyrId}"/>" maxlength="20" autofocus class="input_style1 input_w1" />

			<div class="pop_h3_2">이름</div>
			<input type="text" id="emplyrNm2" name="emplyrNm" title="이름" value="<c:out value="${userManageVO.emplyrNm}"/>" maxlength="20" class="input_style1 input_w1" />

			<div class="pop_h3_2">패스워드 힌트/정답</div>
			<select id="passwordHint" name="passwordHint" title="패스워드 힌트" class="select_style1 input_w1">
				<c:forEach var="item" items="${passwordHint_result}">
					<option value="${item.code}" <c:if test="${item.code eq userManageVO.passwordHint}">selected="selected"</c:if>>${item.codeNm}</option>
				</c:forEach>
			</select>
			<input type="text" id="passwordCnsr" name="passwordCnsr" title="패스워드 정답" value="<c:out value="${userManageVO.passwordCnsr}"/>" maxlength="20" class="input_style1 input_w1" />

			<div class="pop_h3_2">결과</div>
			<span id="resultMsg">
				<c:choose>
					<c:when test="${isAction eq 'PW'}">패스워드는 1로 초기화 합니다.</c:when>
					<c:otherwise>검색된 정보가 없습니다</c:otherwise>
          		</c:choose>
          	</span>

          	<div class="board_btn_wrap">
			    <a href="#LINK" onclick="javascript:fnFind_pw(); return false;" class="board_btn"><spring:message code="button.inquire" /></a>
			    <a href="#LINK" onclick="javascript:fnClose2(); return false;" class="board_btn"><spring:message code="button.close" /></a>
			</div>
		</div>


<!--
	<table border="0">
        <tr>
            <td colspan="2" >
            <h1><img alt="패스워드 찾기" src="<c:url value='/images/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle">
            &nbsp;패스워드 찾기</h1></td>
        </tr>
        <tr><td height="20" colspan="2"></td></tr>
         <tr>
            <td>아이디</td>
            <td>
	            <input type="text" id="emplyrId2" name="emplyrId" title="아이디" value="<c:out value="${userManageVO.emplyrId}"/>" maxlength="20" autofocus />
	        </td>
	    </tr>
        <tr>
            <td>이름</td>
            <td>
	            <input type="text" id="emplyrNm2" name="emplyrNm" title="이름" value="<c:out value="${userManageVO.emplyrNm}"/>" maxlength="20" autofocus />
	        </td>
	    </tr>
	    <tr><td height="20" colspan="2"></td></tr>
        <tr>
            <td>패스워드 힌트</td>
            <td>
            <select id="passwordHint" name="passwordHint" title="패스워드 힌트" >
           <c:forEach var="item" items="${passwordHint_result}">
	            <option value="${item.code}" <c:if test="${item.code eq userManageVO.passwordHint}">selected="selected"</c:if>>${item.codeNm}</option>
	       </c:forEach>
	       </select>
	    </tr>
	    <tr><td colspan="2"></td></tr>
        <tr>
            <td>패스워드 정답</td>
            <td>
            	 <input type="text" id="passwordCnsr" name="passwordCnsr" title="패스워드 정답" value="<c:out value="${userManageVO.passwordCnsr}"/>" maxlength="20" autofocus />
	        </td>
	    </tr>
	    <tr><td height="20" colspan="2"></td></tr>
        <tr>
            <td>결과</td>
            <td>
            	<span id="resultMsg">
           		<c:choose>
	           			<c:when test="${isAction eq 'PW'}">패스워드는 1로 초기화 합니다.</c:when>
	           			<c:otherwise>검색된 정보가 없습니다</c:otherwise>
	           		</c:choose>
           		</span>
	        </td>
	    </tr>
	    <tr><td height="20" colspan="2"></td></tr>
	    <tr>
	    	<td colspan="2">
			    <div class="buttons" style="padding-top:10px;padding-bottom:10px;margin-left:90px;">
				    <a href="#LINK" onclick="javascript:fnFind_pw();return false;">찾기</a>
				    <a href="#LINK" onclick="javascript:fnClose2(); return false;"><spring:message code="button.close" /></a>
			    </div>
	    	</td>
	    </tr>
    </table>
-->
	</form>
