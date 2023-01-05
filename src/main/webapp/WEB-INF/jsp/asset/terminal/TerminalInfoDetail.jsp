<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 목록 화면 function */
function fn_List() {
    document.terminalInfoVO.action = "<c:url value='/asset/terminal/TerminalInfoList.do'/>";
    document.terminalInfoVO.submit();
}

/* 글 등록 function */
function fn_Save() {
    document.terminalInfoVO.submit();
}

// -->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>단말기 상세</h3>
    </div>
    <form:form commandName="terminalInfoVO" name="terminalInfoVO" action="${pageContext.request.contextPath}/asset/terminal/updateTerminalInfo.do" method="post">

     <div class="panel-body">
         <div class="table-box table-row table-col-6 y-scroll content-height-1">
            <table>
                <caption>단말기 정보 등록</caption>
                <colgroup>
                    <col style="width:200px;">
                    <col style="width:auto;">
                </colgroup>
                                <tbody>
                    <tr>
                        <th scope="row">단말기 관리번호</th>
                        <td>
                            <div>
                                <form:input path="terminalManagenum" id="terminalManagenum" title="단말기관리번호" placeholder="입력하세요."/>
                                <form:errors path="terminalManagenum" cssClass="error" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">고객번호</th>
                        <td>
                            <div>
                                <form:input path="customerNum" id="customerNum" title="고객번호" placeholder="입력하세요."/>
                                <form:errors path="customerNum" cssClass="error" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">고객명</th>
                        <td>
                            <div>
                                <form:input path="customerName" id="customerName" title="고객명" placeholder="입력하세요."/>
                                <form:errors path="customerName" cssClass="error" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">위치</th>
                        <td>
                            <div class="input-title">
                                <form:input path="lat" id="lat" title="위도" placeholder="X"/>
                                <form:errors path="lat" cssClass="error" />
                                <form:input path="lot" id="lot" title="경도" placeholder="Y"/>
                                <form:errors path="lot" cssClass="error" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">명칭</th>
                        <td>
                            <div>
                                <form:input path="terminalName" id="terminalName" title="명칭" placeholder="입력하세요."/>
                                <form:errors path="terminalName" cssClass="error" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">구입년도</th>
                        <td>
                            <div class="col-3">
                                <select name="purchaseYear" id="purchaseYear" title="구입년도">
                                    <option value="" label="--선택하세요--"/>
                                    <c:forEach var="result" items="${year_result}" varStatus="status">
                                        <option value="${result.codeNm}" <c:if test="${terminalInfoVO.purchaseYear eq result.codeNm}"> selected </c:if>>${result.codeNm}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">규격 및 스펙</th>
                        <td>
                            <div>
                                <select name="standardCode" id="standardCode" title="규격">
                                    <option value="" label="--선택하세요--"/>
                                    <c:forEach var="result" items="${standard_result}" varStatus="status">
                                        <option value="${result.codeNm}" <c:if test="${terminalInfoVO.standardCode eq result.codeNm}"> selected </c:if>>${result.codeNm}</option>
                                    </c:forEach>
                                </select>
                                <form:input path="spec" id="spec" title="스펙" placeholder="입력하세요."/>
                                <form:errors path="spec" cssClass="error" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">대체단말기 관리번호</th>
                        <td>
                            <div>
                                <form:input path="subterminalManagenum" id="subterminalManagenum" title="대체계량기 관리번호" placeholder="입력하세요."/>
                                <form:errors path="subterminalManagenum" cssClass="error" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">관리사업소</th>
                        <td>
                            <div class="col-3">
                                <select name="manageBizplc" id="manageBizplc" title="관리사업소">
                                    <option value="" label="--선택하세요--"/>
                                    <c:forEach var="result" items="${manageBizplc_result}" varStatus="status">
                                        <option value="${result.codeNm}" <c:if test="${terminalInfoVO.manageBizplc eq result.codeNm}"> selected </c:if>>${result.codeNm}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

    </form:form>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javaScript:fn_Save(); return false;">수정</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javaScript:fn_List(); return false;">목록</button>
        </div>
    </div>
</section>