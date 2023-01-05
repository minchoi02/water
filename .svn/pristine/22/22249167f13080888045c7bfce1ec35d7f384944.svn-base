<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<c:set var="registerFlag" value="${empty roleManageVO.roleCode ? 'INSERT' : 'UPDATE'}"/>
<validator:javascript formName="roleManage" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript">
<!--
function fncSelectRoleList() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sys/author/rem/RoleManage.do'/>";
    varFrom.submit();
}

function fncRoleInsert() {

    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sys/author/rem/RoleInsert.do'/>";


    if(!validateRoleManage(varFrom)){
        return;
    }else{
     	if(confirm("저장 하시겠습니까?")){
            varFrom.submit();
     	}
    }

}

function fncRoleUpdate() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sys/author/rem/RoleUpdate.do'/>";

    if(!validateRoleManage(varFrom)){
        return;
    }else{
        if(confirm("저장 하시겠습니까?")){
            varFrom.submit();
        }
    }
}

function fncRoleDelete() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sys/author/rem/RoleDelete.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>시스템관리</li>
                            <li>권한관리</li>
                            <li class="last"><strong>롤관리</strong></li>
                        </ul>
                    </div>
                </div>

                <div class="sub_tit_wrap">
  					<h2>롤관리 <strong>등록</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <form:form commandName="roleManage" method="post" >
					<div class="info_txt1">
	                	<span>*</span>표기는 필수 입력사항
	                </div>
                    <div class="tablestyle_2" >
                        <table summary="롤 등록 테이블입니다.롤 코드,롤 명,롤 패턴,설명,롤 타입,롤 Sort,등록일자의 정보를 담고 있습니다.">
						  <tr style="display:none">
						    <th scope="col" class="essential"><span>롤 코드</span></th>
						    <td nowrap="nowrap"><input name="roleCode" id="roleCode" type="text" value="<c:out value='${roleManage.roleCode}'/>" size="30" title="롤 코드" class="input_style1 input_w1"/></td>
						  </tr>
						  <tr>
						    <th scope="col" class="essential"><span>롤 명</span></th>
						    <td nowrap="nowrap"><input name="roleNm" id="roleNm" type="text" value="<c:out value='${roleManage.roleNm}'/>" maxLength="50" size="30" title="롤명" class="input_style1 input_w1"/>&nbsp;<form:errors path="roleNm" /></td>
						  </tr>
						  <tr>
						    <th scope="col" class="essential"><span>롤 패턴</span></th>
						    <td nowrap="nowrap"><input name="rolePtn" id="rolePtn" type="text" value="<c:out value='${roleManage.rolePtn}'/>" maxLength="50" size="50" title="롤패턴" class="input_style1 input_w1"/>&nbsp;<form:errors path="rolePtn" /></td>
						  </tr>
						  <tr>
						    <th scope="col"><span>설명</span></th>
						    <td nowrap="nowrap"><input name="roleDc" id="roleDc" type="text" value="<c:out value='${roleManage.roleDc}'/>" maxLength="50" size="50" title="설명" class="input_style1 input_w3"/></td>
						  </tr>
						  <tr style="display:none">
						    <th scope="col" class="essential"><span>롤 타입</span></th>
						    <td nowrap="nowrap"><input name="roleTyp" id="roleTyp" type="text" value="url" title="롤타입" class="input_style1 input_w1"/></td>
						  </tr>
						  <tr>
						    <th scope="col" class="essential"><span>롤 Sort</span></th>
						    <td nowrap="nowrap"><input name="roleSort" id="roleSort" type="text" value="<c:out value='${roleManage.roleSort}'/>" maxLength="50" size="30" title="롤sort" class="input_style1 input_w4"/></td>
						  </tr>
						  <tr style="display:none;">
						    <th scope="col"><span>등록일자</span></th>
						    <td nowrap="nowrap"><input name="roleCreatDe" id="roleCreatDe" type="text" value="<c:out value='${roleManage.roleCreatDe}'/>" maxLength="50" size="20" readonly="readonly" title="등록일자" class="input_style1 input_w6"/></td>
						  </tr>
                        </table>
                    </div>

                    <!-- 버튼 시작(상세지정 style로 div에 지정) -->
                    <div class="board_btn_wrap">
                    	<c:if test="${registerFlag == 'INSERT'}">
	                		<a href="#LINK" onclick="javascript:fncRoleInsert(); return false;" class="board_btn"><spring:message code="button.save" /></a>
	                	</c:if>
	                	<c:if test="${registerFlag == 'UPDATE'}">
	                		<a href="#LINK" onclick="javascript:fncRoleUpdate(); return false;" class="board_btn"><spring:message code="button.save" /></a>
	                		<a href="#LINK" onclick="javascript:fncRoleDelete(); return false;" class="board_btn del"><spring:message code="button.delete" /></a>
	                	</c:if>
                		<a href="#LINK" onclick="javascript:fncSelectRoleList(); return false;" class="board_btn"><spring:message code="button.list" /></a>
	                </div>
                    <!-- 버튼 끝 -->

					<!-- 검색조건 유지 -->
					<c:if test="${registerFlag == 'UPDATE'}">
					<input type="hidden" name="searchCondition" value="<c:out value='${roleManageVO.searchCondition}'/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value='${roleManageVO.searchKeyword}'/>"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${roleManageVO.pageIndex}'/>"/>
					</c:if>
                    <!-- 검색조건 유지 -->
                </form:form>

                <div align="right">
<%--                     <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지" /> --%>
                </div>

			</div>
