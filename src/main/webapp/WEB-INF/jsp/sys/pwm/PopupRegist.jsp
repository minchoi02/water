<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<validator:javascript formName="popupManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/showModalDialogCallee.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javaScript">
/* ********************************************************
 * 초기화
 ******************************************************** */
$(document).ready(function(){
    fn_init_date();
});
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_save_PopupManage(){
	var varFrom = document.popupManageVO;

	/* if(!validatePopupManageVO(varFrom)){
		debugger;
		return;
	}else{ */

		if(confirm("<spring:message code="common.save.msg" />")){
			varFrom.action =  "<c:url value='/sys/pwm/registPopup.do' />";

			var ntceBgndeYYYMMDD = document.getElementById('ntceBgndeYYYMMDD').value;
			var ntceEnddeYYYMMDD = document.getElementById('ntceEnddeYYYMMDD').value;

			if(ntceBgndeYYYMMDD == '' || ntceEnddeYYYMMDD == '') {
				alert("게시기간은 필수 입력값입니다.");
				return;
			}

			var iChkBeginDe = Number( ntceBgndeYYYMMDD.replaceAll("-","") );
			var iChkEndDe = Number( ntceEnddeYYYMMDD.replaceAll("-","") );

			if(iChkBeginDe > iChkEndDe || iChkEndDe < iChkBeginDe ){
				alert("게시시작일자는 게시종료일자 보다 클수 없고,\n게시종료일자는 게시시작일자 보다 작을수 없습니다.");/* 게시시작일자는 게시종료일자 보다 클수 없고,\n게시종료일자는 게시시작일자 보다 작을수 없습니다. */
				return;
			}

			varFrom.ntceBgnde.value = ntceBgndeYYYMMDD.replaceAll('-','') + fn_SelectBoxValue('ntceBgndeHH') +  fn_SelectBoxValue('ntceBgndeMM');
			varFrom.ntceEndde.value = ntceEnddeYYYMMDD.replaceAll('-','') + fn_SelectBoxValue('ntceEnddeHH') +  fn_SelectBoxValue('ntceEnddeMM');

			if(uploader.getTotalFileCount() == 0){
			    varFrom.submit();
            }else{
            	uploader.startUpload();
            }
		}
	}

/* ********************************************************
* RADIO BOX VALUE FUNCTION
******************************************************** */
function fn_RadioBoxValue(sbName)
{
	var FLength = document.getElementsByName(sbName).length;
	var FValue = "";
	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName(sbName)[i].checked == true){
			FValue = document.getElementsByName(sbName)[i].value;
		}
	}
	return FValue;
}
/* ********************************************************
* SELECT BOX VALUE FUNCTION
******************************************************** */
function fn_SelectBoxValue(sbName)
{
	var FValue = "";
	for(var i=0; i < document.getElementById(sbName).length; i++)
	{
		if(document.getElementById(sbName).options[i].selected == true){

			FValue=document.getElementById(sbName).options[i].value;
		}
	}

	return  FValue;
}
/* ********************************************************
* PROTOTYPE JS FUNCTION
******************************************************** */
String.prototype.trim = function(){
	return this.replace(/^\s+|\s+$/g, "");
}

String.prototype.replaceAll = function(src, repl){
	 var str = this;
	 if(src == repl){return str;}
	 while(str.indexOf(src) != -1) {
	 	str = str.replace(src, repl);
	 }
	 return str;
}
/* ********************************************************
 * 달력
 ******************************************************** */
function fn_init_date(){
	$('#ntceBgndeYYYMMDD').datepicker({
        calendarWeeks: false,
        todayHighlight: true,
        autoclose: true,
        format: "yyyy-mm-dd",
        language: "kr"
});
	$('#ntceEnddeYYYMMDD').datepicker({
        calendarWeeks: false,
        todayHighlight: true,
        autoclose: true,
        format: "yyyy-mm-dd",
        language: "kr"
 });

}
function fnListPage(){
    document.popupManageVO.action = "<c:url value='/sys/pwm/listPopup.do'/>";
    document.popupManageVO.submit();
}
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>팝업 등록</h3>
    </div>
    <form name="popupManageVO" method="post" >
	    <div class="panel-body">
	        <p class="required"><span class="red">*</span>표기는 필수 입력사항</p>
	        <div class="table-box table-row y-scroll content-height-1">
	            <table>
	                <caption>팝업 등록</caption>
	                <colgroup>
	                    <col style="width:300px;">
	                    <col style="width:auto;">
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row">팝업명</th>
	                        <td>
	                            <div>
	                                <input name="popupTitleNm"  type="text" placeholder="입력하세요." />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">팝업 연결</th>
	                        <td>
	                            <div class="label-input">
	                             	<label><input type="radio" checked />새창</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">팝업 이미지</th>
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
									                    document.popupManageVO.uploadedFilesInfo.value = uploadedFilesInfo;
									                    document.popupManageVO.modifiedFilesInfo.value = modifiedFilesInfo;

									                    document.popupManageVO.action = "<c:url value='/sys/pwm/registPopup.do'/>";
									                    document.popupManageVO.submit();

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
                                                 * NamoCrossUploader 객체를 생성합니다.
                                                 */
                                                 var namoCrossUploader = new __NamoCrossUploader();

                                                 var uploadUrl = window.namoCrossUploaderConfig.productPath + '/namo/crossuploader/Upload/FileUpload.do';
                                                 var managerProperties = new Object();
                                                 managerProperties.width = '436';                    // FileUploadManager 너비
                                                 managerProperties.height = '100';                   // FileUploadManager 높이
                                                 managerProperties.containerId = 'uploaderContainer';// FileUploadManager 객체가 생성될 html div 태그 id
                                                 managerProperties.topPanelDisplayStyle ='none';
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

                                                 uploader.setMaxFileCount(1);


                                            </script>
									<label for="file" onclick="onSelectFiles()" class="btn btn-secondary">파일선택</label>
	                            	</div>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">팝업 설명</th>
	                        <td>
	                            <div>
	                               <input name="popupDc"  type="text" placeholder="입력하세요." />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">팝업 URL</th>
	                        <td>
	                            <div>
	                                <input name="fileUrl"  type="text" placeholder="입력하세요." />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">사용 여부</th>
	                        <td>
	                            <div class="label-input">
	                                <label><input id="ntceAt" type="radio" name="ntceAt" value="Y" checked="checked" />사용</label>
	                                <label><input type="radio" name="ntceAt" value="N" />미사용</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">팝업 게시기간</th>
	                        <td>
	                            <div class="label-input">
	                                <label><input type="checkbox" />제한 없음</label>
	                            </div>
	                            <div class="col-6 calendar-day mt15">
									<input class="calendar" id="ntceBgndeYYYMMDD"  type="text" name="ntceBgndeYYYMMDD" maxlength="10" title="게시기간" value="<c:out value="${fn:substring(popupManageVO.ntceBgnde, 0, 4)}"/>-<c:out value="${fn:substring(popupManageVO.ntceBgnde, 4, 6)}"/>-<c:out value="${fn:substring(popupManageVO.ntceBgnde, 6, 8)}"/>"   />
									<div class="col-1">
									<select  id="ntceBgndeHH"  name="ntceBgndeHH">
										<c:forEach var="obj" items="${ntceBgndeHH}">
									  		<option value="${obj.code}">${obj.code}</option>
									  	</c:forEach>
									</select>
									</div>
									 :
									<div class="col-1">
									<select id="ntceBgndeMM" name="ntceBgndeMM">
										<c:forEach var="obj" items="${ntceBgndeMM}">
									  		<option value="${obj.code}">${obj.code}</option>
									  	</c:forEach>
									</select>
									</div>
									&nbsp;~&nbsp;
									<input class="calendar"  id="ntceEnddeYYYMMDD" type="text" name="ntceEnddeYYYMMDD" maxlength="10" title="게시기간" value="<c:out value="${fn:substring(popupManageVO.ntceEndde, 0, 4)}"/>-<c:out value="${fn:substring(popupManageVO.ntceEndde, 4, 6)}"/>-<c:out value="${fn:substring(popupManageVO.ntceEndde, 6, 8)}"/>"  />
									<div class="col-1">
									<select id="ntceEnddeHH" name="ntceEnddeHH" >
										<c:forEach var="obj" items="${ntceEnddeHH}">
									  		<option value="${obj.code}">${obj.code}</option>
									  	</c:forEach>
									</select>
									</div>
									:
									<div class="col-1">
									<select id="ntceEnddeMM" name="ntceEnddeMM">
										<c:forEach var="obj" items="${ntceEnddeMM}">
									  		<option value="${obj.code}">${obj.code}</option>
									  	</c:forEach>
									</select>
									</div>
									</div>
								</div>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
	     <input name="popupId" type="hidden" value="">
	    <input type="hidden" id="atchFileId" name="atchFileId" value=""  />
	    <input type="hidden" id="uploadedFilesInfo" name="uploadedFilesInfo"  />
	    <input type="hidden" id="modifiedFilesInfo" name="modifiedFilesInfo"  />
	    <input name="cmd" type="hidden" value="<c:out value='save'/>"/>
	    <input type="hidden" id="ntceBgnde" name="ntceBgnde"  />
	    <input type="hidden" id="ntceEndde" name="ntceEndde"  />
    </form>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fn_save_PopupManage(); return false;">등록</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javascript:fnListPage(); return false;">목록</button>
        </div>
    </div>
</section>
<!-- panel -->