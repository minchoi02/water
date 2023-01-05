<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<script type="text/javaScript">
	function fnUpdate(){
		if(document.linkVO.lnkNm.value==""){
			alert('연계정보명을 입력해주세요');
			document.linkVO.lnkNm.focus();
			return false;
		}
		if(document.linkVO.insttNm.value==""){
			alert('기관명을 입력해주세요');
			document.linkVO.insttNm.focus();
			return false;
		}
		if(document.linkVO.chargerNm.value==""){
			alert('담당자명을 입력해주세요');
			document.linkVO.chargerNm.focus();
			return false;
		}
		if(document.linkVO.lnkCycle.value==""){
			alert('연계주기를 입력해주세요');
			document.linkVO.lnkCycle.focus();
			return false;
		}
			if(!confirm('<spring:message code="common.save.msg" />')) return;
		    document.linkVO.submit();
	}

	function fnListPage() {
		document.linkVO.action = "<c:url value='/sys/link/llm/LinkListManage.do'/>";
	    document.linkVO.submit();
	}

	function fnDelete() {
		if(!confirm('<spring:message code="common.delete.msg" />')) return;
		document.linkVO.action = "<c:url value='/sys/link/llm/deleteLinkList.do'/>";
	    document.linkVO.submit();
	}
</script>
<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>연계 수정</h3>
    </div>
	<form:form commandName="searchVO" name="linkVO" action="${pageContext.request.contextPath}/sys/link/llm/updateLinkList.do" method="post">
	<input type="hidden" name="lnkId" value="${searchVO.lnkId}" />
	 <div class="panel-body">
		 <div class="table-box table-row table-col-6 y-scroll content-height-1">
			<table>
				<tr>
					<th scope="col" class="essential"><span>연계정보명</span></th>
					<td>
						<form:input path="lnkNm" id="lnkNm" title="연계정보명" size="20" maxlength="20"/>
						<form:errors path="lnkNm" cssClass="error" />
					</td>
					<th scope="col" class="essential"><span>기관명</span></th>
					<td>
						<form:input path="insttNm" id="insttNm" title="기관명" size="20" maxlength="20"/>
						<form:errors path="insttNm" cssClass="error" />
					</td>
				</tr>
				<tr>
					<th scope="col"><span>부서명</span></th>
					<td>
						<form:input path="deptNm" id="deptNm" title="부서명" size="20" maxlength="20"/>
						<form:errors path="deptNm" cssClass="error" />
					</td>
					<th scope="col" class="essential"><span>담당자명</span></th>
					<td>
						<form:input path="chargerNm" id="chargerNm" title="담당자명" size="20" maxlength="20"/>
						<form:errors path="chargerNm" cssClass="error" />
					</td>
				</tr>
				<tr>
					<th scope="col"><span>담당자연락처</span></th>
					<td>
						<form:input path="chargerTelno" id="chargerTelno" title="담당자연락처" size="20" maxlength="20"/>
						<form:errors path="chargerTelno" cssClass="error" />
					</td>
					<th scope="col"><span>담당자 이메일</span></th>
					<td>
						<form:input path="chargerEmailAdres" id="chargerEmailAdres" title="담당자 이메일" size="20" maxlength="20"/>
						<form:errors path="chargerEmailAdres" cssClass="error" />
					</td>
				</tr>
			</table>
			</div>
			<br>
			<h4>연계 상세</h4>
			<div class="table-box table-row table-col-6 y-scroll content-height-1">
			<table>
				<tr>
					<th scope="col" class="essential"><span>연계유형</span></th>
					<td>
						<form:select path="lnkTy" id="lnkTy" title="연계유형" >
							<form:options items="${lnkTyCode_result}" itemValue="code" itemLabel="codeNm" />
						</form:select>
					</td>
					<th scope="col" class="essential"><span>연계주기</span></th>
					<td>
						<form:input path="lnkCycle" id="lnkCycle" title="연계주기" size="20" maxlength="20"  />
						<form:errors path="lnkCycle" cssClass="error" />
					</td>
				</tr>
				<tr>
					<th scope="col"><span>연계인코딩</span></th>
					<td>
						<form:input path="lnkEncd" id="lnkEncd" title="연계인코딩" size="20" maxlength="20" />
						<form:errors path="lnkEncd" cssClass="error" />
					</td>
					<th scope="col" class="essential"><span>연계형식</span></th>
					<td>
						<form:select path="lnkFom" id="lnkFom" title="연계유형">
							<form:options items="${lnkFomCode_result}" itemValue="code" itemLabel="codeNm" />
						</form:select>
					</td>
				</tr>
				<tr>
					<th scope="col"><span>연계URL</span></th>
					<td colspan="3">
						<form:input path="lnkUrl" id="lnkUrl" title="연계URL" size="20" maxlength="20" />
						<form:errors path="lnkUrl" cssClass="error" />
					</td>
				</tr>
				<tr>
					<th scope="col"><span>OPENAPI서비스키</span></th>
					<td colspan="3">
						<form:input path="svcKey" id="svcKey" title="OPENAPI서비스키" size="20" maxlength="20" />
						<form:errors path="svcKey" cssClass="error" />
					</td>
				</tr>
				<tr>
					<th scope="col"><span>OPENAPI서비스키 사용기간</span></th>
					<td colspan="3">
						<input name="svcKeyUsePd" id="svcKeyUsePd" type="text" />
						<div class="label-input mt15">
							<label>
								<input name="lmttAt" id="lmttAt" type="checkbox" <c:if test="${searchVO.lmttAt eq 'on'}">checked</c:if> />사용기간 제한 없음
							</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="col"><span>연계호출서버</span></th>
					<td colspan="3">
						<form:input path="callServerIp" id="callServerIp" title="연계호출서버" size="20" maxlength="20"/>
						<form:errors path="callServerIp" cssClass="error" />
					</td>
				</tr>
				<tr>
					<th scope="col"><span>연계정보설명</span></th>
					<td colspan="3">
						<form:input path="lnkDc" id="lnkDc" title="연계정보설명" size="20" maxlength="20" />
						<form:errors path="lnkDc" cssClass="error" />
					</td>
				</tr>
				<tr>
					<th scope="col" class="essential"><span>사용여부</span></th>
					<td colspan="3">
                        <form:radiobutton path="useAt" id="useAt" value="Y" label="사용"  cssStyle="width:15px; height:15px;"/>
                        <form:radiobutton path="useAt" id="useAt" value="N" label="미사용" cssStyle="width:15px; height:15px;"/>
                        <form:errors path="useAt"/>
			        </td>
				</tr>
			</table>
		</div>
	</div>

	<input type="hidden" name="searchCondition" value="<c:out value='${linkVO.searchCondition}'/>" />
	<input type="hidden" name="searchKeyword" value="<c:out value='${linkVO.searchKeyword}'/>" />
	<input type="hidden" name="pageIndex" value="<c:out value='${linkVO.pageIndex}'/><c:if test="${linkVO.pageIndex eq null}">1</c:if>" />
	<input type="hidden" name="sbscrbSttus" value="<c:out value='${linkVO.sbscrbSttus}'/>" />

	</form:form>
	<div class="panel-footer">
  		<div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javaScript:fnUpdate(); return false;">수정</button>
            <button type="button" class="btn btn-gray btn-lg" onclick="javascript:fnDelete(); return false;">삭제</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javaScript:fnListPage(); return false;">목록</button>
        </div>
 	</div>
</section>
