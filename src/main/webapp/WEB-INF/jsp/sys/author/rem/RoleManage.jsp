<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

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
                alert("선택된  롤이 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된 롤이 없습니다.");
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

    document.listForm.roleCodes.value = returnValue;
    return returnBoolean;
}

function fncSelectRole(roleCode) {
    document.listForm.roleCode.value = roleCode;
    document.listForm.action = "<c:url value='/sys/author/rem/Role.do'/>";
    document.listForm.submit();
}

function fncAddRoleInsert() {
    location.replace("<c:url value='/sys/author/rem/RoleInsertView.do'/>");
}

function fncRoleListDelete() {
    if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sys/author/rem/RoleListDelete.do'/>";
            document.listForm.submit();
        }
    }
}

function fncAddRoleView() {
    document.listForm.action = "<c:url value='/sys/author/rem/RoleUpdate.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sys/author/rem/RoleManage.do'/>";
    document.listForm.submit();
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
            <form:form id="listForm" name="listForm" action="/sys/author/rem/RoleManage.do" method="post">
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
                	<h2>롤관리 <strong>목록</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                        <fieldset>
                            <legend>조건정보 영역</legend>
                            <div class="sf_start">
                            	<ul class="search_form">
                                    <li>
                                        <label for="searchKeyword" class="first">롤명</label>
                                        <input id="searchKeyword" name="searchKeyword" type="text" value="<c:out value='${roleManageVO.searchKeyword}'/>" size="25" title="검색" class="input_style1 input_w1" />
                                    </li>
                                </ul>

	                            <div class="search_btn_wrap">
	                            	<a href="#LINK" onclick="javascript:fnSearch(); return false;" class="search_btn"><spring:message code="button.search" /></a>
	                            </div>
                            </div>
                        </fieldset>
                    </div>

                ${custld:renderPageInfoWithoutExcel(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount(), 'Y')}
                <!-- table add start -->
                <div class="tablestyle_1">
                    <table summary="롤 관리 테이블입니다.롤  ID,롤 명,롤 타입,롤 Sort,롤 설명,등록일자의 정보를 담고 있습니다.">
                    <caption>롤 관리</caption>
                    <colgroup>
                        <col width="5%" >
                        <col width="15%" >
                        <col width="20%" >
                        <col width="10%" >
                        <col width="30%" >
                        <col width="20%" >
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택"></th>
                        <th scope="col" nowrap="nowrap">롤 ID</th>
                        <th scope="col" nowrap="nowrap">롤 명</th>
                        <th scope="col" nowrap="nowrap">롤 Sort</th>
                        <th scope="col" nowrap="nowrap">롤 설명</th>
                        <th scope="col" nowrap="nowrap">등록일자</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="role" items="${roleList}" varStatus="status">
                    <!-- loop 시작 -->
                      <tr>
                        <td nowrap="nowrap"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${role.roleCode}"/>" /></td>
                        <td nowrap="nowrap"><span class="link"><a href="#LINK" onclick="javascript:fncSelectRole('<c:out value="${role.roleCode}"/>')"><c:out value="${role.roleCode}"/></a></span></td>
                        <td nowrap="nowrap"><c:out value="${role.roleNm}"/></td>
                        <td nowrap="nowrap"><c:out value="${role.roleSort}"/></td>
                        <td nowrap="nowrap"><c:out value="${role.roleDc}"/></td>
                        <td nowrap="nowrap"><c:out value="${role.roleCreatDe}"/></td>
                      </tr>
                     </c:forEach>
                     <c:if test="${fn:length(roleList) == 0}">
                        <tr>
	                        <td class="listCenter" colspan="6" ><spring:message code="common.nodata.msg" /></td>
			          	</tr>
				    </c:if>
                    </tbody>
                    </table>
                </div>

                <!-- 페이지 네비게이션 시작 -->
                <c:if test="${!empty roleManageVO.pageIndex }">
                    <div id="paging_div">
                        <ul class="paging_align">
					        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
                        </ul>
                    </div>
                <!-- //페이지 네비게이션 끝 -->
				    <div align="right">
<%-- 				        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지" /> --%>
				    </div>
                </c:if>

                <div class="board_btn_wrap">
                	<a href="#" class="board_btn" onclick="javascript:fncAddRoleInsert(); return false;"><spring:message code="button.create" /></a>
                	<a href="#" class="board_btn del" onclick="javascript:fncRoleListDelete(); return false;"><spring:message code="button.delete" /></a>
                </div>

				<input type="hidden" name="roleCode"/>
				<input type="hidden" name="roleCodes"/>
				<input type="hidden" name="pageIndex" value="<c:out value='${roleManageVO.pageIndex}'/>"/>
				<input type="hidden" name="searchCondition" value="1"/>
				</div>
            </form:form>