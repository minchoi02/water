<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<c:url var="ImgUrl" value="/images"/>

<script type="text/javaScript">
<!--
/* ********************************************************
 * 초기화
 ******************************************************** */
function fnInit(){
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fnList(){
    document.Form.action = "<c:url value='/sys/code/hcm/CcmCmmnCodeList.do'/>";
    document.Form.submit();
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fnModify(){
    var varForm              = document.all["Form"];
    varForm.action           = "<c:url value='/sys/code/lcm/CcmCmmnDetailCodeModify.do'/>";
    varForm.codeId.value     = "${result.codeId}";
    varForm.code.value       = "${result.code}";
    varForm.cmd.value        = "Modify";
    varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fnDelete(){
    if (confirm("<spring:message code='common.delete.msg'/>")) {
        var varForm              = document.all["Form"];
        varForm.action           = "<c:url value='/sys/code/lcm/CcmCmmnDetailCodeRemove.do'/>";
        varForm.codeId.value     = "${result.codeId}";
        varForm.code.value       = "${result.code}";
        varForm.submit();
    }
}
//-->
</script>

<main id="contents">
    <div class="content-wrap">
        <h2 class="hidden">컨텐츠영역</h2>
        <!-- panel -->
        <section class="panel-wrap">
            <div class="panel-header">
                <h3>상세코드관리 <strong>상세</strong></h3>
            </div>
            <form name="Form" method="post" action="<c:url value='/sys/code/lcm/CcmCmmnDetailCodeList.do'/>">
                <input type="hidden" name="codeId">
                <input type="hidden" name="code">
                <div class="panel-body">
                    <div style="float: right;">
                       <span class="red font-md ml10">*</span>표기는 필수 입력사항
                    </div>
                    <div class="table-box table-row y-scroll content-height-6">
                         <table>
                             <colgroup>
                                 <col style="width:300px;">
                                 <col style="width:auto;">
                             </colgroup>
                             <tbody>
                                 <tr>
                                     <th scope="row"><span>코드ID명</span></th>
                                     <td>${result.codeIdNm}</td>
                                 </tr>
                                 <tr>
                                     <th scope="row"><span>코드</span></th>
                                     <td>${result.code}</td>
                                 </tr>
                                 <tr>
                                     <th scope="row"><span>코드명</span></th>
                                     <td>${result.codeNm}</td>
                                 </tr>
                                 <tr>
                                     <th scope="row"><span>코드설명</span></th>
                                     <td><textarea cols="100" rows="5" disabled="disabled" id="codeIdDc" >${result.codeDc}</textarea></td>
                                 </tr>
                                 <tr>
                                     <th scope="row"><span>순번</span></th>
                                     <td>${result.ordr}</td>
                                 </tr>
                                 <tr>
                                     <th scope="row"><span>사용여부</span></th>
                                     <td>
                                        <select name="useAt" disabled id="useAt" class="col-1">
                                            <option value="Y" <c:if test="${result.useAt == 'Y'}">selected="selected"</c:if> >Yes</option>
                                            <option value="N" <c:if test="${result.useAt == 'N'}">selected="selected"</c:if> >No</option>
                                        </select>
                                     </td>
                                 </tr>
                             </tbody>
                         </table>
                     </div>
                </div>

                <div class="panel-footer">
                    <div class="btn-area">
                        <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fnModify(); return false;">수정</button>
                        <button type="button" class="btn btn-default btn-lg" onclick="javascript:fnDelete(); return false;">삭제</button>
                        <button type="button" class="btn btn-default btn-lg" onclick="javascript:fnList(); return false;">목록</button>
                    </div>
                </div>

                <!-- 검색조건 유지 -->
                <input name="cmd" type="hidden" value="<c:out value='save'/>"/>
                <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
                <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
                <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/><c:if test="${searchVO.pageIndex eq null}">1</c:if>"/>
            </form>
        </section>
    </div>
</main>

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
<!--                 	<h2>상세코드관리 <strong>상세</strong></h2> -->
<!--                 </div> -->
<!--                 <div id="sub_con_wrap"> -->
<%--                 <form name="Form" method="post" action="<c:url value='/sys/code/lcm/CcmCmmnDetailCodeList.do'/>"> --%>
<!-- 				    <input type="hidden" name="codeId"> -->
<!-- 				    <input type="hidden" name="code"> -->

<!-- 				    <div class="info_txt1"> -->
<!-- 	                	<span>*</span>표기는 필수 입력사항 -->
<!-- 	                </div> -->
<!--                     <div class="tablestyle_2" > -->
<!--                         <table summary="코드ID명, 코드, 코드명, 코드설명, 사용여부가 나타나 있는 공통상세코드 상세조회 테이블이다."> -->
<!-- 						  <tr> -->
<!-- 						    <th scope="col" class="essential"><span>코드ID명</span></th> -->
<%-- 						    <td>${result.codeIdNm}</td> --%>
<!-- 						  </tr> -->
<!-- 						  <tr> -->
<!-- 						    <th scope="col" class="essential"><span>코드</span></th> -->
<%-- 						    <td>${result.code}</td> --%>
<!-- 						  </tr> -->
<!-- 						  <tr> -->
<!-- 						    <th scope="col" class="essential"><span>코드명</span></th> -->
<%-- 						    <td>${result.codeNm}</td> --%>
<!-- 						  </tr> -->
<!-- 						  <tr> -->
<!-- 						    <th scope="col" class="essential"><span>코드설명</span></th> -->
<%-- 						    <td><textarea class="input_style1 input_w3 input_h1"  cols="100" rows="5" disabled="disabled" id="codeDc">${result.codeDc}</textarea></td> --%>
<!-- 						  </tr> -->
<!-- 						  <tr> -->
<!-- 						  	<th scope="col">순번</th> -->
<%-- 						  	<td>${result.ordr}</td> --%>
<!-- 						  </tr> -->
<!-- 						  <tr> -->
<!-- 						    <th scope="col" class="essential"><span>사용여부</span></th> -->
<!-- 						    <td> -->
<!-- 						        <select name="useAt" id="useAt" class="select_style1"> -->
<%-- 						            <option value="Y" <c:if test="${result.useAt == 'Y'}">selected="selected"</c:if> >Yes</option> --%>
<%-- 						            <option value="N" <c:if test="${result.useAt == 'N'}">selected="selected"</c:if> >No</option> --%>
<!-- 						        </select> -->
<!-- 						    </td> -->
<!-- 						  </tr> -->
<!--                         </table> -->
<!--                     </div> -->

                    <!-- 버튼 시작(상세지정 style로 div에 지정) -->
<!--                     <div class="board_btn_wrap"> -->
<%--                 		<a href="#LINK" onclick="javascript:fnModify(); return false;" class="board_btn"><spring:message code="button.update" /></a> --%>
<%--                 		<a href="#LINK" onclick="javascript:fnDelete(); return false;" class="board_btn del"><spring:message code="button.delete" /></a> --%>
<%--                 		<a href="#LINK" onclick="javascript:fnList(); return false;" class="board_btn"><spring:message code="button.list" /></a> --%>
<!-- 	                </div> -->
                    <!-- 버튼 끝 -->

                    <!-- 검색조건 유지 -->
<%--                     <input name="cmd" type="hidden" value="<c:out value='save'/>"/> --%>
<%--                     <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/> --%>
<%-- 			        <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/> --%>
<%-- 			        <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/><c:if test="${searchVO.pageIndex eq null}">1</c:if>"/> --%>
                    <!-- 검색조건 유지 -->
<%--                 </form> --%>
<!-- 			</div> -->