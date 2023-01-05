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
<validator:javascript formName="cmmnDetailCode" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_list_CmmnDetailCode(){
    document.cmmnDetailCode.action = "<c:url value='/sys/code/hcm/CcmCmmnCodeList.do'/>";
    document.cmmnDetailCode.submit();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_regist_CmmnDetailCode(form){
    if(confirm("<spring:message code='common.save.msg'/>")){
        if(!validateCmmnDetailCode(form)){
            return;
        }else{
            form.cmd.value = "Regist";
            form.submit();
        }
    }
}
/* ********************************************************
 * CodeId 가져오기
 ******************************************************** */
function fn_get_CodeId(form){
    form.cmd.value = "";
    form.submit();
}
//-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>상세 코드 등록</h3>
    </div>
    <form:form commandName="cmmnDetailCode" name="cmmnDetailCode" method="post">
        <input name="cmd" type="hidden" value="<c:out value='Regist'/>"/>
	    <div class="panel-body">
	       <p class="required"><span class="red">*</span>표기는 필수 입력사항</p>
	        <div class="table-box table-row table-col-6 y-scroll content-height-1">
	            <table>
	                <caption>상세 코드 등록</caption>
	                <colgroup>
	                    <col style="width:300px;">
	                    <col style="width:auto;">
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row">코드 ID</th>
	                        <td>
	                            <div>
                                    <form:input path="codeId" id="codeId" size="100" maxlength="100"/>
                                    <form:errors path="codeId" cssClass="error" />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">코드</th>
	                        <td>
	                            <div>
                                    <form:input path="code" id="code" size="100" maxlength="100"/>
                                    <form:errors path="code" cssClass="error" />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">코드명</th>
	                        <td>
	                            <div>
                                    <form:input path="codeNm" id="codeNm" size="100" maxlength="100"/>
                                    <form:errors path="codeNm" cssClass="error" />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">코드 설명</th>
	                        <td>
	                            <div>
                                    <form:input path="codeDc" id="codeDc" size="100" maxlength="100"/>
                                    <form:errors path="codeDc" cssClass="error" />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">정렬 순번</th>
	                        <td>
	                            <div class="col-1">
                                    <form:input  path="ordr" size="60" maxlength="60" id="ordr"/>
                                    <form:errors path="ordr"/>
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
                                    <form:radiobutton path="useAt" id="useAt" value="Y" label="사용" cssStyle="width:15px; height:15px;"/>
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
            <button type="button" class="btn btn-primary btn-lg" onclick="fn_regist_CmmnDetailCode(document.cmmnDetailCode); return false;">등록</button>
            <button type="button" class="btn btn-default btn-lg" onclick="fn_list_CmmnDetailCode(); return false;">목록</button>
        </div>
    </div>
</section>
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
<!-- panel -->