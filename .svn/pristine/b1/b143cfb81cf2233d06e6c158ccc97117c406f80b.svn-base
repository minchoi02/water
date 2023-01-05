<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false" />

<script type="text/javascript" src="<c:url value='/js/EgovZipPopup.js' />"></script>
<script type="text/javaScript" defer="defer">
<!--
function fnListPage(){
    document.userManageVO.action = "<c:url value='/sys/user/urm/UserManage.do'/>";
    document.userManageVO.submit();
}
function fnDeleteUser(checkedIds) {
    if(confirm("<spring:message code="common.delete.msg" />")){
        document.userManageVO.checkedIdForDel.value=checkedIds;
        document.userManageVO.action = "<c:url value='/sys/user/urm/UserDelete.do'/>";
        document.userManageVO.submit();
    }
}
function fnPasswordMove(){
    document.userManageVO.action = "<c:url value='/cmm/main/UserPasswordUpdtView.do'/>";
    document.userManageVO.submit();
}
function fnPasswordInit(){
	if(!confirm("패스워드를 초기화 하시겠습니까?\n초기값 : 1")) return;

	document.userManageVO.action = '/sys/user/urm/UserPasswordInit.do';
	document.userManageVO.submit();
}
function fnUpdate(){
	$("#moblphonNo").val($("#moblphonNo1").val() + "-" + $("#moblphonNo2").val() + "-" + $("#moblphonNo3").val());

    if(validateUserManageVO(document.userManageVO)){

        document.userManageVO.submit();
    }
}
function fn_inqire_cert() {
    var url = '/uat/uia/EgovGpkiRegist.do';
    var popupwidth = '500';
    var popupheight = '400';
    var title = '인증서';

    Top = (window.screen.height - popupheight) / 3;
    Left = (window.screen.width - popupwidth) / 2;
    if (Top < 0) Top = 0;
    if (Left < 0) Left = 0;
    Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=no,resizable=no,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
    PopUpWindow = window.open(url, title, Future)
    PopUpWindow.focus();
}

function fn_dn_info_setting(dn) {
    var frm = document.userManageVO;

    frm.subDn.value = dn;
}
<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
//-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
	<div class="panel-header">
		<h3>회원 정보</h3>
	</div>
	<form:form commandName="userManageVO" action="${pageContext.request.contextPath}/cmm/main/UserUpdt.do" name="userManageVO" method="post">
		<!-- 상세정보 회원 삭제시 prameter 전달용 input -->
		<input name="checkedIdForDel" type="hidden" />
		<!-- 검색조건 유지 -->
		<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>" />
		<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>" />
		<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>" />
		<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>" />
		<input type="hidden" name="reqFlag" value="${reqFlag}">
		<input type="hidden" name="emailAdres" id="emailAdres">
		<input type="hidden" name="moblphonNo" id="moblphonNo">
		<input type="hidden" name="uniqId" id="uniqId" value="<c:out value='${userManageVO.uniqId}'/>">
		<input type="hidden" name="emplyrSttusCode" id="emplyrSttusCode" value="P">
		<!-- 우편번호검색 -->
		<input type="hidden" name="zip_url" value="<c:url value='/sys/code/zip/CcmZipSearchPopup.do'/>" />
		<!-- 회원유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
		<input type="hidden" name="userTyForPassword" value="<c:out value='${userManageVO.userTy}'/>" />

		<div class="panel-body">
			<p class="required">
				<span class="red">*</span>표기는 필수 입력사항
			</p>
			<div class="table-box table-row table-col-6 y-scroll content-height-1">
				<table>
					<caption>회원 정보 수정</caption>
					<colgroup>
						<col style="width: 300px;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">아이디(이메일)</th>
							<td>
								<div>
									<form:input path="emplyrId" id="emplyrId" size="100" maxlength="100" readonly="true" />
									<form:errors path="emplyrId" cssClass="error" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td>
								<div>
									<form:input path="emplyrNm" id="emplyrNm" size="20" maxlength="60" />
									<form:errors path="emplyrNm" cssClass="error" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">휴대전화</th>
							<td>
								<div>
									<select name="moblphonNo1" id="moblphonNo1" title="휴대폰">
										  <c:forEach var="obj" items="${com015}">
										  	<option <c:if test="${fn:split(userManageVO.moblphonNo,'-')[0] eq obj.code}">selected="selected"</c:if> value="${obj.code}">${obj.code}</option>
										  </c:forEach>
									</select> -
									<input name="moblphonNo2" id="moblphonNo2" type="text" value="${fn:split(userManageVO.moblphonNo,'-')[1]}" title="휴대폰1" /> -
									<input name="moblphonNo3" id="moblphonNo3" type="text" value="${fn:split(userManageVO.moblphonNo,'-')[2]}" title="휴대폰2" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">소속</th>
							<td>
								<div>
									<form:select path="insttCode" id="insttCode">
										<form:option value="" label="--선택하세요--" />
										<form:options items="${insttCode_result}" itemValue="code" itemLabel="codeNm" />
									</form:select>
									<form:errors path="insttCode" cssClass="error" />

								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">부서</th>
							<td>
								<div>
									<form:input path="deptId" id="deptId" size="20" maxlength="30" />
									<form:errors path="deptId" cssClass="error" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">기기 오류 알림</th>
							<td>
								<div class="label-input">
									<label><input type="checkbox" />허용하시려면 체크해주세요.</label> <span class="gray font-md">* 허용 시 기기 오류 등의 알림이 입력한 번호로 전송됩니다.</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="panel-footer">
			<div class="btn-area">
				<button type="button" class="btn btn-secondary btn-lg" data-bs-toggle="modal" data-bs-target="#modal-pw" onclick="javascript:fnPasswordMove();">패스워드 변경</button>
				<button type="button" class="btn btn-primary btn-lg" onclick="javascript:fnUpdate();">수정</button>
				<button type="button" class="btn btn-gray btn-lg">탈퇴</button>
			</div>
		</div>
	</form:form>
</section>
<!-- panel -->

