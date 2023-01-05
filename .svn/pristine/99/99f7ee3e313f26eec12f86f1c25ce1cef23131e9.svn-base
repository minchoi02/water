<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<script type="text/javaScript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sys/code/lcm/CcmCmmnDetailCodeList.do'/>";
    document.listForm.submit();
}
/* ********************************************************
 * 조회 처리
 ******************************************************** */
function fnExcel(){
	document.listForm.action = "<c:url value='/sys/code/lcm/CcmCmmnDetailCodeListExcel.do'/>";
	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fnRegist(){
    document.listForm.action = "<c:url value='/sys/code/lcm/CcmCmmnDetailCodeRegist.do'/>";
	document.listForm.submit();
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fnModify(){
    location.href = "";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fnDetail(codeId, code){
    document.listForm.action           = "<c:url value='/sys/code/lcm/CcmCmmnDetailCodeDetail.do'/>";
    document.listForm.codeId.value     = codeId;
    document.listForm.code.value       = code;
    document.listForm.submit();
}
<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
//-->
</script>

<main id="contents">
    <div class="content-wrap">
        <h2 class="hidden">컨텐츠영역</h2>
            <!-- panel -->
            <section class="panel-wrap">
            <div class="panel-header">
<!--                         <h3>테이블</h3> -->
                <h3>상세코드관리 <strong>목록</strong></h3>
            </div>
               <div class="panel-body">
                   <form name="listForm" action="<c:url value='/sys/code/lcm/CcmCmmnDetailCodeList.do'/>" method="post">
                        <div class="search-area">
			                <input type=hidden name="codeId">
			                <input type=hidden name="code">

                            <label for="searchCondition" class="hidden" style="margin: 10px; font-size: 2rem;">검색조건</label>
                            <select id="searchCondition" name="searchCondition" title="검색조건 선택">
                                <option selected value=''>-선택하세요-</option>
                                <option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>코드ID</option>
                                <option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>코드</option>
                                <option value='3' <c:if test="${searchVO.searchCondition == '3'}">selected="selected"</c:if>>코드명</option>
                            </select>
        <!--                                 <input type="text" id="Search" placeholder="검색어를 입력하세요." /> -->
                            <input type="text" id="searchKeyword" name="searchKeyword" size="35" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="35" title="검색어 입력"/>
                            <button type="submit" class="btn btn-secondary" onclick="javascript:fnSearch(); return false;">검색</button>
                        </div>
                        <div class="table-header">
                           <div>총&nbsp<strong class="secondary">${paginationInfo.totalRecordCount}</strong>건이 검색 되었습니다.</div>
                           <div>
	                           <select id='recordCountPerPage' name='recordCountPerPage' onchange='fnSearch();'>
	                               <option value='10' selected>10개</option>
	                               <option value='30'>30개</option>
	                               <option value='50'>50개</option>
	                           </select>
                           </div>
                        </div>
<%--                     ${custld:renderPageInfoWithoutExcel(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount(), 'Y')} --%>
<%--                    </form> --%>
                <div class="table-box y-scroll content-height-4">
                    <table>
<%--                            <caption>테이블 기본</caption> --%>
                        <colgroup>
		                    <col width="10%" >
		                    <col width="20%" >
		                    <col width="20%" >
		                    <col width="30%" >
		                    <col width="10%" >
		                    <col width="10%" >
                        </colgroup>
                        <thead>
                            <tr>
		                        <th scope="col" nowrap="nowrap">번호</th>
		                        <th scope="col" nowrap="nowrap">코드ID</th>
		                        <th scope="col" nowrap="nowrap">코드</th>
		                        <th scope="col" nowrap="nowrap">코드명</th>
		                        <th scope="col" nowrap="nowrap">순번</th>
		                        <th scope="col" nowrap="nowrap">사용여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
                                <!-- loop 시작 -->
			                    <tr style="cursor:pointer;cursor:hand;" onclick="javascript:fnDetail('${resultInfo.codeId}','${resultInfo.code}');">
			                        <td nowrap="nowrap"><c:out value="${(searchVO.pageIndex - 1) * searchVO.recordCountPerPage + status.count}"/></td>
			                        <td nowrap="nowrap">${resultInfo.codeId}</td>
			                        <td nowrap="nowrap">${resultInfo.code}</td>
			                        <td nowrap="nowrap">${resultInfo.codeNm}</td>
			                        <td nowrap="nowrap">${resultInfo.ordr}</td>
			                        <td nowrap="nowrap"><c:if test="${resultInfo.useAt == 'Y'}">사용</c:if><c:if test="${resultInfo.useAt == 'N'}">미사용</c:if></td>
                                </tr>
                                </c:forEach>
                                <c:if test="${fn:length(resultList) == 0}">
                                    <tr>
                                        <td colspan=4>
                                            <spring:message code="common.nodata.msg" />
                                        </td>
                                    </tr>
                                </c:if>
                            </tr>
                        </tbody>
                    </table>
                </div>
                </form>
            </div>

            <div class="panel-footer">
                <div class="page">
                    <ul>
                        <li><a href="#"><i class="fas fa-angle-left"></i></a></li>
                        <li>
                            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_select_noticeList" />
                        </li>
                        <li><a href="#"><i class="fas fa-angle-right"></i></a></li>
                    </ul>
                </div>
                <div class="btn-area">
                    <button type="button" class="btn btn-primary btn-lg" onclick="fnRegist(); return false;">등록</button>
                </div>
            </div>
        </section>
    </div>
</main>

<%--             <form name="listForm" action="<c:url value='/sys/code/lcm/CcmCmmnDetailCodeList.do'/>" method="post"> --%>
<!--             	<input type=hidden name="codeId"> -->
<!--                 <input type=hidden name="code"> -->

<!--                 <div id="cur_loc"> -->
<!--                     <div id="cur_loc_align"> -->
<!--                         <ul> -->
<!--                             <li>HOME</li> -->
<!--                             <li>시스템관리</li> -->
<!--                             <li>코드관리</li> -->
<!--                             <li class="last"><strong>상세코드관리</strong></li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 <div class="sub_tit_wrap"> -->
<!--                 	<h2>상세코드관리 <strong>목록</strong></h2> -->
<!--                 </div> -->
<!--                 <div id="sub_con_wrap"> -->
                <!-- 검색 필드 박스 시작 -->
<!--                 <div id="search_field"> -->

<!--                         <fieldset><legend>조건정보 영역</legend> -->
<!--                         <div class="sf_start"> -->
<!--                             <ul class="search_form"> -->
<!--                                 <li> -->
<!--                                 	<label for="searchCondition" class="first">검색조건</label> -->
<!-- 							        <select name="searchCondition" title="searchCondition" class="select_style1"> -->
<!-- 							           <option selected value=''>-선택하세요-</option> -->
<%-- 							           <option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>코드ID</option> --%>
<%-- 							           <option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>코드</option> --%>
<%-- 							           <option value='3' <c:if test="${searchVO.searchCondition == '3'}">selected="selected"</c:if>>코드명</option> --%>
<!-- 							        </select> -->
<%--                                     <input name="searchKeyword" type="text" size="35" value="${searchVO.searchKeyword}"  maxlength="35" id="searchKeyword" class="input_style1 input_w1" > --%>
<!--                                 </li> -->
<!--                             </ul> -->

<!--                             <div class="search_btn_wrap"> -->
<%--                             	<a href="#LINK" onclick="javascript:fnSearch(); return false;" class="search_btn"><spring:message code="button.search" /></a> --%>
<!--                             </div> -->
<!--                         </div> -->
<!--                         </fieldset> -->
<!--                 </div> -->
                <!-- //검색 필드 박스 끝 -->
<%--                 ${custld:renderPageInfo(paginationInfo.getRecordCountPerPage(), paginationInfo.getTotalRecordCount())} --%>
                <!-- table add start -->
<!--                 <div class="tablestyle_1"> -->
<!--                     <table summary="코드ID, 코드, 코드명, 사용여부를 나타내는 공통상세코드 목록 테이블이다."> -->
<%--                     <caption>공통상세코드 목록</caption> --%>
<%--                     <colgroup> --%>
<%--                     <col width="10%" > --%>
<%--                     <col width="20%" > --%>
<%--                     <col width="20%" > --%>
<%--                     <col width="30%" > --%>
<%--                     <col width="10%" > --%>
<%--                     <col width="10%" > --%>
<%--                     </colgroup> --%>
<!--                     <thead> -->
<!--                     <tr> -->
<!--                         <th scope="col" nowrap="nowrap">번호</th> -->
<!--                         <th scope="col" nowrap="nowrap">코드ID</th> -->
<!--                         <th scope="col" nowrap="nowrap">코드</th> -->
<!--                         <th scope="col" nowrap="nowrap">코드명</th> -->
<!--                         <th scope="col" nowrap="nowrap">순번</th> -->
<!--                         <th scope="col" nowrap="nowrap">사용여부</th> -->
<!--                     </tr> -->
<!--                     </thead> -->
<!--                     <tbody> -->

<%--                     <c:forEach items="${resultList}" var="resultInfo" varStatus="status"> --%>
                    <!-- loop 시작 -->
<%-- 						<tr style="cursor:pointer;cursor:hand;" onclick="javascript:fnDetail('${resultInfo.codeId}','${resultInfo.code}');"> --%>
<%-- 						    <td nowrap="nowrap"><c:out value="${(searchVO.pageIndex - 1) * searchVO.recordCountPerPage + status.count}"/></td> --%>
<%-- 						    <td nowrap="nowrap">${resultInfo.codeId}</td> --%>
<%-- 						    <td nowrap="nowrap">${resultInfo.code}</td> --%>
<%-- 						    <td nowrap="nowrap">${resultInfo.codeNm}</td> --%>
<%-- 						    <td nowrap="nowrap">${resultInfo.ordr}</td> --%>
<%-- 						    <td nowrap="nowrap"><c:if test="${resultInfo.useAt == 'Y'}">사용</c:if><c:if test="${resultInfo.useAt == 'N'}">미사용</c:if></td> --%>
<!-- 						</tr> -->
<%--                     </c:forEach> --%>
<%--                     <c:if test="${fn:length(resultList) == 0}"> --%>
<!--                         <tr> -->
<!--                             <td colspan=6> -->
<%--                                 <spring:message code="common.nodata.msg" /> --%>
<!--                             </td> -->
<!--                         </tr> -->
<%--                     </c:if> --%>
<!--                     </tbody> -->
<!--                     </table> -->
<!--                 </div> -->

                <!-- 페이지 네비게이션 시작 -->
<!--                 <div id="paging_div"> -->
<!--                     <ul class="paging_align"> -->
<%-- 				        <ui:pagination paginationInfo = "${paginationInfo}" --%>
<%-- 				                type="image" --%>
<%-- 				                jsFunction="linkPage" --%>
<%-- 				                /> --%>
<!--                     </ul> -->
<!--                 </div> -->

<!--                 <div class="board_btn_wrap"> -->
<%--                 	<a href="#" class="board_btn" onclick="fnRegist(); return false;"><spring:message code="button.create" /></a> --%>
<!--                 </div> -->
                <!-- //페이지 네비게이션 끝 -->
<!-- 				</div> -->
<%--                 <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/> --%>
<%--             </form> --%>

<%--             <form name="Form" action="" method="post" > --%>
<!--                 <input type=hidden name="codeId"> -->
<!--                 <input type=hidden name="code"> -->
<%--                 <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/> --%>
<!--                 <input type="submit" class="invisible"/> -->
<%--             </form> --%>