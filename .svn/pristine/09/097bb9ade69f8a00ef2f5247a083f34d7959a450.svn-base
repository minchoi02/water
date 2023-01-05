<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<c:set var="registerFlag" value="${empty groupManageVO.groupId ? 'INSERT' : 'UPDATE'}"/>
<validator:javascript formName="groupManage" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript">

function fncSelectGroupList() {
    var varFrom = document.getElementById("groupManage");
    varFrom.action = "<c:url value='/sys/author/gpm/GroupManage.do'/>";
    varFrom.submit();
}

function fncGroupInsert() {
    var varFrom = document.getElementById("groupManage");
    varFrom.action = "<c:url value='/sys/author/gpm/GroupInsert.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateGroupManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncGroupUpdate() {
    var varFrom = document.getElementById("groupManage");
    varFrom.action = "<c:url value='/sys/author/gpm/GroupUpdate.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateGroupManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncGroupDelete() {
    var varFrom = document.getElementById("groupManage");
    varFrom.action = "<c:url value='/sys/author/gpm/GroupDelete.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}

</script>

<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>시스템관리</li>
                            <li>회원관리</li>
                            <li class="last"><strong>회원그룹관리</strong></li>
                        </ul>
                    </div>
                </div>

                <div class="sub_tit_wrap">
                	<h2>회원그룹관리 <strong>상세(수정)</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <form:form commandName="groupManage" method="post" >

					<div class="info_txt1">
	                	<span>*</span>표기는 필수 입력사항
	                </div>
                    <div class="tablestyle_2" >
                        <table summary="그룹을 수정하는 테이블입니다.그룹 ID,그룹 명,설명,등록일자 정보를 담고 있습니다.">
						  <tr>
						    <th scope="col" class="essential"><span>그룹아이디</span></th>
						    <td nowrap="nowrap"><input name="groupId" id="groupId" type="text" readonly="readonly" value="<c:out value='${groupManage.groupId}'/>" size="40" title="그룹 ID" class="input_style1 input_w1" /></td>
						  </tr>
						  <tr>
						    <th scope="col" class="essential"><span>그룹명</span></th>
						    <td nowrap="nowrap"><input name="groupNm" id="groupNm" type="text" value="<c:out value='${groupManage.groupNm}'/>" maxLength="50" size="40" title="그룹명" class="input_style1 input_w6" />&nbsp;<form:errors path="groupNm" /></td>
						  </tr>
						  <tr>
						    <th scope="col"><span>설명</span></th>
						    <td nowrap="nowrap"><input name="groupDc" id="groupDc" type="text" value="<c:out value='${groupManage.groupDc}'/>" maxLength="50" size="50" title="설명" class="input_style1 input_w3" /></td>
						  </tr>
						  <tr>
						    <th scope="col"><span>등록일자</span></th>
						    <td nowrap="nowrap"><input name="groupCreatDe" id="groupCreatDe" type="text" value="<c:out value='${groupManage.groupCreatDe}'/>" maxLength="50" size="20" readonly="readonly" title="등록일자" class="input_style1 input_w6"/></td>
						  </tr>
                        </table>
                    </div>

                    <!-- 버튼 시작(상세지정 style로 div에 지정) -->
                    <div class="board_btn_wrap">
                    	<c:if test="${registerFlag == 'INSERT'}">
	                		<a href="#LINK" onclick="javascript:fncGroupInsert(); return false;" class="board_btn"><spring:message code="button.save" /></a>
	                	</c:if>
	                	<c:if test="${registerFlag == 'UPDATE'}">
	                		<a href="#LINK" onclick="javascript:fncGroupUpdate(); return false;" class="board_btn"><spring:message code="button.save" /></a>
	                		<a href="#LINK" onclick="javascript:fncGroupDelete(); return false;" class="board_btn del"><spring:message code="button.delete" /></a>
	                	</c:if>
                		<a href="#LINK" onclick="javascript:fncSelectGroupList(); return false;" class="board_btn"><spring:message code="button.list" /></a>
	                </div>
                    <!-- 버튼 끝 -->

					<!-- 검색조건 유지 -->
					<c:if test="${registerFlag == 'UPDATE'}">
					<input type="hidden" name="searchCondition" value="<c:out value='${groupManageVO.searchCondition}'/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value='${groupManageVO.searchKeyword}'/>"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${groupManageVO.pageIndex}'/>"/>
					</c:if>
                    <!-- 검색조건 유지 -->
                </form:form>
                </div>

                <div align="right">
<%--                     <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지" /> --%>
                </div>

