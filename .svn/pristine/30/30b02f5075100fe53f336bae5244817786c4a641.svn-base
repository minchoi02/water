<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<c:set var="registerFlag" value="${empty cntntsMstrVO.cntntsId ? 'INSERT' : 'UPDATE'}"/>
<validator:javascript formName="cntntsMstrVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js'/>" ></script>
<script type="text/javascript" src="/namo/crosseditor/js/namo_scripteditor.js"></script>

<script type="text/javaScript">
<!--
$(document).ready(function(){

});


function fnInsert(){
	if(!validateCntntsMstrVO(document.cntntsMstrVO)) return;
    if(!confirm('<spring:message code="common.regist.msg" />')) return;
    $("textarea[name=cntntsCn]").val(CrossEditor.GetBodyValue());
    document.cntntsMstrVO.submit();
}

function fnListPage() {
	document.cntntsMstrVO.action = "<c:url value='/sys/cntnts/CntntsMstrManage.do'/>";
    document.cntntsMstrVO.submit();
}
//-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>콘텐츠 등록</h3>
    </div>
    <form:form commandName="cntntsMstrVO" action="${pageContext.request.contextPath}/sys/cntnts/CntntsMstrInsert.do" name="cntntsMstrVO" method="post">
	    <div class="panel-body">
	       <p class="required"><span class="red">*</span>표기는 필수 입력사항</p>
	        <div class="table-box table-row table-col-6 y-scroll content-height-1">
	             <table>
	                 <caption>콘텐츠 등록</caption>
	                 <colgroup>
	                     <col style="width:300px;">
	                     <col style="width:auto;">
	                 </colgroup>
	                 <tbody>
	                     <tr>
	                         <th scope="row">컨텐츠 명</th>
	                         <td>
	                             <div>
	                                  <form:input path="cntntsNm" title="컨텐츠 명" size="50" maxlength="20" placeholder="입력하세요." />
	                                  <form:errors path="cntntsNm" cssClass="error" />
	                             </div>
	                         </td>
	                     </tr>
	                     <tr>
	                         <td colspan="2" >
                                 <div class="col-12" style="display: block;" >
		                          <textarea id="cntntsCn" name="cntntsCn" alt="initText" title="initText" Style="width:730px; height:450px; font-size:10pt">
		                          </textarea>
		                          <script type="text/javascript" language="javascript">

		                              var CrossEditor = new NamoSE('cntntsCn');
		                              CrossEditor.params.Width = "100%";
		                              CrossEditor.params.UserLang = "auto";

		                              CrossEditor.params.FullScreen = false;

		                              CrossEditor.EditorStart();
		                              function OnInitCompleted(e){
		                                  e.editorTarget.SetBodyValue(document.getElementById("cntntsCn").value);

		                                  }
		                          </script>
                         		</div>
	                         </td>
	                     </tr>
	                 </tbody>
	             </table>
	        </div>
	    </div>
    </form:form>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-secondary btn-lg">임시저장</button>
            <button type="button" class="btn btn-primary btn-lg" onclick="javaScript:fnInsert(); return false;">등록</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javascript:fnListPage(); return false;">목록</button>
        </div>
    </div>
</section>
<!-- panel -->

<!-- modal -->
<div class="modal fade" id="modal-find" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>상위 메뉴 선택</h3>
            </div>
            <div class="modal-body">
                <div class="tree-area">
                    <div class="list-tree-area">
                        <ul>
                            <li><a href="#"><i class="fa fa-folder"></i>대메뉴1</a>
                                <ul>
                                    <li><a href="#"><i class="far fa-file"></i>메뉴1</a></li>
                                </ul>
                            </li>
                            <li><a href="#"><i class="fa fa-folder"></i>대메뉴2</a>
                                <ul>
                                    <li><a href="#"><i class="far fa-file"></i>메뉴2</a></li>
                                    <li><a href="#"><i class="far fa-file"></i>메뉴3</a></li>
                                </ul>
                            </li>
                            <li><a href="#"><i class="fa fa-folder"></i>대메뉴3</a>
                                <ul>
                                    <li><a href="#"><i class="far fa-file"></i>메뉴4</a></li>
                                    <li><a href="#"><i class="far fa-file"></i>메뉴5</a></li>
                                    <li><a href="#"><i class="far fa-file"></i>메뉴6</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-area">
                    <button type="button" class="btn btn-primary btn-lg">선택</button>
                    <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">닫기</button>
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