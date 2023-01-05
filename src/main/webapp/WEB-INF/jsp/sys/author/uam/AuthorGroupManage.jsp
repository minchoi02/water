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

    var resultCheck = false;

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var selectAuthor = document.listForm.authorManageCombo;
    var booleanRegYn = document.listForm.regYn;
    var listMberTyCode = document.listForm.mberTyCode;

    var returnId = "";
    var returnAuthor = "";
    var returnRegYn = "";
    var returnmberTyCode = "";

    var checkedCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnId == "") {
                        returnId = checkField[i].value;
                        returnAuthor = selectAuthor[i].value;
                        returnRegYn = booleanRegYn[i].value;
                        returnmberTyCode = listMberTyCode[i].value;
                    }
                    else {
                        returnId = returnId + ";" + checkField[i].value;
                        returnAuthor = returnAuthor + ";" + selectAuthor[i].value;
                        returnRegYn = returnRegYn + ";" + booleanRegYn[i].value;
                        returnmberTyCode = returnmberTyCode + ";" + listMberTyCode[i].value;

                    }
                }
            }

            if(checkedCount > 0)
                resultCheck = true;
            else {
                alert("선택된  항목이 없습니다.");
                resultCheck = false;
            }

        } else {
             if(document.listForm.delYn.checked == false) {
                alert("선택 항목이 없습니다.");
                resultCheck = false;
            }
            else {
                returnId = checkId.value;
                returnAuthor = selectAuthor.value;
                returnRegYn = booleanRegYn.value;
                returnmberTyCode = listMberTyCode.value;

                resultCheck = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.userIds.value = returnId;
    document.listForm.authorCodes.value = returnAuthor;
    document.listForm.regYns.value = returnRegYn;

    return resultCheck;
}

function fncAddAuthorGroupInsert() {

    if(!fncManageChecked()) return;

    if(confirm("등록하시겠습니까?")) {
        document.listForm.action = "<c:url value='/sys/author/uam/AuthorGroupInsert.do'/>";
        document.listForm.submit();
    }
}

function fncAuthorGroupDeleteList() {

    if(!fncManageChecked()) return;

    if(confirm("삭제하시겠습니까?")) {
        document.listForm.action = "<c:url value='/sys/author/uam/AuthorGroupDelete.do'/>";
        document.listForm.submit();
    }
}

function linkPage(pageNo){
    //document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sys/author/uam/AuthorGroupManage.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorGroupPop() {

    if(document.listForm.searchCondition.value == '3') {
        window.open("<c:url value='/sys/author/gpm/GroupSearchList.do'/>","notice","height=690, width=600, top=50, left=20, scrollbars=no, resizable=no");
    } else {
        alert("그룹을 선택하세요.");
        return;
    }
}

function onSearchCondition() {
    if(document.listForm.searchCondition.value == '3') {
        document.listForm.searchKeyword.readOnly = true;
        fncSelectAuthorGroupPop();
    } else {
        document.listForm.searchKeyword.readOnly = false;
    }
}

function fnResetKeyword() {
	document.listForm.searchKeyword.value = "";
}
//-->
</script>

<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
            <form:form id="listForm" name="listForm" action="/sys/author/uam/AuthorGroupManage.do" method="post">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>시스템관리</li>
                            <li>권한관리</li>
                            <li class="last"><strong>회원별권한관리</strong></li>
                        </ul>
                    </div>
                </div>

                <div class="sub_tit_wrap">
                	<h2>회원별권한관리 <strong>목록</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                        <fieldset>
                            <legend>조건정보 영역</legend>
                            <div class="sf_start">
                                <ul class="search_form">
                                    <li>
                                        <label for="searchCondition" class="first">검색조건</label>
    					                <select id="searchCondition" name="searchCondition" onchange="fnResetKeyword()" title="조회조건" class="select_style1">
    					                    <option value="1" <c:if test="${authorGroupVO.searchCondition == '1'}">selected</c:if> >회원ID</option>
    					                    <option value="2" <c:if test="${authorGroupVO.searchCondition == '2'}">selected</c:if> >회원명</option>
    					                    <option value="3" <c:if test="${authorGroupVO.searchCondition == '3'}">selected</c:if> >그룹</option>
    					                </select>
        								<input name="searchKeyword" type="text" value="<c:out value='${authorGroupVO.searchKeyword}'/>" size="25" title="검색" onclick="onSearchCondition();" class="input_style1 input_w1"/>
                                        <%-- <a href="#LINK" onclick="javascript:fncSelectAuthorGroupPop()"><img src="<c:url value='/images/img_search.png' />" alt="search" /></a> --%>
                                    </li>
                                </ul>

                                <div class="search_btn_wrap">
                                	<a href="#LINK" onclick="javascript:fnSearch(); return false;" class="search_btn"><spring:message code="button.search" /></a>
                                </div>
                            </div>
                        </fieldset>
                </div>

                <!-- //검색 필드 박스 끝 -->
                ${custld:renderPageInfoWithoutExcel(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount(), 'Y')}
                <!-- table add start -->
                <div class="tablestyle_1">
                    <table summary="권한 그룹을 관리하는 테이블입니다.회원ID,회원명,회원유형,권한,등록 여부의 정보를 담고 있습니다.">
                    <caption>권한그룹관리</caption>
                    <colgroup>
                        <col width="5%" >
                        <col width="20%" >
                        <col width="20%" >
                        <col width="25%" >
                        <col width="20%" >
                        <col width="10%" >
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap"><input type="checkbox" name="checkAll" title="선택여부" class="check2" onclick="javascript:fncCheckAll()"></th>
                        <th scope="col" nowrap="nowrap">회원ID</th>
                        <th scope="col" nowrap="nowrap">회원명</th>
                        <th scope="col" nowrap="nowrap">소속기관</th>
                        <th scope="col" nowrap="nowrap">권한</th>
                        <th scope="col" nowrap="nowrap">등록 여부</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="authorGroup" items="${authorGroupList}" varStatus="status">
                    <!-- loop 시작 -->
                      <tr>
                        <td nowrap="nowrap"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${authorGroup.uniqId}"/>"/></td>
                        <td nowrap="nowrap"><c:out value="${authorGroup.userId}"/></td>
                        <td nowrap="nowrap"><c:out value="${authorGroup.userNm}"/></td>
                        <td nowrap="nowrap"><c:out value="${authorGroup.mberTyNm}"/><input type="hidden" name="mberTyCode" value="${authorGroup.mberTyCode}"/></td>
                        <td nowrap="nowrap">
                            <select name="authorManageCombo" title="권한" class="select_style1">
					            <c:forEach var="authorManage" items="${authorManageList}" varStatus="status">
					                <option value="<c:out value="${authorManage.authorCode}"/>" <c:if test="${authorManage.authorCode == authorGroup.authorCode}">selected</c:if> ><c:out value="${authorManage.authorNm}"/></option>
					            </c:forEach>
					        </select>
                        </td>
                        <td nowrap="nowrap"><c:out value="${authorGroup.regYn}"/><input type="hidden" name="regYn" value="<c:out value="${authorGroup.regYn}"/>"></td>
                      </tr>
                     </c:forEach>
                     <c:if test="${empty authorGroupList}">
                        <tr>
                            <td colspan="6"><spring:message code="common.nodata.msg" /></td>
                        </tr>
                     </c:if>
                    </tbody>
                    </table>
                </div>

                <!-- 페이지 네비게이션 시작 -->
                <c:if test="${!empty authorGroupVO.pageIndex }">
                    <div id="paging_div">
                        <ul class="paging_align">
					        <ui:pagination paginationInfo = "${paginationInfo}"
					            type="image"
					            jsFunction="linkPage"
					            />
                        </ul>
                    </div>

                    <div class="board_btn_wrap">
	                	<a href="#" class="board_btn" onclick="javascript:fncAddAuthorGroupInsert(); return false;">권한등록</a>
	                	<a href="#" class="board_btn del" onclick="javascript:fncAuthorGroupDeleteList(); return false;">등록취소</a>
	                </div>
                <!-- //페이지 네비게이션 끝 -->
                    <div align="right">
<%--                         <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/> --%>
                    </div>
                </c:if>
				<input type="hidden" name="userId"/>
				<input type="hidden" name="userIds"/>
				<input type="hidden" name="authorCodes"/>
				<input type="hidden" name="regYns"/>
				<input type="hidden" name="mberTyCodes"/>
				<input type="hidden" name="pageIndex" value="<c:out value='${authorGroupVO.pageIndex}'/>"/>
				</div>
            </form:form>