<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<%@ page import="egovframework.com.cmm.LoginVO" %>

<script type="text/javaScript" defer="defer">
<!--

function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var returnValue = "";
    var returnBoolean = false;
    var checkCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkCount++;
                    checkField[i].value = checkId[i].value;

                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else
                        returnValue = returnValue + ";" + checkField[i].value;
                }
            }
            if(checkCount > 0)
                returnBoolean = true;
            else {
                alert("선택된  그룹이 없습니다.");
                returnBoolean = false;
            }
        } else {
             if(document.listForm.delYn.checked == false) {
                alert("선택된 그룹이 없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.groupIds.value = returnValue;

    return returnBoolean;
}

function fncSelectGroup(groupId) {
    document.listForm.groupId.value = groupId;
    document.listForm.action = "<c:url value='/sys/author/gpm/Group.do'/>";
    document.listForm.submit();
}

function fncAddGroupInsert() {
    location.replace("<c:url value='/sys/author/gpm/GroupInsertView.do'/>");
}

function fncGroupListDelete() {
    if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sys/author/gpm/GroupListDelete.do'/>";
            document.listForm.submit();
        }
    }
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sys/author/gpm/GroupManage.do'/>";
    document.listForm.submit();
}
//-->
</script>

<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
            <form:form id="listForm" name="listForm" action="/sys/author/gpm/GroupManage.do" method="post">
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
                	<h2>회원그룹관리 <strong>목록</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">

                        <fieldset><legend>조건정보 영역</legend>
                        <div class="sf_start">
                            <ul class="search_form">
                                <li>
                                	<label for="searchKeyword" class="first">그룹명</label>
                                    <input id="searchKeyword" name="searchKeyword" type="text" value="<c:out value='${groupManageVO.searchKeyword}'/>" size="25" title="검색" class="input_style1 input_w1" />
                                </li>
                            </ul>

                            <div class="search_btn_wrap">
                            	<a href="#LINK" onclick="javascript:fnSearch(); return false;" class="search_btn"><spring:message code="button.search" /></a>
                            </div>
                        </div>
                        </fieldset>
                </div>
                <!-- //검색 필드 박스 끝 -->
                ${custld:renderPageInfoWithoutExcel(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount(), "Y")}
                <!-- table add start -->
                <div class="tablestyle_1">
                    <table summary="그룹 관리에 관한 테이블입니다.그룹 ID,그룹 명,설명,등록일자의 정보를 담고 있습니다.">
                    <caption>그룹 관리</caption>
                    <colgroup>
                        <col width="5%" >
                        <col width="20%" >
                        <col width="20%" >
                        <col width="40%" >
                        <col width="15%" >
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택"></th>
                        <th scope="col" nowrap="nowrap">그룹 ID</th>
                        <th scope="col" nowrap="nowrap">그룹 명</th>
                        <th scope="col" nowrap="nowrap">설명</th>
                        <th scope="col" nowrap="nowrap">등록일자</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="group" items="${groupList}" varStatus="status">
                    <!-- loop 시작 -->
                      <tr>
					    <td nowrap="nowrap"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${group.groupId}"/>" /></td>
					    <td nowrap="nowrap"><span class="link"><a href="#LINK" onclick="javascript:fncSelectGroup('<c:out value="${group.groupId}"/>')"><c:out value="${group.groupId}"/></a></span></td>
					    <td nowrap="nowrap"><c:out value="${group.groupNm}"/></td>
					    <td nowrap="nowrap"><c:out value="${group.groupDc}"/></td>
					    <td nowrap="nowrap"><c:out value="${group.groupCreatDe}"/></td>
                      </tr>
                     </c:forEach>
                     <c:if test="${fn:length(groupList) == 0}">
                        <tr>
	                        <td class="listCenter" colspan="5" ><spring:message code="common.nodata.msg" /></td>
			          	</tr>
				    </c:if>
                    </tbody>
                    </table>
                </div>

                <!-- 페이지 네비게이션 시작 -->
                <c:if test="${!empty groupManageVO.pageIndex }">
                    <div id="paging_div">
                        <ul class="paging_align">
                            <ui:pagination paginationInfo = "${paginationInfo}"
                                type="image"
                                jsFunction="linkPage"
                                />
                        </ul>
                    </div>


                <!-- //페이지 네비게이션 끝 -->
				    <div align="right">
<%-- 				        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/> --%>
				    </div>
                </c:if>

                <div class="board_btn_wrap">
                	<a href="#" class="board_btn" onclick="javascript:fncAddGroupInsert(); return false;"><spring:message code="button.create" /></a>
                	<a href="#" class="board_btn del" onclick="javascript:fncGroupListDelete(); return false;"><spring:message code="button.delete" /></a>
                </div>

				<input type="hidden" name="groupId"/>
				<input type="hidden" name="groupIds"/>
				<input type="hidden" name="pageIndex" value="<c:out value='${groupManageVO.pageIndex}'/>"/>
				<input type="hidden" name="searchCondition" value="1"/>
				</div>
            </form:form>