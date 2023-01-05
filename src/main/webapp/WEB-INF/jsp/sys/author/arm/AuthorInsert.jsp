<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>


<c:set var="registerFlag" value="${empty authorManageVO.authorCode ? 'INSERT' : 'UPDATE'}"/>

<validator:javascript formName="authorManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript">
<!--
function fncSelectAuthorList() {
    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sys/author/arm/AuthorManage.do'/>";
    varFrom.submit();
}

function fncAuthorInsert() {

    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sys/author/arm/AuthorInsert.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAuthorManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncAuthorUpdate() {
    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sys/author/arm/AuthorUpdate.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAuthorManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncAuthorDelete() {
    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sys/author/arm/AuthorDelete.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}
//-->
</script>
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>시스템관리</li>
                            <li>권한관리</li>
                            <li class="last"><strong>권한 관리</strong></li>
                        </ul>
                    </div>
                </div>

                <div class="sub_tit_wrap">
                	<h2>권한관리 <strong>등록</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <!-- 검색 필드 박스 시작 -->
                <form:form commandName="authorManage" method="post" >
                	<div class="info_txt1">
	                	<span>*</span>표기는 필수 입력사항
	                </div>

                    <div class="tablestyle_2" >
                        <table summary="권한을 등록하는 테이블입니다.권한 코드,권한 명,설명,등록일자의 정보를 담고 있습니다.">
						  <tr>
						  	<th scope="col" class="essential"><span>권한코드</span></th>
						    <td><input name="authorCode" id="authorCode" type="text" value="<c:out value='${authorManage.authorCode}'/>" size="40" title="권한코드" class="input_style1 input_w1" />&nbsp;<form:errors path="authorCode" /></td>
						  </tr>
						  <tr>
						    <th scope="col" class="essential"><span>권한명</span></th>
						    <td><input name="authorNm" id="authorNm" type="text" value="<c:out value='${authorManage.authorNm}'/>" maxLength="50" size="40" title="권한명" class="input_style1 input_w6" />&nbsp;<form:errors path="authorNm" /></td>
						  </tr>
						  <tr>
						    <th scope="col"><span>설명</span></th>
						    <td><input name="authorDc" id="authorDc" type="text" value="<c:out value='${authorManage.authorDc}'/>" maxLength="50" size="50" title="설명" class="input_style1 input_w3" /></td>
						  </tr>
						  <tr style="display:none;">
						    <th scope="col">등록일자</th>
						    <td><input name="authorCreatDe" id="authorCreatDe" type="text" value="<c:out value='${authorManage.authorCreatDe}'/>" maxLength="50" size="20" readonly="readonly" title="등록일자" class="input_style1 input_w6"/></td>
						  </tr>
                        </table>
                    </div>

                    <!-- 버튼 시작(상세지정 style로 div에 지정) -->
                    <div class="board_btn_wrap">
                    	<c:if test="${registerFlag == 'INSERT'}">
	                		<a href="#LINK" onclick="javascript:fncAuthorInsert(); return false;" class="board_btn"><spring:message code="button.save" /></a>
	                	</c:if>
	                	<c:if test="${registerFlag == 'UPDATE'}">
	                		<a href="#LINK" onclick="javascript:fncAuthorUpdate(); return false;" class="board_btn"><spring:message code="button.save" /></a>
	                		<a href="#LINK" onclick="javascript:fncAuthorDelete(); return false;" class="board_btn del"><spring:message code="button.delete" /></a>
	                	</c:if>
                		<a href="#LINK" onclick="javascript:fncSelectAuthorList(); return false;" class="board_btn"><spring:message code="button.list" /></a>
	                </div>
                    <!-- 버튼 끝 -->

				    <div align="right">
<%-- 				        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지" /> --%>
				    </div>
					<!-- 검색조건 유지 -->
					<c:if test="${registerFlag == 'UPDATE'}">
					<input type="hidden" name="searchCondition" value="<c:out value='${authorManageVO.searchCondition}'/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value='${authorManageVO.searchKeyword}'/>"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${authorManageVO.pageIndex}'/>"/>
					</c:if>
                </form:form>
			</div>


