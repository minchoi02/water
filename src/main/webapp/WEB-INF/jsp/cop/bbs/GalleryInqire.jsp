<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<validator:javascript formName="articleComment" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js'/>" ></script>
<script type="text/javascript" src="/namo/crosseditor/js/namo_scripteditor.js"></script>

<!-- 샘플 설명을 위한 화면 스타일입니다. 중요하지 않으며, 필요 없을 시 삭제해 주십시오. -->
<!-- <link rel="stylesheet" type="text/css" href="/css/common.css" /> -->

<!-- NamoCrossUploader Client HTML5 Edition 이 동작하기 위한 필수 파일입니다. -->
<link rel="stylesheet" type="text/css" href="/app/lib/slick/css/slick.grid.css" />
<link rel="stylesheet" type="text/css" href="/app/lib/slick/css/smoothness/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" href="/app/lib/slick/css/theme.css" />
<link rel="stylesheet" type="text/css" href="/app/css/namocrossuploader.css" />
<script type="text/javascript" src="/app/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/app/lib/jquery.event.drag-2.2.js"></script>
<script type="text/javascript" src="/app/lib/slick/slick.core.js"></script>
<script type="text/javascript" src="/app/lib/slick/slick.grid.js"></script>
<script type="text/javascript" src="/app/lib/slick/slick.dataview.js"></script>
<script type="text/javascript" src="/app/lib/slick/plugins/slick.checkboxselectcolumn.js"></script>
<script type="text/javascript" src="/app/lib/slick/plugins/slick.rowselectionmodel.js"></script>
<script type="text/javascript" src="/app/js/namocrossuploader-config.js"></script>
<script type="text/javascript" src="/app/js/namocrossuploader.js"></script>
<script type="text/javascript" src="/app/lib/contextmenu/jquery.contextMenu.js"></script>
<script type="text/javascript" src="/app/lib/contextmenu/jquery.ui.position.js"></script>
<link rel="stylesheet" type="text/css" href="/app/lib/contextmenu/jquery.contextMenu.css" />


<script type="text/javascript">
$(document).ready(function(){
    onloading();
});

	function fn_init() {

	}

    var CrossEditor = new NamoSE("CE")
    function startEditor(){
        CrossEditor.params.ParentEditor = document.getElementById("nttCn");
        CrossEditor.params.Height = "359";
        CrossEditor.params.Width = "100%";
        CrossEditor.EditorStart();
    }
    function onloading() {

        if ("<c:out value='${msg}'/>" != "") {
            alert("<c:out value='${msg}'/>");
        }
    }

    function fn_select_noticeList() {
        document.frm.action = "<c:url value='/cop/bbs/selectBoardList.do'/>";
        document.frm.submit();
    }

    function fn_delete_notice() {
        if (confirm('<spring:message code="common.delete.msg" />')) {
            document.frm.action = "<c:url value='/cop/bbs/deleteBoardArticle.do'/>";
            document.frm.submit();
        }
    }

    function fn_moveUpdt_notice() {
        document.frm.action = "<c:url value='/cop/bbs/forUpdateBoardArticle.do'/>";
        document.frm.submit();
    }

    function fn_addReply() {
        document.frm.action = "<c:url value='/cop/bbs/addReplyBoardArticle.do'/>";
        document.frm.submit();
    }
	function fn_egov_insert_commentList() {

		var form = document.getElementById("articleCommentVO");

		if (!validateArticleComment(form)){
			return;
		}
		if (confirm('<spring:message code="common.regist.msg" />')) {
			form.submit();
		}
	}

	function fn_egov_updt_commentList() {

		var form = document.getElementById("articleCommentVO");

		if (!validateArticleComment(form)){
			return;
		}

		if (confirm('<spring:message code="common.update.msg" />')) {
			form.modified.value = "true";
			form.action = "<c:url value='/cop/cmt/updateArticleComment.do'/>";
			form.submit();
		}
	}
	function fn_egov_selectCommentForupdt(commentNo) {

		var form = document.getElementById("articleCommentVO");

		form.commentNo.value = commentNo;
		form.action = "<c:url value='/cop/bbs/selectBoardArticle.do'/>";
		form.submit();
	}

	function fn_egov_deleteCommentList(commentNo) {

		var form = document.getElementById("articleCommentVO");

		if (confirm('<spring:message code="common.delete.msg" />')) {
			form.modified.value = "true";
			form.commentNo.value = commentNo;
			form.action = "<c:url value='/cop/cmt/deleteArticleComment.do'/>";
			form.submit();
		}
	}

	/* 댓글페이징 */
	function fn_egov_select_commentList(pageNo) {

		var form = document.getElementById("articleCommentVO");

		form.subPageIndex.value = pageNo;
		form.commentNo.value = '';
		form.action = "<c:url value='/cop/bbs/selectBoardArticle.do'/>";
		form.submit();
	}

</script>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<h2 class="hidden">컨텐츠영역</h2>
    <div class="panel-header">
        <h3>공지사항 상세</h3>
    </div>
    <div class="panel-body">
        <div class="table-box table-row">
            <form name="frm" method="post" action="<c:url value='/cop/bbs/selectBoardList.do'/>">
             <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
             <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
             <input type="hidden" name="bbsNm" value="<c:out value='${result.bbsNm}'/>" >
             <input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
             <input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
             <input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
             <input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
             <input type="hidden" name="atchFileId" value="<c:out value='${result.atchFileId}'/>"/>
             <input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
             <input type="hidden" name="adminLimitAt"  value="<c:out value='${boardVO.adminLimitAt}'/>" />
             <input type="hidden" name="fileAtchAt"  value="<c:out value='${boardVO.fileAtchAt}'/>" />
             <input type="hidden" name="fileAtchCnt"  value="<c:out value='${boardVO.fileAtchCnt}'/>" />
             <input type="hidden" name="replyPosbAt"  value="<c:out value='${boardVO.replyPosbAt}'/>" />
             <input type="hidden" name="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>"/>
             <input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>"/>

                <table>
                    <caption>공지사항 등록</caption>
                    <colgroup>
                        <col style="width:200px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span>제목</span></th>
                            <td colspan="5">
                                <div>
                                    <c:out value="${result.nttSj}" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                      <th scope="row">작성자</th>
                      <td><c:out value="${result.ntcrNm}" /></td>
                      <th scope="row">작성일</th>
                      <td>${result.frstRegisterPnttm}</td>
                      <th scope="row">조회수</th>
                      <td><c:out value="${result.inqireCo}" /></td>
                        </tr>
                        <tr>
                            <th scope="row"><span>글내용</span></th>
                            <td colspan="5">
                                <div>
                                	<pre-wrap>
                                    	${result.nttCn}
                                	</pre-wrap>
                                </div>
                            </td>
                        </tr>
                        <c:if test="${not empty result.atchFileId}">
                         <tr>
                            <th scope="row"><span>대표사진</span></th>
                            <td colspan="5">
                                   <div id="downloaderContainer" class="form_area" style="display: block;">

                          <script type='text/javascript'>
                              /**
                              * 다운로드 할 파일 추가
                              */
                              var addFiles = function ()
                              {
                                 var fileList = ${fileList};

                                 for (i in fileList) {
                                      var fileInfo = new Object();
                                      fileInfo.fileId = fileList[i].atchFileId;
                                      fileInfo.streFileNm = fileList[i].streFileNm;
                                      fileInfo.fileName = fileList[i].orignlFileNm;
                                      fileInfo.fileSize = fileList[i].fileMg;
                                      fileInfo.fileUrl = ''; // 각 파일의 URL이 다르거나 SingleFileDownload일 때 사용됩니다.

                                      downloader.addFile(JSON.stringify(fileInfo));
                                  }

                                  downloader.scrollRow(0); // 첫번째 파일 위치로 스크롤 이동
                              }

                              /**
                              * 전체 파일 삭제
                              */
                              var deleteAllFiles = function ()
                              {
                                  downloader.deleteAllFiles();
                              }


                              /**
                              * NamoCrossDownloader 객체를 생성합니다.
                              */
                              var namoCrossUploader = new __NamoCrossUploader();
                              var downloadUrl = window.namoCrossUploaderConfig.productPath + '/namo/crossuploader/Download/FileDownloadload.do';
                              var managerProperties = new Object();
                              managerProperties.width = '436';                        // FileDownloadManager 너비
                              managerProperties.height = '150';                       // FileDownloadManager 높이
                              managerProperties.containerId = 'downloaderContainer';  // FileDownloadManager 객체가 생성될 html div 태그 id
                              managerProperties.uiMode = 'MULTIPLE';                  // FileDownloadManager UI 모드 설정
                              managerProperties.downloadUrl = downloadUrl;            // 다운로드 처리 페이지

                              var downloader = namoCrossUploader.createDownloader(
                                  JSON.stringify(managerProperties));                 // FileDownloadManager 프로퍼티를 JSON 문자열로 전달

                              /**
                              * 다운로드 할 파일 추가
                              */
                              addFiles();
                          </script>
                                   </div>
                            </td>
                         </tr>
                        </c:if>
                    </tbody>
                 </table>
             </form>
        </div>
        <c:if test="${result.cmtAt eq 'Y' }">
        <div class="comment-wrap">
	      	<c:import url="/cop/cmt/selectArticleCommentList.do" charEncoding="utf-8">
			</c:import>
		</div>
		</c:if>
    </div>

    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fn_moveUpdt_notice(); return false;">수정</button>
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fn_addReply(); return false;">답글</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javascript:fn_delete_notice(); return false;">삭제</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javascript:fn_select_noticeList(); return false;">목록</button>
        </div>
    </div>
