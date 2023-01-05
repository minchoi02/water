<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/sym/mpm/icon/";
  String imagePath_button = "/images/egovframework/sym/mpm/button/";
%>

<script type="text/javaScript">
<!--
/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.listForm.checkField;
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

/* ********************************************************
 * 멀티삭제 처리 함수
 ******************************************************** */
function fDeleteProgrmManageList() {
    var checkField = document.listForm.checkField;
    var ProgrmFileNm = document.listForm.checkProgrmFileNm;
    var checkProgrmFileNms = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkProgrmFileNms += ((checkedCount==0? "" : ",") + ProgrmFileNm[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkProgrmFileNms = ProgrmFileNm.value;
            }
        }
    }

    document.listForm.checkedProgrmFileNmForDel.value=checkProgrmFileNms;
    document.listForm.action = "<c:url value='/sys/menu/plm/ProgrmManageListDelete.do'/>";
    document.listForm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//  document.menuManageForm.searchKeyword.value =
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sys/menu/plm/ProgramListManage.do'/>";
    document.listForm.submit();
}
function fnExcel(){
	document.listForm.action = "<c:url value='/sys/menu/plm/ProgramListManageExcel.do'/>";
	document.listForm.submit();
}
/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertProgramListManage() {
    document.listForm.action = "<c:url value='/sys/menu/plm/ProgramListRegist.do'/>";
    document.listForm.submit();
}
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtProgramListDetail(progrmFileNm) {
    document.listForm.tmp_progrmNm.value = progrmFileNm;
    document.listForm.action = "<c:url value='/sys/menu/plm/ProgramListDetailSelectUpdt.do'/>";
    document.listForm.submit();
}
/* ********************************************************
 * focus 시작점 지정함수
 ******************************************************** */
 function fn_FocusStart(){
        var objFocus = document.getElementById('F1');
        objFocus.focus();
    }

<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
            <form name="listForm" action ="<c:url value='/sys/menu/plm/ProgramListManage.do'/>" method="post">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>시스템관리</li>
                            <li>메뉴관리</li>
                            <li class="last"><strong>프로그램관리</strong></li>
                        </ul>
                    </div>
                </div>

				<div class="sub_tit_wrap">
                	<h2>프로그램관리 <strong>목록</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
					<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
					<input name="checkedProgrmFileNmForDel" type="hidden" />
                        <fieldset><legend>조건정보 영역</legend>
                        <div class="sf_start">
                            <ul class="search_form">
                                <li>
                                    <label for="searchKeyword" class="first">프로그램 한글명</label>
                                    <input name="searchKeyword" type="text" size="60" value="<c:out value='${searchVO.searchKeyword}'/>"  maxlength="60" id="F1" title="검색조건" class="input_style1 input_w1" >
                                </li>
                            </ul>

                            <div class="search_btn_wrap">
                            	<a href="#LINK" onclick="javascript:fnSearch(); return false;" class="search_btn"><spring:message code="button.search" /></a>
                            </div>
                        </div>
                        </fieldset>
                </div>
                <!-- //검색 필드 박스 끝 -->
                ${custld:renderPageInfo(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount())}
                <!-- table add start -->
                <div class="tablestyle_1">
                    <table summary="프로그램목록관리 목록으로 프로그램파일명, 프로그램명, url,프로그램설명 으로 구성">
                    <caption>프로그램목록관리 목록</caption>
                    <colgroup>
                        <col width="3%" >
                        <col width="20%" >
                        <col width="20%" >
                        <col width="40%" >
                        <col width="17%" >
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fCheckAll();" title="전체선택"></th>
                        <th scope="col" nowrap="nowrap">프로그램파일명</th>
                        <th scope="col" nowrap="nowrap">프로그램 한글명</th>
                        <th scope="col" nowrap="nowrap">URL</th>
                        <th scope="col" nowrap="nowrap">프로그램설명</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="result" items="${list_progrmmanage}" varStatus="status">
                    <!-- loop 시작 -->
                      <tr>
					    <td nowrap="nowrap">
					       <input type="checkbox" name="checkField" class="check2" title="선택">
					       <input name="checkProgrmFileNm" type="hidden" value="<c:out value='${result.progrmFileNm}'/>"/>
					    </td>
					    <td style="cursor:hand;" nowrap="nowrap">
					            <span class="link"><a href="<c:url value='/sys/menu/plm/ProgramListDetailSelectUpdt.do'/>?tmp_progrmNm=<c:out value="${result.progrmFileNm}"/>"  onclick="selectUpdtProgramListDetail('<c:out value="${result.progrmFileNm}"/>'); return false;"><c:out value="${result.progrmFileNm}"/></a></span>
					    </td>
					    <td nowrap="nowrap"><c:out value="${result.progrmKoreanNm}"/></td>
					    <td nowrap="nowrap"><c:out value="${result.url}"/></td>
					    <td nowrap="nowrap"><c:out value="${result.progrmDc}"/></td>
                      </tr>
                     </c:forEach>
                     <c:if test="${fn:length(list_progrmmanage) == 0}">
                        <tr>
	                        <td class="listCenter" colspan="5" ><spring:message code="common.nodata.msg" /></td>
			          	</tr>
				    </c:if>
                    </tbody>
                    </table>
                </div>

                <!-- 페이지 네비게이션 시작 -->
                <div id="paging_div">
                    <ul class="paging_align">
                        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/>
                    </ul>
                </div>

                <div class="board_btn_wrap">
                	<a href="#" class="board_btn" onclick="insertProgramListManage(); return false;"><spring:message code="button.create" /></a>
                	<a href="#" class="board_btn del" onclick="fDeleteProgrmManageList(); return false;"><spring:message code="button.delete" /></a>
                </div>
                <!-- //페이지 네비게이션 끝 -->
				<input type="hidden" name="cmd">
				<input type="hidden" name="tmp_progrmNm">
				</div>
            </form>