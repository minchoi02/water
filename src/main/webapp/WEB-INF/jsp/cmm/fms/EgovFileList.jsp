<%--
  Class Name : EgovFileList.jsp
  Description : 파일 목록화면(include)
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.26   이삼섭          최초 생성
     2011.08.31   JJY       경량환경 버전 생성

    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.26
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">
<!--
    function fn_egov_downFile(atchFileId, fileSn){
        window.open("<c:url value='/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
    }

    function fn_egov_deleteFile(atchFileId, fileSn) {
    	if (confirm('첨부파일을 삭제하시겠습니까?')) {
	    	$('#board input[name=atchFileId]').val(atchFileId);

			$('#board input[name=fileSn]').val(fileSn);

			var form = $('#board')[0];
			var formData = new FormData(form);

				$.ajax({
			    cache : false,
			    url : '/cmm/fms/deleteFileInfAjax.do',
			    type : 'POST',
			    enctype: 'multipart/form-data',
			    processData: false,
			    contentType: false,
			    cache: false,
			    timeout: 600000,
			    data : formData,
			    success : function(data) {
			       	 alert('<spring:message code="success.common.delete" />');
					$("#"+atchFileId+fileSn+"Span").remove();
					$("#"+atchFileId+fileSn+"Img").remove();
			    }, // success

			    error : function(xhr, status) {
			        alert(xhr + " : " + status);
			    }
			}); // $.ajax */
	    }
    }

    function fn_egov_check_file(flag) {
        if (flag=="Y") {
            document.getElementById('file_upload_posbl').style.display = "block";
            document.getElementById('file_upload_imposbl').style.display = "none";
        } else {
            document.getElementById('file_upload_posbl').style.display = "none";
            document.getElementById('file_upload_imposbl').style.display = "block";
        }
    }
//-->
</script>

<input type="hidden" name="atchFileId" value="${atchFileId}">
<input type="hidden" name="fileSn" >
<input type="hidden" name="fileListCnt" value="${fileListCnt}">
        <c:forEach var="fileVO" items="${fileList}" varStatus="status">
           <c:choose>
               <c:when test="${updateFlag=='Y'}">
               		<c:if test="${fileVO.cateNm != '' && not empty fileVO.cateNm}">
               			[${fileVO.cateNm }]&nbsp;
               		</c:if>
               		<c:if test="${fileVO.odr != '' && not empty fileVO.odr}">
               			[${fileVO.odr }]차&nbsp;
               		</c:if>
               	   <span id="${fileVO.atchFileId}${fileVO.fileSn}Span" class="link"><a href="#LINK" onclick="javascript:fn_egov_downFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')">
                   <c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
                   </a>
                   </span>
                   <img id="${fileVO.atchFileId}${fileVO.fileSn}Img"  alt="파일 삭제" src="<c:url value='/images/btn/bu5_close.gif'/>"
                        width="19" height="18" onClick="fn_egov_deleteFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>');" />
               </c:when>
               <c:otherwise>
               		<c:if test="${fileVO.cateId != '' && not empty fileVO.cateId}">
               			[${fileVO.cateId }]&nbsp;
               		</c:if>
                   <span class="link"><a href="#LINK" onclick="javascript:fn_egov_downFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')">
                   <c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
                   </a>
                   </span>
               </c:otherwise>
           </c:choose>
           <br/>
        </c:forEach>
        <c:if test="${fn:length(fileList) == 0}">
        </c:if>
