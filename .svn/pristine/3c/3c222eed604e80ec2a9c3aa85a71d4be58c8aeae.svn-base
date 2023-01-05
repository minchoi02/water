<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>


<c:set var="registerFlag" value="${empty bbsMstrVO.bbsId ? 'INSERT' : 'UPDATE'}"/>
<validator:javascript formName="bbsMstrVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript">
<!--
function fnUpdate(){
	if(!validateBbsMstrVO(document.bbsMstrVO)) return;
    if(!confirm('<spring:message code="common.save.msg" />')) return;

    document.bbsMstrVO.submit();
}

function fnListPage() {
	document.bbsMstrVO.action = "<c:url value='/sys/bbs/BbsMstrManage.do'/>";
    document.bbsMstrVO.submit();
}

function fnDelete() {
	if(!confirm('<spring:message code="common.delete.msg" />')) return;
	document.bbsMstrVO.action = "<c:url value='/sys/bbs/BbsMstrDelete.do'/>";
    document.bbsMstrVO.submit();
}
//-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>게시판 수정</h3>
    </div>
    <form:form commandName="bbsMstrVO"  action="${pageContext.request.contextPath}/sys/bbs/BbsMstrUpdt.do" name="bbsMstrVO" method="post" >
	    <div class="panel-body">
	        <p class="required"><span class="red">*</span>표기는 필수 입력사항</p>
	        <div class="table-box table-row table-col-6 y-scroll content-height-1">
	            <table>
	                <caption>게시판 수정</caption>
	                <colgroup>
	                    <col style="width:300px;">
	                    <col style="width:auto;">
	                </colgroup>
	                <tbody>
	                	<tr>
	                        <th scope="row">게시판ID</th>
	                        <td>
	                            <div>
	                                  <form:input path="bbsId" title="게시판ID" size="50" maxlength="20" placeholder="입력하세요." readonly="true" />
                                      <form:errors path="bbsId" cssClass="error" />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">게시판명</th>
	                        <td>
	                            <div>
	                                  <form:input path="bbsNm" title="게시판명" size="50" maxlength="20" placeholder="입력하세요." />
                                      <form:errors path="bbsNm" cssClass="error" />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">게시판설명</th>
	                        <td>
	                            <div>
	                                  <form:input path="bbsDc" title="게시판설명" size="100" maxlength="50" placeholder="입력하세요." />
                                      <form:errors path="bbsDc" cssClass="error" />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">댓글사용여부</th>
	                        <td>
	                           <div class="label-input">
                                    <label><input type="radio" name="cmtAt" value="Y" <c:if test="${bbsMstrVO.cmtAt eq 'Y'}"> checked </c:if> />사용</label>
                                    <label><input type="radio" name="cmtAt" value="N" <c:if test="${bbsMstrVO.cmtAt eq 'N'}"> checked </c:if> />미사용</label>
                                </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">게시판 타입</th>
	                        <td>
	                           <div class="label-input">
                                    <label><input type="radio" name="bbsTy" value="1" <c:if test="${bbsMstrVO.bbsTy eq '1'}"> checked </c:if>/>목록</label>
                                    <label><input type="radio" name="bbsTy" value="2" <c:if test="${bbsMstrVO.bbsTy eq '2'}"> checked </c:if>/>갤러리</label>
                                    <label><input type="radio" name="bbsTy" value="3" <c:if test="${bbsMstrVO.bbsTy eq '3'}"> checked </c:if>/>Q&A</label>
                                    <label><input type="radio" name="bbsTy" value="4" <c:if test="${bbsMstrVO.bbsTy eq '4'}"> checked </c:if>/>웹진</label>
                                </div>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
	      <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
          <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
          <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/><c:if test="${searchVO.pageIndex eq null}">1</c:if>"/>
          <input type="hidden" name="recordCountPerPage" value="<c:out value='${searchVO.recordCountPerPage}'/>"/>
    </form:form>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javaScript:fnUpdate(); return false;">수정</button>
            <button type="button" class="btn btn-gray btn-lg" onclick="javascript:fnDelete(); return false;">삭제</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javaScript:fnListPage(); return false;">목록</button>
        </div>
    </div>
</section>
<!-- panel -->