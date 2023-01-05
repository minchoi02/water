<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<validator:javascript formName="passwordChgVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" defer="defer">
<!--
function fnListPage(){
    document.passwordChgVO.action = "<c:url value='/sys/user/urm/UserManage.do'/>";
    document.passwordChgVO.submit();
}
function fnUpdate(){
    if(validatePasswordChgVO(document.passwordChgVO)){
        if(document.passwordChgVO.newPassword.value != document.passwordChgVO.newPassword2.value){
            alert("<spring:message code="fail.user.passwordUpdate2" />");
            return;
        }
        document.passwordChgVO.submit();
    }
}
function fnUpdate(){

    var password  = $("#newPassword").val();
    var password2 = $("#newPassword2").val();

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
    document.passwordChgVO.submit();
}
function fn_checkPass(){
    var password  = $("#newPassword").val();
    var password2 = $("#newPassword2").val();

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

<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
//-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>패스워드 수정</h3>
    </div>
    <form name="passwordChgVO" method="post" action="${pageContext.request.contextPath}/sys/user/urm/UserPasswordUpdt.do">
        <!-- onsubmit="javascript:return FormValidation(document.passwordChgVO);" >  -->
        <!-- 상세정보 회원 삭제시 prameter 전달용 input -->
        <input name="checkedIdForDel" type="hidden" />
        <!-- 검색조건 유지 -->
        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>" />
        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>" />
        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>" />
        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>" />
        <input type="hidden" name="reqFlag" value="${fn:replace(fn:replace(reqFlag, '<', '&lt;'), '>', '&gt;')}">
        <!-- 우편번호검색 -->
        <input type="hidden" name="url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />

        <div class="panel-body">
            <p class="required">
                <span class="red">*</span>표기는 필수 입력사항
            </p>
            <div class="table-box table-row y-scroll content-height-1">
                <table>
                    <colgroup>
                        <col style="width:200px;">
                        <col style="width:auto;">
                        <col style="width:200px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tr>
                        <th><span>회원아이디</span></th>
                        <td>
                            <input name="emplyrId" id="emplyrId" title="회원아이디" type="text" size="20" value="<c:out value='${userManageVO.emplyrId}'/>" maxlength="20" readonly="readonly" />
                            <input name="uniqId" id="uniqId" title="uniqId" type="hidden" size="20" value="<c:out value='${userManageVO.uniqId}'/>" />
                            <input name="userTy" id="userTy" title="userTy" type="hidden" size="20" value="<c:out value='${userManageVO.userTy}'/>" />
                        </td>
                    </tr>
                    <tr>
                        <th><span>기존 패스워드</span></th>
                        <td>
                            <input name="oldPassword" id="oldPassword" title="기존 패스워드" type="password" size="20" value="" maxlength="100" />
                        </td>
                    </tr>
                    <tr>
                        <th><span>변경 패스워드</span></th>
                        <td>
                            <div>
                                <input name="newPassword" id="newPassword" title="패스워드" type="password" size="20" value="" maxlength="100" onkeyup="javascript:fn_checkPass();" />
                            </div>
                            <div class="mt15">
                                <span class="message" id="message">* 영문 대소문자, 숫자를 조합하여 8~16자 사이로 입력하세요.</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>패스워드 확인</span></th>
                        <td>
                            <div>
                                <input name="newPassword2" id="newPassword2" title="패스워드확인" type="password" size="20" value="" maxlength="100" onkeyup="javascript:fn_checkPass();" />
                            </div>
                            <div class="mt15">
                                <span class="message" id="message2">* 패스워드 확인을 입력하세요.</span>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="panel-footer">
            <div class="btn-area">
                <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fnUpdate();">변경내용 저장</button>
            </div>
        </div>
        <!-- 버튼 끝 -->
    </form>
</section>
<!-- panel -->