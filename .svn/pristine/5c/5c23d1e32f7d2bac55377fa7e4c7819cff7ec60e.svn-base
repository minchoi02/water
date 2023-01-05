<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
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
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
$(document).ready(function(){
});
	function fn_init() {
	}



    function fn_regist_notice(){
        //document.board.onsubmit();

        if (!validateBoard(document.board)){
            return;
        }

        if (confirm('<spring:message code="common.update.msg" />')) {
            $("textarea[name=nttCn]").val(CrossEditor.GetBodyValue());
            if(uploader.fileInfoMap.size==0){
                document.board.action = "<c:url value='/cop/bbs/updateBoardArticle.do'/>";
                document.board.submit();
            }else{
            	uploader.startUpload();
            }
        }
    }

    function fn_select_noticeList() {
        document.board.action = "<c:url value='/cop/bbs/selectBoardList.do'/>";
        document.board.submit();
    }

    function fn_check_file(flag) {
        if (flag=="Y") {
            document.getElementById('file_upload_posbl').style.display = "block";
            document.getElementById('file_upload_imposbl').style.display = "none";
        } else {
            document.getElementById('file_upload_posbl').style.display = "none";
            document.getElementById('file_upload_imposbl').style.display = "block";
        }
    }

</script>

<h2 class="hidden">컨텐츠영역</h2>
    <!-- panel -->
    <div class="panel-header">
        <h3>공지사항 수정</h3>
    </div>
    <div class="panel-body">
        <p class="required"><span class="red">*</span>표기는 필수 입력사항</p>
        <div class="table-box table-row">
            <form name="board" method="post">
             <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
             <input type="hidden" name="returnUrl" value="<c:url value='/cop/bbs/forUpdateBoardArticle.do'/>"/>

             <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
             <input type="hidden" name="bbsNm" value="<c:out value='${result.bbsNm}'/>" />
             <input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
             <input type="hidden" name="atchFileId" value="<c:out value='${result.atchFileId}'/>" />

             <input type="hidden" name="adminLimitAt"  value="<c:out value='${boardVO.adminLimitAt}'/>" />
             <input type="hidden" name="fileAtchAt"  value="<c:out value='${boardVO.fileAtchAt}'/>" />
             <input type="hidden" name="fileAtchCnt"  value="<c:out value='${boardVO.fileAtchCnt}'/>" />
             <input type="hidden" name="replyPosbAt"  value="<c:out value='${boardVO.replyPosbAt}'/>" />
             <input type="hidden" name="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>"/>
             <input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>"/>
	    	 <input type="hidden" name="uploadedFilesInfo" value="" />
			 <input type="hidden" name="modifiedFilesInfo" value="" />

                <table>
                    <caption>공지사항 등록</caption>
                    <colgroup>
                        <col style="width:200px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span>제목</span></th>
                            <td>
                                <div>
                                    <input id="nttSj" name="nttSj" type="text" size="60" value='<c:out value="${result.nttSj}" />'  maxlength="60">
                                    <br/><form:errors path="nttSj" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>글내용</span></th>
                            <td>
                               <div style="display: block;" >
                               	<textarea id="nttCn" name="nttCn" alt="initText" title="initText" Style="width:730px; height:450px; font-size:10pt">
									${result.nttCn}
                               	</textarea>
								<script type="text/javascript" language="javascript">

									var CrossEditor = new NamoSE('nttCn');
									CrossEditor.params.Width = "100%";
									CrossEditor.params.UserLang = "auto";

									CrossEditor.params.FullScreen = false;

									CrossEditor.EditorStart();
									function OnInitCompleted(e){
									    console.log(CrossEditor);
										e.editorTarget.SetBodyValue(document.getElementById("nttCn").value);

										}
								</script>
                               </div>
                            </td>
                        </tr>
                        <tr>
                           <th scope="row"><span>첨부파일</span></th>
                           <td>
                               <div class="col-12" style="display: block;">
                                       <div id="uploaderContainer" class="form_area">
                                            <script type='text/javascript'>

                                                /**
                                                * NamoCrossUploader Event를 설정합니다.
                                                * 아래의 Event 이름들은 namocrossuploader-config.js 파일에서 변경하실 수 있습니다.
                                                */

                                                /**
                                                * 업로드 시작 시 호출됩니다.
                                                */
                                                var onStartUploadCu = function () {
                                                    //alert('onStartUploadCu : 업로드가 시작됐습니다.');
                                                }

                                                /**
                                                * 개별 파일에 대한 업로드 시작 시 호출됩니다.
                                                */
                                                var onStartUploadItemCu = function (rowIndex) {

                                                    /*
                                                    var obj = jQuery.parseJSON(uploader.getFileInfoAt(rowIndex));
                                                    alert("[" + rowIndex + "번째 파일의 정보]\n" +
                                                        "FileType : " + obj.fileType + " (NORMAL:파일, UPLOADED:업로드된 파일)\n" +
                                                        "FileId : " + obj.fileId + "\n" +
                                                        "FileName : " + obj.fileName + "\n" +
                                                        "FileSize : " + obj.fileSize + "\n" +
                                                        "Status : " + obj.status + "\n" +
                                                        "IsDeleted : " + obj.isDeleted + "\n\n" +
                                                        "FileType, FileId, IsDeleted 게시판 수정모드에 활용되는 속성입니다."
                                                        );
                                                    */
                                                }

                                                /**
                                                * 개별 파일에 대한 업로드 완료 시 호출됩니다.
                                                */
                                                var onEndUploadItemCu = function (rowIndex) {
                                                    var uploadedFilesInfo = uploader.getUploadedFilesInfo();
                                                    var obj = jQuery.parseJSON(uploadedFilesInfo);
                                                    $("#atchFileId").val(obj[0].atchFileId)
                                                    $("#rowIndex").val(rowIndex);

                                                    //  var obj = jQuery.parseJSON(uploader.getUploadedFilesInfo());
                                                    //console.log(obj);
                                                    //console.log(rowIndex);
                                                    //document.board.atchFileId.value = obj[0].atchFileId;
                                                    //console.log(document.board.atchFileId.value);
                                                    /*
                                                    var obj = jQuery.parseJSON(uploader.getFileInfoAt(rowIndex));
                                                    alert("[" + rowIndex + "번째 파일의 정보]\n" +
                                                        "FileType : " + obj.fileType + " (NORMAL:파일, UPLOADED:업로드된 파일)\n" +
                                                        "FileId : " + obj.fileId + "\n" +
                                                        "FileName : " + obj.fileName + "\n" +
                                                        "FileSize : " + obj.fileSize + "\n" +
                                                        "Status : " + obj.status + "\n" +
                                                        "IsDeleted : " + obj.isDeleted + "\n\n" +
                                                        "FileType, FileId, IsDeleted 게시판 수정모드에 활용되는 속성입니다."
                                                        );
                                                        */
                                                }

                                                /**
                                                * 업로드 완료 시 호출됩니다.
                                                */
                                                var onEndUploadCu = function () {
                                                    // alert('업로드가 완료됐습니다.');
                                                }

                                                /**
                                                * 전송창이 닫힐 때 호출됩니다.
                                                */
                                                var onCloseMonitorWindowCu = function () {
                                                    // 데이터 처리 페이지로 업로드 결과를 전송합니다.
                                                    // onEndUploadCu 나 onCloseMonitorWindowCu 이벤트 시점에 처리하시면 되며,
                                                    // onCloseMonitorWindowCu 시에는 getUploadStatus()를 호출하여 업로드 완료되어 있는지 체크해 주십시오.
                                                    if (uploader.getUploadStatus() == 'COMPLETION') {

                                                        // 업로드된 전체 파일의 정보를 가져옵니다.
						 			                    var uploadedFilesInfo = uploader.getUploadedFilesInfo();
														var modifiedFilesInfo = uploader.getModifiedFilesInfo();

									                    /**
									                    * 필요 시, 아래처럼 사용해 주십시오. (JSON으로 넘오올 경우)
									                    var obj = jQuery.parseJSON(uploadedFilesInfo);
									                    alertTimeout(obj.length);
									                    alertTimeout(obj[0].name);
									                    */

									                    // 데이터 처리 페이지로 업로드 결과를 전송합니다.
									                 	//var obj = jQuery.parseJSON(uploadedFilesInfo);
									                    //console.log(uploadedFilesInfo);
									                    document.board.uploadedFilesInfo.value = uploadedFilesInfo;
									                    document.board.modifiedFilesInfo.value = modifiedFilesInfo;
									                    console.log(document.board.uploadedFilesInfo.value);

									                    document.board.action = "<c:url value='/cop/bbs/updateBoardArticle.do'/>";
									                    document.board.submit();

                                                    }
                                                }

                                                /**
                                                * 개별 파일에 대한 업로드 취소 시 호출됩니다.
                                                */
                                                var onCancelUploadItemCu = function (rowIndex) {
                                                    /*
                                                    var obj = jQuery.parseJSON(uploader.getFileInfoAt(rowIndex));
                                                    alert('[개별 파일에 대한 업로드 취소 정보]\n' +
                                                        'FileName : '               + obj.fileName + '\n' +
                                                        'FileSize : '               + obj.fileSize + '\n'
                                                    );
                                                    */
                                                }

                                                /**
                                                * 예외 발생 시 호출됩니다.
                                                */
                                                var onExceptionCu = function () {
                                                    // 300~ : 일반적 예외
                                                    // 400~ : 시스템 예외
                                                    // 500~ : 서측에서 발생한 예외
                                                    // 필요한 예외정보만 고객에서 보여주십시오.
                                                    var exceptionInfo = uploader.getLastExceptionInfo();
                                                    var obj = jQuery.parseJSON(exceptionInfo);
                                                    alert('[예외 정보]\n' + 'code : ' + obj.code + '\n' + 'message : ' + obj.message + '\n' + 'detailMessage : ' + obj.detailMessage);

                                                    if (parseInt(obj.code, 10) > 400000) {
                                                        var uploadedFilesInfo = uploader.getUploadedFilesInfo();
                                                        document.dataForm.uploadedFilesInfo.value = uploadedFilesInfo;
                                                        document.dataForm.action = "ErrorProcess.jsp";
                                                        document.dataForm.submit();
                                                    }
                                                }

                                                /**
                                                 * UI Properties 변경
                                                 */
                                                 var resetUiProperties = function () {
                                                     var mainWidth = document.getElementById('mainWidth').value;
                                                     var mainHeight = document.getElementById('mainHeight').value;
                                                     var mainBorderColor = document.getElementById('mainBorderColor').value;
                                                     var topPanelDisplayStyle = (document.getElementsByName('topPanelDisplayStyle')[0].checked == true) ? 'block' : 'none';
                                                     var selectFilesButtonDisplayStyle = (document.getElementsByName('selectFilesButtonDisplayStyle')[0].checked == true) ? 'block' : 'none';
                                                     var selectFilesButtonDisabledStyle = (document.getElementsByName('selectFilesButtonDisabledStyle')[0].checked == true) ? true : false;
                                                     var uploadButtonDisplayStyle = (document.getElementsByName('uploadButtonDisplayStyle')[0].checked == true) ? 'block' : 'none';
                                                     var uploadButtonDisabledStyle = (document.getElementsByName('uploadButtonDisabledStyle')[0].checked == true) ? true : false;
                                                     var selectFilesButtonDisplayStyleOnStatus = (document.getElementsByName('selectFilesButtonDisplayStyleOnStatus')[0].checked == true) ? 'block' : 'none';
                                                     var closeMonitorCheckBoxChecked = (document.getElementsByName('closeMonitorCheckBoxChecked')[0].checked == true) ? true : false;

                                                     var managerProperties = new Object();
                                                     managerProperties.width = mainWidth;                                                // FileUploadManager 너비
                                                     managerProperties.height = mainHeight;                                              // FileUploadManager 높이
                                                     managerProperties.borderColor = mainBorderColor;                                    // FileUploadManager 보더 컬러
                                                     managerProperties.topPanelDisplayStyle = topPanelDisplayStyle;                      // 상단 패널 Visible 상태
                                                     managerProperties.selectFilesButtonDisplayStyle = selectFilesButtonDisplayStyle;    // 파일선택 버튼 Visible 상태
                                                     managerProperties.selectFilesButtonDisabledStyle = selectFilesButtonDisabledStyle;  // 파일선택 버튼 Enabled 상태
                                                     managerProperties.uploadButtonDisplayStyle = uploadButtonDisplayStyle;              // 업로드 버튼 Visible 상태
                                                     managerProperties.uploadButtonDisabledStyle = uploadButtonDisabledStyle;            // 업로드 버튼 Enabled 상태
                                                     managerProperties.selectFilesButtonDisplayStyleOnStatus = selectFilesButtonDisplayStyleOnStatus;    // 상태바 파일선택 버튼 Visible 상태

                                                     var monitorProperties = new Object();
                                                     monitorProperties.closeMonitorCheckBoxChecked = closeMonitorCheckBoxChecked;        // 전송 완료 후 FileUploadMonitor 창 닫기 설정

                                                     namoCrossUploader.setUploaderProperties(
                                                         JSON.stringify(managerProperties),                          // FileUploadManager 프로퍼티를 JSON 문자열로 전달
                                                         JSON.stringify(monitorProperties));                         // FileUploadMonitor 프로퍼티를 JSON 문자열로 전달


                                                     // 상단 패널, 또는 버튼의 visible, enabled 상태에 따라 html 버튼의 visibility 설정
                                                     document.getElementById("selectFiles").disabled = true;
                                                     document.getElementById("startUpload").disabled = true;

                                                     if (topPanelDisplayStyle == 'none') {
                                                         document.getElementById("selectFiles").disabled = false;
                                                         document.getElementById("startUpload").disabled = false;
                                                     }
                                                     else if (selectFilesButtonDisplayStyle == 'none' || selectFilesButtonDisabledStyle == true)
                                                         document.getElementById("selectFiles").disabled = false;
                                                     else if (uploadButtonDisplayStyle == 'none' || uploadButtonDisabledStyle == true)
                                                         document.getElementById("startUpload").disabled = false;
                                                 }

                                                 /**
                                                 * NamoCrossUploader 객체를 생성합니다.
                                                 */
                                                 var namoCrossUploader = new __NamoCrossUploader();

                                                 var uploadUrl = window.namoCrossUploaderConfig.productPath + '/namo/crossuploader/Upload/FileUpload.do';
                                                 var managerProperties = new Object();
                                                 managerProperties.width = '436';                    // FileUploadManager 너비
                                                 managerProperties.height = '280';                   // FileUploadManager 높이
                                                 managerProperties.containerId = 'uploaderContainer';// FileUploadManager 객체가 생성될 html div 태그 id
                                                 managerProperties.uploadUrl = uploadUrl;            // 파일 업로드 처리 페이지 경로

                                                 var monitorProperties = new Object();
                                                 monitorProperties.monitorLayerClass = 'monitorLayer';      // FileUploadMonitor 창의 스타일입니다. (namocrossuploader.css 파일에 정의, 변경 가능)
                                                 monitorProperties.monitorBgLayerClass = 'monitorBgLayer';  // FileUploadMonitor 창의 백그라운드 스타일입니다. (namocrossuploader.css 파일에 정의, 변경 가능)
                                                 monitorProperties.closeMonitorCheckBoxChecked = true;      // 전송 완료 후 FileUploadMonitor 창 닫기 설정

                                                 var uploader = namoCrossUploader.createUploader(
                                                     JSON.stringify(managerProperties),                          // FileUploadManager 프로퍼티를 JSON 문자열로 전달
                                                     JSON.stringify(monitorProperties),                          // FileUploadMonitor 프로퍼티를 JSON 문자열로 전달
                                                     JSON.stringify(window.namoCrossUploaderConfig.eventNames)); // 이벤트 이름을 JSON 문자열로 전달

                                                 /**
                                                 * 사용자 정의 파일추가
                                                 */
                                                 var onSelectFiles = function () {
                                                     uploader.selectFiles();
                                                 }

                                                 /**
                                                 * 사용자 정의 업로드
                                                  */
                                                 var onStartUpload = function () {
                                                     uploader.startUpload();
                                                 }
                                                 var fileList = ${fileList};

										         for (i in fileList) {
										            	var fileInfo = new Object();
										                fileInfo.fileId = fileList[i].atchFileId;
										                fileInfo.streFileNm = fileList[i].streFileNm;
										                fileInfo.fileName = fileList[i].orignlFileNm;
										                fileInfo.fileSize = fileList[i].fileMg;
										                fileInfo.fileUrl = ''; // 각 파일의 URL이 다르거나 SingleFileDownload일 때 사용됩니다.

										                uploader.addUploadedFile(JSON.stringify(fileInfo));
										          }
                                            </script>
                                        </div>
                                </div>
                           </td>
                        </tr>
                    </tbody>
                 </table>
             </form>
        </div>
    </div>

    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fn_regist_notice(); return false;">저장</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javascript:fn_select_noticeList(); return false;">목록</button>
        </div>
    </div>
