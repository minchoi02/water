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
    var checkRegYn = document.listForm.regYn;
    var returnValue = "";
    var returnRegYns = "";
    var checkedCount = 0;
    var returnBoolean = false;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedCount++;
                    checkField[i].value = checkId[i].value;

                    if(returnValue == "") {
                        returnValue = checkField[i].value;
                        returnRegYns = checkRegYn[i].value;
                    }
                    else {
                        returnValue = returnValue + ";" + checkField[i].value;
                        returnRegYns = returnRegYns + ";" + checkRegYn[i].value;
                    }
                }
            }

            if(checkedCount > 0)
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
                returnRegYns = checkRegYn.value;

                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.roleCodes.value = returnValue;
    document.listForm.regYns.value = returnRegYns;

    return returnBoolean;

}

function fncSelectAuthorList(){
    document.listForm.searchKeyword.value = "";
    document.listForm.action = "<c:url value='/sys/author/arm/AuthorManage.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorRole(roleCode) {
    document.listForm.roleCode.value = roleCode;
    document.listForm.action = "<c:url value='/sys/author/arm/Role.do'/>";
    document.listForm.submit();
}

function fncAddAuthorRoleInsert() {
    if(fncManageChecked()) {
        if(confirm("등록하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sys/author/arm/AuthorRoleInsert.do'/>";
            document.listForm.submit();
        }
    } else return;
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sys/author/arm/AuthorRoleManage.do'/>";
    document.listForm.submit();
}
//-->
</script>
            <form:form name="listForm" action="/sys/author/arm/AuthorRoleManage.do" method="post">
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
                	<h2>권한 프로그램롤 <strong>관리</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">

                        <fieldset><legend>조건정보 영역</legend>
                        <div class="sf_start">
                            <ul class="search_form">
                                <li>
                                	<label for="searchKeyword" class="first">권한코드</label>
                                    <input id="searchKeyword" name="searchKeyword" type="text" size="30" value="<c:out value='${authorRoleManageVO.searchKeyword}'/>" title="검색"  readonly="readonly" class="input_style1 input_w1"/>
                                </li>
                            </ul>

                            <div class="search_btn_wrap">
                           </div>
                        </div>
                        </fieldset>
                </div>

                ${custld:renderPageInfo(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount())}
                <!-- table add start -->
                <div class="tablestyle_1">
                    <table summary="권한 롤을 관리하는 테이블입니다.롤 ID,롤 명,롤 타입,롤 Sort,롤 설명,등록일자,등록여부의 내용을 담고 있습니다.">
                    <caption></caption>
                    <colgroup>
                    <col width="5%" >
                    <col width="10%" >
                    <col width="20%" >
<%--                     <col width="10%" > --%>
                    <col width="5%" >
                    <col width="30%" >
                    <col width="15%" >
                    <col width="10%" >
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택"></th>
                        <th scope="col" nowrap="nowrap">롤 ID</th>
                        <th scope="col" nowrap="nowrap">롤 명</th>
<!--                         <th scope="col" nowrap="nowrap">롤 타입</th> -->
                        <th scope="col" nowrap="nowrap">롤 Sort</th>
                        <th scope="col" nowrap="nowrap">롤 설명</th>
                        <th scope="col" nowrap="nowrap">등록일자</th>
                        <th scope="col" nowrap="nowrap">등록여부</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="authorRole" items="${authorRoleList}" varStatus="status">
                    <!-- loop 시작 -->
                      <tr>
					    <td nowrap="nowrap"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${authorRole.roleCode}"/>" /></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleCode}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleNm}"/></td>
<%-- 					    <td nowrap="nowrap"><c:out value="${authorRole.roleTyp}"/></td> --%>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleSort}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleDc}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.creatDt}"/></td>
					    <td nowrap="nowrap">
					        <select name="regYn" title="등록여부" class="select_style1 input_w4">
					            <option value="Y" <c:if test="${authorRole.regYn == 'Y'}">selected</c:if> >등록</option>
					            <option value="N" <c:if test="${authorRole.regYn == 'N'}">selected</c:if> >미등록</option>
					        </select>
					    </td>
                      </tr>
                     </c:forEach>
                     <c:if test="${fn:length(authorRoleList) == 0}">
                        <tr>
	                        <td class="listCenter" colspan="7" ><spring:message code="common.nodata.msg" /></td>
			          	</tr>
				    </c:if>
                    </tbody>
                    </table>
                </div>

                <!-- 페이지 네비게이션 시작 -->
                <c:if test="${!empty authorRoleManageVO.pageIndex }">
                    <div id="paging_div">
                        <ul class="paging_align">
					        <ui:pagination paginationInfo = "${paginationInfo}"
					            type="image"
					            jsFunction="linkPage"
					            />
                        </ul>
                    </div>

	                <div class="board_btn_wrap">
	                	<a href="#" class="board_btn" onclick="javascript:fncAddAuthorRoleInsert(); return false;"><spring:message code="button.save" /></a>
	                	<a href="#" class="board_btn" onclick="javascript:fncSelectAuthorList(); return false;">권한목록</a>
	                </div>
                <!-- //페이지 네비게이션 끝 -->
				    <div align="right">
<%-- 				        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/> --%>
				    </div>
                </c:if>
				<input type="hidden" name="roleCodes"/>
				<input type="hidden" name="regYns"/>
				<input type="hidden" name="pageIndex" value="<c:out value='${authorRoleManageVO.pageIndex}'/>"/>
				<input type="hidden" name="authorCode" value="<c:out value="${authorRoleManageVO.searchKeyword}"/>"/>
				<input type="hidden" name="searchCondition"/>
				</div>
           </form:form>
