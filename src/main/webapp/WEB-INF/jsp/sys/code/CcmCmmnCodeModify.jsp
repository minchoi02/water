<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<c:url var="ImgUrl" value="/images"/>
<validator:javascript formName="cmmnCode" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<script type="text/javaScript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_list_CmmnCode(){
    document.cmmnCode.action = "<c:url value='/sys/code/hcm/CcmCmmnCodeList.do'/>";
    document.cmmnCode.submit();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
 function fn_modify_CmmnCode(form){
    if(confirm("<spring:message code='common.save.msg'/>")){
        if(!validateCmmnCode(form)){
            return;
        }else{
            form.submit();
        }
    }
}
 /* ********************************************************
  * 삭제 처리 함수
  ******************************************************** */
 function fnDelete(codeId){
     if (confirm("<spring:message code='common.delete.msg'/>")) {
         var varForm              = document.all["cmmnCode"];
         varForm.action           = "<c:url value='/sys/code/hcm/CcmCmmnCodeRemove.do'/>";
//          varForm.codeId.value     = "${result.codeId}";
         varForm.codeId.value     = codeId;
         varForm.submit();
     }
 }
//-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>공통 코드 수정</h3>
    </div>
    <form:form commandName="cmmnCode" name="cmmnCode" method="post">
        <input name="cmd" type="hidden" value="Modify">
	    <div class="panel-body">
	       <p class="required"><span class="red">*</span>표기는 필수 입력사항</p>
	        <div class="table-box table-row table-col-6 y-scroll content-height-1">
	            <table>
	                <caption>공통 코드 수정</caption>
	                <colgroup>
	                    <col style="width:300px;">
	                    <col style="width:auto;">
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row">코드 ID</th>
	                        <td>
	                            <div>
                                    <c:out value="${cmmnCode.codeId}"/>
                                    <form:hidden path="codeId" />
                                    <form:errors path="codeId" />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">코드명</th>
	                        <td>
	                            <div>
		                            <form:input  path="codeIdNm" size="60" maxlength="60" id="codeIdNm"/>
		                            <form:errors path="codeIdNm"/>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">코드 설명</th>
	                        <td>
	                            <div>
	                                <form:input path="codeIdDc" cols="100" rows="5" id="codeIdDc"  />
	                                <form:errors   path="codeIdDc"/>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">정렬 순번</th>
	                        <td>
	                            <div class="col-1">
	                                <input type="text" placeholder="입력하세요." />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">상위 코드 등록</th>
	                        <td class="flex">
	                            <div class="label-input">
	                                <label><input type="radio" />Yes</label>
	                                <label><input type="radio" />No</label>
	                                <input type="text" placeholder="입력하세요." />
	                                <button type="button" class="btn btn-default" data-bs-toggle="modal" data-bs-target="#modal-find">찾기</button>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">사용 여부</th>
	                        <td class="flex">
	                            <div class="label-input">
                                    <form:radiobutton path="useAt" id="useAt" value="Y" label="사용"  cssStyle="width:15px; height:15px;"/>
                                    <form:radiobutton path="useAt" id="useAt" value="N" label="미사용" cssStyle="width:15px; height:15px;"/>
                                    <form:errors path="useAt"/>
	                            </div>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
    </form:form>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fn_modify_CmmnCode(document.cmmnCode); return false;">수정</button>
            <button type="button" class="btn btn-gray btn-lg" onclick="javascript:fnDelete('<c:out value='${cmmnCode.codeId}'/>'); return false;">삭제</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javascript:fn_list_CmmnCode(); return false;">목록</button>
        </div>
    </div>
</section>
<!-- panel -->
    <!-- modal -->
    <div class="modal fade" id="modal-find" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h3>상위 코드</h3>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="tree-area">
                    코드 tree
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-area">
                        <button type="button" class="btn btn-primary btn-lg">선택</button>
                        <button type="button" class="btn btn-default btn-lg" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- modal -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>