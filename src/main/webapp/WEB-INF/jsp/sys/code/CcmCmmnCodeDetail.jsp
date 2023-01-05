<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<c:url var="ImgUrl" value="/images"/>

<link href="<c:url value='/css/button.css' />" rel="stylesheet" type="text/css">
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
    varForm.action           = "<c:url value='/sys/code/hcm/CcmCmmnCodeModify.do'/>";
    varForm.codeId.value     = "${result.codeId}";
    varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fnDelete(){
    if (confirm("<spring:message code='common.delete.msg'/>")) {
        var varForm              = document.all["Form"];
        varForm.action           = "<c:url value='/sys/code/hcm/CcmCmmnCodeRemove.do'/>";
        varForm.codeId.value     = "${result.codeId}";
        varForm.submit();
    }
}
//-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>공통 코드 수정</h3>
    </div>
    <div class="panel-body">
        <div class="table-box table-row table-col-6 y-scroll content-height-1">
            <table>
                <caption>공통 코드 수정</caption>
                <colgroup>
                    <col style="width:300px;">
                    <col style="width:auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">코드 ID</th>
                        <td>
                            <div>
                                <input type="text" value="${result.codeId}" readonly=true/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">코드명</th>
                        <td>
                            <div>
                                <input type="text" placeholder="입력하세요." />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">코드 설명</th>
                        <td>
                            <div>
                                <input type="text" placeholder="입력하세요." />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">정렬 순번</th>
                        <td>
                            <div class="col-1">
                                <input type="text" placeholder="입력하세요." />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">상위 코드 등록</th>
                        <td class="flex">
                            <div class="label-input">
                                <label><input type="radio" />Yes</label>
                                <label><input type="radio" />No</label>
                                <input type="text" placeholder="입력하세요." />
                                <button type="button" class="btn btn-default" data-bs-toggle="modal" data-bs-target="#modal-find">찾기</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">사용 여부</th>
                        <td class="flex">
                            <div class="label-input">
                                <label><input type="radio" />사용</label>
                                <label><input type="radio" />미사용</label>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg">등록</button>
            <button type="button" class="btn btn-default btn-lg">목록</button>
        </div>
    </div>
</section>
<!-- panel -->
    <!-- modal -->
    <div class="modal fade" id="modal-find" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h3>상위 코드</h3>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="tree-area">
                    코드 tree
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-area">
                        <button type="button" class="btn btn-primary btn-lg">선택</button>
                        <button type="button" class="btn btn-default btn-lg" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- modal -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>

<!-- <main id="contents"> -->
<!--     <div class="content-wrap"> -->
<!--         <h2 class="hidden">컨텐츠영역</h2> -->
        <!-- panel -->
<!--         <section class="panel-wrap"> -->
<!--             <div class="panel-header"> -->
<!--                 <h3>공통코드관리 <strong>상세</strong></h3> -->
<!--             </div> -->
<%--             <form:form name="Form" method="post" action="<c:url value='/sys/code/hcm/CcmCmmnCodeModify.do'/>"> --%>
<!--                 <div class="panel-body"> -->
<!--                     <div style="float: right;"> -->
<!--                        <span class="red font-md ml10">*</span>표기는 필수 입력사항 -->
<!--                     </div> -->
<!--                     <div class="table-box table-row y-scroll content-height-6"> -->
<!--                          <table> -->
<%--                              <colgroup> --%>
<%--                                  <col style="width:300px;"> --%>
<%--                                  <col style="width:auto;"> --%>
<%--                              </colgroup> --%>
<!--                              <tbody> -->
<!--                                  <tr> -->
<!--                                      <th scope="row"><span>코드ID</span></th> -->
<%--                                      <td>${result.codeId}</td> --%>
<!--                                  </tr> -->
<!--                                  <tr> -->
<!--                                      <th scope="row"><span>코드명</span></th> -->
<%--                                      <td>${result.codeIdNm}</td> --%>
<!--                                  </tr> -->
<!--                                  <tr> -->
<!--                                      <th scope="row"><span>코드설명</span></th> -->
<%--                                      <td><textarea cols="100" rows="5" disabled="disabled" id="codeIdDc" >${result.codeIdDc}</textarea></td> --%>
<!--                                  </tr> -->
<!--                                  <tr> -->
<!--                                      <th scope="row"><span>사용여부</span></th> -->
<!--                                      <td> -->
<!-- 		                                <select name="useAt" disabled id="useAt" class="col-1"> -->
<%-- 		                                    <option value="Y" <c:if test="${result.useAt == 'Y'}">selected="selected"</c:if> >Yes</option> --%>
<%-- 		                                    <option value="N" <c:if test="${result.useAt == 'N'}">selected="selected"</c:if> >No</option> --%>
<!-- 		                                </select> -->
<!--                                      </td> -->
<!--                                  </tr> -->
<!--                              </tbody> -->
<!--                          </table> -->
<!--                      </div> -->
<!--                 </div> -->

<!--                 <div class="panel-footer"> -->
<!--                     <div class="btn-area"> -->
<!--                         <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fnModify(); return false;">수정</button> -->
<!--                         <button type="button" class="btn btn-default btn-lg" onclick="javascript:fnDelete(); return false;">삭제</button> -->
<!--                         <button type="button" class="btn btn-default btn-lg" onclick="javascript:fnList(); return false;">목록</button> -->
<!--                     </div> -->
<!--                 </div> -->

                <!-- 검색조건 유지 -->
<!--                 <input name="codeId" type="hidden"> -->
<%--                 <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/> --%>
<%--                 <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/> --%>
<%--                 <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/><c:if test="${searchVO.pageIndex eq null}">1</c:if>"/> --%>
<%--             </form:form> --%>
<!--         </section> -->
<!--     </div> -->
<!-- </main> -->
