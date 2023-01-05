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
function fnFind() {
	if(!fnValid()) return;
	document.checkForm.submit();
}
function fnClose(){
    var retVal="";
    window.returnValue = retVal;
    window.close();
}
function fnValid() {
	var emplyrNm = document.getElementById("emplyrNm").value;
	var moblphonNo = document.getElementById("moblphonNo").value;

	if(emplyrNm.trim() == '' || moblphonNo.trim() == '') return false;
	return true;
}
//-->
</script>

	<form name="checkForm" action ="<c:url value='/sys/user/urm/IdFindAction.do'/>">

		<div id="sub_con_wrap">
			<div class="pop_h3_2">이름</div>
			<input type="text" id="emplyrNm" name="emplyrNm" title="이름" value="<c:out value="${userManageVO.emplyrNm}"/>" maxlength="20" autofocus class="input_style1 input_w1" />

			<div class="pop_h3_2">핸드폰번호</div>
			<input type="text" id="moblphonNo" name="moblphonNo" title="핸드폰번호" maxlength="15" size="20" value="<c:out value="${userManageVO.moblphonNo}"/>"  class="input_style1 input_w1" />

			<div class="pop_h3_2">소속기관</div>
			<select id="insttCode" name="insttCode" title="소속기관" class="select_style1 input_w1">
            	<c:forEach var="item" items="${insttCode_result}">
            		<option value="${item.code}" <c:if test="${item.code eq userManageVO.insttCode}">selected</c:if>>${item.codeNm}</option>
            	</c:forEach>
            </select>

            <div class="pop_h3_2">조회결과</div>
            <span id="resultMsg">
           		<c:choose>
           			<c:when test="${emplyrId ne '' && isAction eq 'ID'}">${emplyrId}</c:when>
           			<c:when test="${isAction ne 'ID' }">정보 입력후 찾기 버튼을 클릭하세요</c:when>
           			<c:otherwise>검색된 아이디가 없습니다</c:otherwise>
           		</c:choose>
           	</span>

           	<div class="board_btn_wrap">
			    <a href="#LINK" onclick="javascript:fnFind(); return false;" class="board_btn"><spring:message code="button.inquire" /></a>
			    <a href="#LINK" onclick="javascript:fnClose(); return false;" class="board_btn"><spring:message code="button.close" /></a>
			</div>
		</div>
<!--
	<table border="0">
        <tr>
            <td>이름</td>
            <td>
	            <input type="text" id="emplyrNm" name="emplyrNm" title="이름" value="<c:out value="${userManageVO.emplyrNm}"/>" maxlength="20" autofocus />
	        </td>
	    </tr>
	    <tr><td height="20" colspan="2"></td></tr>
        <tr>
            <td>핸드폰번호</td>
            <td>
	            <input type="text" id="moblphonNo" name="moblphonNo" title="핸드폰번호" maxlength="15" size="20" class="txaIpt" value="<c:out value="${userManageVO.moblphonNo}"/>"  />
	        </td>
	    </tr>
	    <tr><td height="20" colspan="2"></td></tr>
        <tr>
            <td>소속기관</td>
            <td>
            	<select id="insttCode" name="insttCode" title="소속기관" >
	            	<c:forEach var="item" items="${insttCode_result}">
	            		<option value="${item.code}" <c:if test="${item.code eq userManageVO.insttCode}">selected</c:if>>${item.codeNm}</option>
	            	</c:forEach>
	            </select>
	        </td>
	    </tr>
	    <tr><td height="20" colspan="2"></td></tr>
        <tr>
            <td>결과</td>
            <td>
            	<span id="resultMsg">
	           		<c:choose>
	           			<c:when test="${emplyrId ne '' && isAction eq 'ID'}">${emplyrId}</c:when>
	           			<c:when test="${isAction ne 'ID' }">정보 입력후 찾기 버튼을 클릭하세요</c:when>
	           			<c:otherwise>검색된 아이디가 없습니다</c:otherwise>
	           		</c:choose>
           		</span>
	        </td>
	    </tr>
	    <tr><td height="20" colspan="2"></td></tr>
	    <tr>
	    	<td colspan="2">
			    <div class="buttons" style="padding-top:10px;padding-bottom:10px;margin-left:90px;">
				    <a href="#LINK" onclick="javascript:fnFind(); return false;">찾기</a>
				    <a href="#LINK" onclick="javascript:fnClose(); return false;"><spring:message code="button.close" /></a>
			    </div>
	    	</td>
	    </tr>
    </table>
-->
	</form>
