<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>


<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript" src="<c:url value='/js/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" defer="defer">
<!--
function fnIdCheck(){
    $.ajax({
        url:'<c:url value='/cmm/login/IdDplctCnfirm.do'/>',
        type:'POST',
        dataType:'json',
        contentType:"application/json; charset=UTF-8",
        data:$("#emplyrId").val(),
        success:function(data){
            if(data.usedCnt>0){
				alert('이미 사용중인 아이디입니다.');
            }else{
                alert('사용가능한 아이디입니다.');
                $("#idcheckFlag").val(1);
            }
        }
    });
}
function showModalDialogCallback(retVal) {
    if(retVal) {
        document.userManageVO.emplyrId.value = retVal;
        document.userManageVO.id_view.value = retVal;
    }
}
function fnListPage(){
    document.userManageVO.action = "<c:url value='/sys/user/urm/UserManage.do'/>";
    document.userManageVO.submit();
}
function fnInsert(){

    if($("#emplyrId").val()==''){
	alert("이메일 아이디를 입력해주세요");
	$("#emplyrId").focus();
	return false;
	}
	if(!email_check($("#emplyrId").val())){
		alert("이메일 형식에 맞게 입력해주세요");
		return false;
	}
	if($("#idcheckFlag").val()==0){
		alert('아이디 중복확인을 해주세요');
		return false;
	}
	if($("#emplyrNm").val()==''){
	    alert('이름을 입력해주세요');
	    $("#emplyrNm").focus();
	    return false;
	}
    var password  = $("#password").val();
    var password2 = $("#password2").val();

	if(password=='' || password2==''){
		alert("패스워드를 입력해주세요");
	    $("#password").focus();
	    if($("#password").val() != ''){
	    	$("#password2").focus();
	    }
		return false;
	}

    if(/^(?=.*[a-z]).((?=.*\d)|(?=.*\W)).{8,20}$/.test(password)){
    }else{
        alert('특수문자, 영문, 숫자를 조합하여 8자리 이상으로 설정해주세요.');
        $("#password").focus();
        return false;
    }

    if(password==password2){
    }else{
        alert('패스워드가 서로 다릅니다.');
        $("#password2").focus();
        return false;
    }


	if($("#password").val()!= $("#password2").val() ){
		alert("패스워드가 같지 않습니다.");
	    $("#password").focus();
	    if($("#password").val() != ''){
	    	$("#password2").focus();
	    }
		return false;
	}

	if($("#moblphonNo1").val()=='' || $("#moblphonNo2").val()==''|| $("#moblphonNo3").val()==''){
	    alert('휴대전화을 입력해주세요');
	    $("#mbtlnum").focus();
	    return false;
	}else{
		$("#mbtlnum").val($("#moblphonNo1").val() + "-" + $("#moblphonNo2").val() + "-" + $("#moblphonNo3").val());
	}



	var userTy = $("input[name='userTyR']:checked").val();
	$("#userTy").val(userTy);
    if(userTy == 1){
        if($("#customerNum").val()==''){
            alert("회원번호를 입력해주세요.");
            $("#customerNum").focus();
            return false;
        }
    	if($("#manageBizplc option:selected").val()==''){
    		alert("관리사업소를 선택해주세요.");
    		return false;
    	}
    } else {
    	$("#customerNum").val('');
    	$("#manageBizplc").val('');
    }
	if(userTy ==2){

		if($("#insttCode option:selected").val()==''){
		    alert('소속기관을 선택해주세요');
		    return false;
		}
		if($("#deptId").val()==''){
		    alert('부서를 입력해주세요');
		    $("#deptId").focus();
		    return false;
		}
	}else{
	    $("#insttCode").val('');
	    $("#deptId").val('');
	}
document.userManageVO.submit();

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

/*
if (typeof(opener.fn_dn_info_setting) == 'undefined') {
    alert('메인 화면이 변경되거나 없습니다');
    this.close();
} else {
    opener.fn_dn_info_setting(dn);
    this.close();
}
*/

function fn_checkPass(){
    var password  = $("#password").val();
    var password2 = $("#password2").val();

    if(/^(?=.*[a-z]).((?=.*\d)|(?=.*\W)).{8,20}$/.test(password)){
        $("#message").html('');
        $("#messageDiv").hide();
    }else{
        $("#message").html('특수문자, 영문, 숫자를 조합하여 8자리 이상으로 설정해주세요.');
    }

    if(password==password2){
        $("#messageDiv2").hide();
        $("#message2").html('');
    }else{
        $("#messageDiv2").show();
        $("#message2").html('패스워드가 서로 다릅니다.');
    }
}
//이메일 정규식 체크
function email_check(email) {

	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	return reg.test(email);

}
function changeUserTy(userTy){
    if(userTy==1){
        $("#insttCodeTr").hide();
        $("#deptIdTr").hide();
        $("#customerNumTr").show();
        $("#manageBizplcTr").show();
    }else{
        $("#insttCodeTr").show();
        $("#deptIdTr").show();
        $("#customerNumTr").hide();
        $("#manageBizplcTr").hide();
    }
}
//-->
</script>

<section class="panel-wrap">
    <div class="panel-header">
        <h3>회원 정보 등록</h3>
    </div>
    <form:form commandName="userManageVO" action="${pageContext.request.contextPath}/sys/user/urm/UserInsert.do" name="userManageVO" method="post" >
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
             <div class="table-box table-row table-col-6 y-scroll content-height-1">
                 <table>
                     <caption>회원 정보 등록</caption>
                     <colgroup>
                         <col style="width:300px;">
                         <col style="width:auto;">
                     </colgroup>
                     <tbody>
                      	<tr>
                             <th scope="row"><span>회원종류</span></th>
                             <td>
		                         <div class="label-input">
									<label><input type="radio" name="userTyR" value="1" onclick="changeUserTy(1)" checked >일반회원</label>
									<label><input type="radio" name="userTyR" value="2" onclick="changeUserTy(2)">전담기관</label>

								 </div>
                             </td>
                         </tr>
                         <tr>
                             <th scope="row"><span>아이디(이메일)</span></th>
                             <td>
                                 <div>
                                    <form:input path="emplyrId" id="emplyrId" size="100" maxlength="100" />
                                    <form:errors path="emplyrId" cssClass="error" />
                                    <button type="button" class="btn btn-primary" onclick="javascript:fnIdCheck();">중복확인</button>
                                 </div>
                             </td>
                         </tr>
                         <tr>
                             <th scope="row"><span>이름</span></th>
                             <td>
                                 <div>
                                    <form:input path="userNm" id="emplyrNm" size="20" maxlength="60" />
                                    <form:errors path="userNm" cssClass="error" />
                                 </div>
                             </td>
                         </tr>
                         <tr>
                             <th scope="row"><span>패스워드</span></th>
                             <td>
                                 <div>
                                 	<input type="password" name="password" id="password" placeholder="패스워드"  onkeyup="javascript:fn_checkPass();" />
                                 </div>
                                 <div class="justify-content-between mt15" id="messageDiv">
                                 	<span class="message" id="message">* 영문 대소문자, 숫자를 조합하여 8~16자 사이로 입력하세요.</span>
								 </div>
                             </td>
                         </tr>
                         <tr>
                             <th scope="row"><span>패스워드 확인</span></th>
                             <td>
                                 <div>
                                 	<input type="password" id="password2" class="pw" placeholder="패스워드 확인"   onkeyup="javascript:fn_checkPass();"/>
                                 </div>
                                 <div class="justify-content-between mt15" id="messageDiv2" >
                                 	<span class="message" id="message2">* 패스워드 확인을 입력하세요.</span>
								 </div>
                             </td>
                         </tr>
                         <tr>
                             <th scope="row"><span>휴대전화</span></th>
                             <td>
                                 <div>
                                 	<input type="hidden" name="mbtlnum" id="mbtlnum" placeholder="휴대전화" value=""/>
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
                         <tr id="customerNumTr">
                            <th scope="row"><span>회원번호</span></th>
                            <td>
                                <div>
                                    <form:input path="customerNum" id="customerNum" size="20" maxlength="60"/>
                                    <form:errors path="customerNum" cssClass="error" />
                                </div>
                            </td>
                         </tr>
                         <tr id="manageBizplcTr">
                            <th scope="row">관리사업소</th>
                            <td>
                                <div>
                                     <select name="manageBizplc" id="manageBizplc">
                                        <option value="" label="--선택하세요--"/>
                                        <c:forEach var="result" items="${region_result}" varStatus="status">
                                            <option value="${result.code}">${result.codeNm}</option>
                                        </c:forEach>
                                     </select>
                                </div>
                            </td>
                         </tr>
                         <tr id="insttCodeTr" style="display: none;">
                             <th scope="row">소속</th>
                             <td>
                                 <div>
                                     <select name="insttCode" id="insttCode">
                                        <option value="" label="--선택하세요--"  />
                                        <c:forEach var="result" items="${insttCode_result}" varStatus="status">
	                                        <c:if test="${result.code ne 'INS00'}">
	                                       		 <option value="${result.code}" >${result.codeNm}</option>
	                                       	</c:if>
                                        </c:forEach>
                                     </select>
                                 </div>
                             </td>
                         </tr>
                         <tr id="deptIdTr" style="display: none;">
                             <th scope="row">부서</th>
                             <td>
                                 <div>
                                    <form:input path="deptId" id="deptId" size="20" maxlength="30" />
                                    <form:errors path="deptId" cssClass="error" />
                                 </div>
                             </td>
                         </tr>
                     </tbody>
                 </table>
             </div>
          </div>
       <div class="panel-footer">
           <div class="btn-area">
               <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fnInsert();">등록</button>
               <button type="button" class="btn btn-default btn-lg" onclick="javascript:fnListPage();">목록</button>
           </div>
       </div>
       <input type="hidden" id="idcheckFlag" value="0">
       <input type="hidden" name="userTy" id="userTy" value="0">
      </form:form>
 </section>
<!-- modal -->
<form name="modalForm" methos="post">
    <div class="modal fade" id="modal-find" role="dialog">
	    <div class="modal-dialog modal-sm">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                <h3>소속 찾기</h3>
	            </div>
	            <div class="modal-body">
	                <div class="tree-area">
	                    <div id="tree"></div>
	                </div>
	            </div>
	            <div class="modal-footer">
	                <div class="btn-area">
	                    <button type="button" class="btn btn-primary btn-lg">선택</button>
	                    <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">닫기</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</form>
<!-- modal -->
 <!-- panel -->
