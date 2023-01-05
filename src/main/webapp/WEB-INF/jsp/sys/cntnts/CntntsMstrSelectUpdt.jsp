<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<script type="text/javascript" src="/namo/crosseditor/js/namo_scripteditor.js"></script>
<c:set var="registerFlag" value="${empty cntntsMstrVO.cntntsId ? 'INSERT' : 'UPDATE'}"/>
<validator:javascript formName="cntntsMstrVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript">
<!--
$(document).ready(function(){

});

function fnUpdate(){
	if(!validateCntntsMstrVO(document.cntntsMstrVO)) return;
    if(!confirm('<spring:message code="common.save.msg" />')) return;
    $("textarea[name=cntntsCn]").val(CrossEditor.GetBodyValue());

    document.cntntsMstrVO.submit();
}

function fnListPage() {
	document.cntntsMstrVO.action = "<c:url value='/sys/cntnts/CntntsMstrManage.do'/>";
    document.cntntsMstrVO.submit();
}

function fnDelete() {
	if(!confirm('<spring:message code="common.delete.msg" />')) return;
	document.cntntsMstrVO.action = "<c:url value='/sys/cntnts/CntntsMstrDelete.do'/>";
    document.cntntsMstrVO.submit();
}
function fnRestore(restoreId) {

    $("#restoreId").val(restoreId);
	if(!confirm('선택하신 콘텐츠를 다시 게제 합니다.')) return;
	document.cntntsMstrVO.action = "<c:url value='/sys/cntnts/CntntsMstrRestore.do'/>";
    document.cntntsMstrVO.submit();
}
function fnDeleteLog(restoreId) {

    $("#restoreId").val(restoreId);
	if(!confirm('콘텐츠 이력에서 완전 삭제합니다.')) return;
	document.cntntsMstrVO.action = "<c:url value='/sys/cntnts/CntntsMstrLogDelete.do'/>";
    document.cntntsMstrVO.submit();
}
//-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>콘텐츠 수정</h3>
    </div>
    <form:form commandName="cntntsMstrVO" action="${pageContext.request.contextPath}/sys/cntnts/CntntsMstrUpdt.do" name="cntntsMstrVO" method="post" >
        <input type="hidden" name="cntntsId" value="${cntntsMstrVO.cntntsId}" />
        <input type="hidden" name="restoreId" id="restoreId" value="${cntntsMstrVO.restoreId}" />
	    <div class="panel-body">
	       <p class="required"><span class="red">*</span>표기는 필수 입력사항</p>
	        <div class="table-box table-row table-col-6 y-scroll content-height-1">
	             <table>
	                 <caption>콘텐츠 수정</caption>
	                 <colgroup>
	                     <col style="width:300px;">
	                     <col style="width:auto;">
	                 </colgroup>
	                 <tbody>
	                      <tr>
	                         <th scope="row">콘텐츠 명</th>
	                         <td>
	                             <div>
	                                  <form:input path="cntntsNm" title="콘텐츠 명" size="50" maxlength="20" placeholder="입력하세요." />
	                                  <form:errors path="cntntsNm" cssClass="error" />
	                             </div>
	                         </td>
	                     </tr>
	                     <tr>
	                         <td colspan="2">
                                 <div class="col-12" style="display: block;" >
		                          <textarea id="cntntsCn" name="cntntsCn" alt="initText" title="initText" Style="width:730px; height:450px; font-size:10pt">
		                          	${cntntsMstrVO.cntntsCn}
		                          </textarea>
		                          <script type="text/javascript" language="javascript">

		                              var CrossEditor = new NamoSE('cntntsCn');
		                              CrossEditor.params.Width = "100%";
		                              CrossEditor.params.UserLang = "auto";

		                              CrossEditor.params.FullScreen = false;

		                              CrossEditor.EditorStart();
		                              function OnInitCompleted(e){
		                                  e.editorTarget.SetBodyValue(document.getElementById("cntntsCn").value);

		                                  }
		                          </script>
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
            <button type="button" class="btn btn-secondary btn-lg" data-bs-toggle="modal" data-bs-target="#modal-log">이력보기</button>
            <button type="button" class="btn btn-primary btn-lg" onclick="javaScript:fnUpdate(); return false;">수정</button>
            <button type="button" class="btn btn-gray btn-lg" onclick="javascript:fnDelete(); return false;">삭제</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javaScript:fnListPage(); return false;">목록</button>
        </div>
    </div>
</section>
<!-- panel -->

<!-- modal -->
<div class="modal fade" id="modal-log" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h3>콘텐츠 이력 관리</h3>
				<button type="button" class="btn-close text-reset" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="table-box">
					<table>
						<caption>치환 코드 관리</caption>
						<colgroup>
							<col style="width:5%;">
							<col style="width:95%;">
						</colgroup>
						<thead>
							<tr>
		                        <th scope="col">번호</th>
		                        <th scope="col">콘텐츠변경날짜</th>
		                    </tr>
						</thead>
						<tbody>
						 	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
		                    <!-- loop 시작 -->
		                       <tr>
		                           <td class="chevron" data-bs-toggle="collapse" href="#Collapse<c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/>" role="button" aria-expanded="false" aria-controls="Collapse<c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/>"></td>
		                           <td>${fn:substring(resultInfo.frstRegDt,0,16)}</td>
		                       </tr>
		                       <tr>
									<td colspan="2" class="table-content">
										<div class="collapse" id="Collapse<c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/>">
											<pre-wrap>
                                    			${resultInfo.cntntsCn}
                                			</pre-wrap>
	                    					<div class="btn-area justify-content-right">
													<button type="button" class="btn btn-primary" onclick="javascript:fnRestore('${resultInfo.restoreId}');">되살리기</button>
													<button type="button" class="btn btn-gray" onclick="javascript:fnDeleteLog('${resultInfo.restoreId}');">완전 삭제</button>
											</div>
                    					</div>
									</td>
								</tr>
		                    </c:forEach>
		                    <c:if test="${fn:length(resultList) == 0}">
		                        <tr>
		                            <td colspan="3"><spring:message code="common.nodata.msg" /></td>
		                        </tr>
		                    </c:if>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<div class="btn-area">
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>