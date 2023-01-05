<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<validator:javascript formName="bannerManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
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
function fn_save_BannerManage(){

	var varFrom = document.bannerManageVO;

	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/sys/bwm/updtBanner.do' />";
		/* if(!validateBannerManageVO(varFrom)){
			debugger;
			return;
		}else{ */

			var ntceBgndeYYYMMDD = document.getElementById('ntceBgndeYYYMMDD').value;
			var ntceEnddeYYYMMDD = document.getElementById('ntceEnddeYYYMMDD').value;

			var iChkBeginDe = Number( ntceBgndeYYYMMDD.replaceAll("-","") );
			var iChkEndDe = Number( ntceEnddeYYYMMDD.replaceAll("-","") );

			if(iChkBeginDe > iChkEndDe || iChkEndDe < iChkBeginDe ){
				alert("게시시작일자는 게시종료일자 보다 클수 없고, \n게시종료일자는 게시시작일자 보다 작을수 없습니다.");
				return;
			}

			varFrom.ntceBgnde.value = ntceBgndeYYYMMDD.replaceAll('-','') + fn_SelectBoxValue('ntceBgndeHH') +  fn_SelectBoxValue('ntceBgndeMM');
			varFrom.ntceEndde.value = ntceEnddeYYYMMDD.replaceAll('-','') + fn_SelectBoxValue('ntceEnddeHH') +  fn_SelectBoxValue('ntceEnddeMM');

			varFrom.submit();

		/* } */
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
    document.bannerManageVO.action = "<c:url value='/sys/bwm/listBanner.do'/>";
    document.bannerManageVO.submit();
}
function fn_delete_BannerManage(){
	var vFrom = document.bannerManageVO;
	if(confirm('<spring:message code="common.delete.msg"/>')){/* 삭제 하시겠습니까? */
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/sys/bwm/detailBanner.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>배너 수정</h3>
    </div>
    <form name="bannerManageVO" method="post" >
	    <div class="panel-body">
	       <p class="required"><span class="red">*</span>표기는 필수 입력사항</p>
	        <div class="table-box table-row y-scroll content-height-1">
	            <table>
	                <caption>배너 수정</caption>
	                <colgroup>
	                    <col style="width:300px;">
	                    <col style="width:auto;">
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row">배너명</th>
	                        <td>
	                            <div>
	                                <input name="bannerTitleNm" type="text" maxlength="255" value="${bannerManageVO.bannerTitleNm}" />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">배너 연결</th>
	                        <td>
	                            <div class="label-input">
	                                <label><input type="radio" checked />새창</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">배너 설명</th>
	                        <td>
	                            <div>
	                                <input name="bannerDc"  type="text" placeholder="입력하세요." value="${bannerManageVO.bannerDc}" />
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">배너 URL</th>
	                        <td>
	                            <div>
	                                <input name="fileUrl" type="text" maxlength="255" size="35"  value="${bannerManageVO.fileUrl}"/>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">사용 여부</th>
	                        <td>
	                            <div class="label-input">
	                              	<label><input id="ntceAt" type="radio" name="ntceAt" value="Y" <c:if test="${bannerManageVO.ntceAt eq 'Y'}">checked</c:if>> 사용</label>
	                                <label><input type="radio" name="ntceAt" value="N" <c:if test="${bannerManageVO.ntceAt eq 'N'}">checked</c:if>>미사용</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">배너 게시기간</th>
	                        <td>
	                            <div class="label-input">
	                                <label><input type="checkbox" />제한 없음</label>
	                            </div>
	                            <div class="col-6 calendar-day mt15">
									<input class="calendar" id="ntceBgndeYYYMMDD"  type="text" name="ntceBgndeYYYMMDD" maxlength="10" title="게시기간" value="<c:out value="${fn:substring(bannerManageVO.ntceBgnde, 0, 4)}"/>-<c:out value="${fn:substring(bannerManageVO.ntceBgnde, 4, 6)}"/>-<c:out value="${fn:substring(bannerManageVO.ntceBgnde, 6, 8)}"/>"  />
									<div class="col-1">
									<select  id="ntceBgndeHH"  name="ntceBgndeHH">
										<c:forEach var="obj" items="${ntceBgndeHH}">
									  		<option <c:if test="${bannerManageVO.ntceBgndeHH eq obj.code}">selected="selected"</c:if> value="${obj.code}">${obj.code}</option>
									  	</c:forEach>
									</select>
									</div>
									 :
									<div class="col-1">
									<select id="ntceBgndeMM" name="ntceBgndeMM">
										<c:forEach var="obj" items="${ntceBgndeMM}">
									  		<option <c:if test="${bannerManageVO.ntceBgndeMM eq obj.code}">selected="selected"</c:if> value="${obj.code}">${obj.code}</option>
									  	</c:forEach>
									</select>
									</div>
									&nbsp;~&nbsp;
									<input class="calendar"  id="ntceEnddeYYYMMDD" type="text" name="ntceEnddeYYYMMDD" maxlength="10" title="게시기간" value="<c:out value="${fn:substring(bannerManageVO.ntceEndde, 0, 4)}"/>-<c:out value="${fn:substring(bannerManageVO.ntceEndde, 4, 6)}"/>-<c:out value="${fn:substring(bannerManageVO.ntceEndde, 6, 8)}"/>"  />
									<div class="col-1">
									<select id="ntceEnddeHH" name="ntceEnddeHH" >
										<c:forEach var="obj" items="${ntceEnddeHH}">
									  		<option <c:if test="${bannerManageVO.ntceEnddeHH eq obj.code}">selected="selected"</c:if> value="${obj.code}">${obj.code}</option>
									  	</c:forEach>
									</select>
									</div>
									:
									<div class="col-1">
									<select id="ntceEnddeMM" name="ntceEnddeMM">
										<c:forEach var="obj" items="${ntceEnddeMM}">
									  		<option <c:if test="${bannerManageVO.ntceEnddeMM eq obj.code}">selected="selected"</c:if> value="${obj.code}">${obj.code}</option>
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
	    <input name="bannerId" type="hidden" value="${bannerManageVO.bannerId}">
	    <input name="cmd" type="hidden" value="<c:out value='save'/>"/>
	    <input type="hidden" id="ntceBgnde" name="ntceBgnde"  />
	    <input type="hidden" id="ntceEndde" name="ntceEndde"  />
    </form>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fn_save_BannerManage(); return false;">수정</button>
            <button type="button" class="btn btn-gray btn-lg" onclick="javascript:fn_delete_BannerManage(); return false;">삭제</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javascript:fnListPage(); return false;">목록</button>
        </div>
    </div>
</section>
<!-- panel -->