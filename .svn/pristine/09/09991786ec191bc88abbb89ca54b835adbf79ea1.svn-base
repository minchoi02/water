<%--
  Class Name : EgovImgFileList.jsp
  Description : 이미지 파일 조회화면(include)
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.31   이삼섭          최초 생성
     2011.08.31   JJY       경량환경 버전 생성

    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.31
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
  .imgbox td {border:1px solid #ccc;}
  .imgbox td > p.img {border-bottom:1px solid #ccc; text-align:center;}
  .imgbox td > p.tx {text-align:center; padding:6px 0;}
</style>
    <table>
      <colgroup>
          <col width="150px">
          <col width="150px">
          <col width="150px">
          <col width="150px">
          <col width="150px">
      </colgroup>
<%--
    <c:forEach var="fileVO" items="${fileList}" varStatus="status">
      <tr>
        <td>
            <img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.atchFileId}"/>&fileSn=<c:out value="${fileVO.fileSn}"/>'  width="640" alt="파일보기링크" />
        </td>
      </tr>
    </c:forEach>
 --%>
	<c:set var="i" value="0" />
	<c:set var="j" value="5" />
		<c:forEach var="fileVO" items="${fileList}">
			<c:if test="${i%j == 0 }">
				<tr class="imgbox">
        </c:if>
          <td>
            <p class="img"><img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.atchFileId}"/>&fileSn=<c:out value="${fileVO.fileSn}"/>'  onclick="fn_ImgPopup(this, '${fileVO.atchFileId}', '${fileVO.fileSn}');" height="100" width="150" title="${fileVO.orignlFileNm}" alt="파일보기링크" /></p>
            <p class="tx">${fileVO.orignlFileNm}</p>
          </td>
          <c:if test="${i%j == j-1 }">
        </tr>
        </c:if>
			<c:set var="i" value="${i+1 }" />
		</c:forEach>
</table>
