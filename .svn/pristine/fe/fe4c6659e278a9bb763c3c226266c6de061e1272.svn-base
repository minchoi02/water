<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
 /**
  * @Class Name : EgovCommentList.jsp
  * @Description : 댓글
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.06.29   한성곤          최초 생성
  *
  *  @author 공통컴포넌트개발팀 한성곤
  *  @since 2009.06.29
  *  @version 1.0
  *  @see
  *
  */
%>


<c:if test="${type == 'body'}">
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!-- 댓글 내용  -->
	<c:set var="replyTitle"><spring:message code="comCopCmt.articleCommentVO.title"/></c:set>

    <h4>${replyTitle}<strong class="secondary"><c:out value="${resultCnt}"/></strong>개</h4>
    <c:forEach var="result" items="${resultList}" varStatus="status">
    <div class="comment-area">
        <div class="comment-header">
           <strong><c:out value="${result.wrterNm}" /></strong>
           <span class="date"><c:out value="${result.frstRegisterPnttm}" /></span>
        </div>
        <div class="comment-body">
        	<c:out value="${fn:replace(result.commentCn , crlf , '<br/>')}" escapeXml="false" />
        </div>
        <div class="comment-footer">
            <button type="button" onclick="javascript:fn_egov_selectCommentForupdt(${result.commentNo})" class="btn btn-default btn-xsm">수정</button>
            <button type="button" onclick="javascript:fn_egov_deleteCommentList(${result.commentNo})" class="btn btn-gray btn-xsm">삭제</button>
        </div>
    </div>
    </c:forEach>
    <!-- paging navigation -->
    <c:if test="${fn:length(resultList) == 0}">
 		<p class="txt"><spring:message code="common.nocomment.msg" /></p>
	</c:if>
	 <div class="page mt15">
         <ul>
             <li>
                 <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_commentList" />
             </li>
         </ul>
     </div>
	<form:form commandName="articleCommentVO" action="${pageContext.request.contextPath}/cop/cmt/insertArticleComment.do" method="post" onSubmit="fn_egov_insert_commentList(); return false;">
	    <h4>댓글 쓰기</h4>
	    <div class="flex">
	        <form:textarea path="commentCn" title="${title} ${inputTxt}" placeholder="입력하세요."  cols="300" rows="20" />
	        <c:choose>
				<c:when test="${searchVO.commentNo == '' }">
					<button type="button" onclick="fn_egov_insert_commentList();" class="btn btn-secondary">등록</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="fn_egov_updt_commentList();" class="btn btn-secondary">수정</button>
				</c:otherwise>
			</c:choose>
	    </div>
	<input name="subPageIndex" type="hidden" value="<c:out value='${searchVO.subPageIndex}'/>">
	<input name="commentNo" type="hidden" value="<c:out value='${searchVO.commentNo}'/>">
	<input name="modified" type="hidden" value="false">
	<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
	<input name="bbsId" type="hidden" value="<c:out value="${result.bbsId}" />">
	</form:form>

</c:if>
