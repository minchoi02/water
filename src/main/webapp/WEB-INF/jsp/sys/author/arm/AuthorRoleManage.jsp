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
                alert("?????????  ?????? ????????????.");
                returnBoolean = false;
            }
        } else {
             if(document.listForm.delYn.checked == false) {
                alert("????????? ?????? ????????????.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnRegYns = checkRegYn.value;

                returnBoolean = true;
            }
        }
    } else {
        alert("????????? ????????? ????????????.");
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
        if(confirm("?????????????????????????")) {
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
                            <li>???????????????</li>
                            <li>????????????</li>
                            <li class="last"><strong>?????? ??????</strong></li>
                        </ul>
                    </div>
                </div>

                <div class="sub_tit_wrap">
                	<h2>?????? ??????????????? <strong>??????</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <!-- ?????? ?????? ?????? ?????? -->
                <div id="search_field">

                        <fieldset><legend>???????????? ??????</legend>
                        <div class="sf_start">
                            <ul class="search_form">
                                <li>
                                	<label for="searchKeyword" class="first">????????????</label>
                                    <input id="searchKeyword" name="searchKeyword" type="text" size="30" value="<c:out value='${authorRoleManageVO.searchKeyword}'/>" title="??????"  readonly="readonly" class="input_style1 input_w1"/>
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
                    <table summary="?????? ?????? ???????????? ??????????????????.??? ID,??? ???,??? ??????,??? Sort,??? ??????,????????????,??????????????? ????????? ?????? ????????????.">
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
                        <th scope="col" class="f_field" nowrap="nowrap"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="????????????"></th>
                        <th scope="col" nowrap="nowrap">??? ID</th>
                        <th scope="col" nowrap="nowrap">??? ???</th>
<!--                         <th scope="col" nowrap="nowrap">??? ??????</th> -->
                        <th scope="col" nowrap="nowrap">??? Sort</th>
                        <th scope="col" nowrap="nowrap">??? ??????</th>
                        <th scope="col" nowrap="nowrap">????????????</th>
                        <th scope="col" nowrap="nowrap">????????????</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="authorRole" items="${authorRoleList}" varStatus="status">
                    <!-- loop ?????? -->
                      <tr>
					    <td nowrap="nowrap"><input type="checkbox" name="delYn" class="check2" title="??????"><input type="hidden" name="checkId" value="<c:out value="${authorRole.roleCode}"/>" /></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleCode}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleNm}"/></td>
<%-- 					    <td nowrap="nowrap"><c:out value="${authorRole.roleTyp}"/></td> --%>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleSort}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleDc}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.creatDt}"/></td>
					    <td nowrap="nowrap">
					        <select name="regYn" title="????????????" class="select_style1 input_w4">
					            <option value="Y" <c:if test="${authorRole.regYn == 'Y'}">selected</c:if> >??????</option>
					            <option value="N" <c:if test="${authorRole.regYn == 'N'}">selected</c:if> >?????????</option>
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

                <!-- ????????? ??????????????? ?????? -->
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
	                	<a href="#" class="board_btn" onclick="javascript:fncSelectAuthorList(); return false;">????????????</a>
	                </div>
                <!-- //????????? ??????????????? ??? -->
				    <div align="right">
<%-- 				        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="?????????"/> --%>
				    </div>
                </c:if>
				<input type="hidden" name="roleCodes"/>
				<input type="hidden" name="regYns"/>
				<input type="hidden" name="pageIndex" value="<c:out value='${authorRoleManageVO.pageIndex}'/>"/>
				<input type="hidden" name="authorCode" value="<c:out value="${authorRoleManageVO.searchKeyword}"/>"/>
				<input type="hidden" name="searchCondition"/>
				</div>
           </form:form>
