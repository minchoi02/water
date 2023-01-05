<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<script type="text/javascript">

	function fn_select_sysLog(pageNo){
		var fromDate = document.frm.searchBgnDe.value;
		var toDate = document.frm.searchEndDe.value;

		if(fromDate > toDate) {
	        alert("종료일자는 시작일자보다  이후날짜로 선택하세요.");
	        return false;
	    } else {
				document.frm.pageIndex.value = pageNo;
				document.frm.action = "<c:url value='/sys/log/lgm/SelectSysLogList.do'/>";
				document.frm.submit();
	    }
	}

	function fn_inqire_sysLog(requstId){
		var url = "<c:url value='/sys/log/lgm/InqireSysLog.do' />?requstId="+requstId;
		var openParam = "scrollbars=yes,toolbar=0,location=no,resizable=0,status=0,menubar=0,width=750,height=340,left=0,top=0";
		window.open(url,"p_sysLogInqire", openParam);
	}

</script>

<form name="frm" action ="<c:url value='/sys/log/lgm/SelectSysLogList.do'/>" method="post">

 <table class="table-search" border="0">

	 <tr>
	  <td class="title_left"><h1 class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;시스템 로그조회</h1></td>
	  <th>
	  	<label for="searchBgnDeView">발생일자</label>
	  </th>
	  <td>
		  <input name="searchBgnDe" type="hidden"  value="<c:out value='${searchVO.searchBgnDe}'/>">

	      <input name="searchBgnDeView" type="text" size="10" value="${searchVO.searchBgnDeView}" readOnly
	      	onClick="javascript:fn_NormalCalendar(document.frm, document.frm.searchBgnDe, document.frm.searchBgnDeView);" id="searchBgnDeView">
	      <a href="#noscript" onclick="fn_NormalCalendar(document.frm, document.frm.searchBgnDe, document.frm.searchBgnDeView); return false;"
	    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		    width="15" height="15"></a>
	      <label for="searchEndDeView">~</label>
	      <input name="searchEndDe" type="hidden"  value="<c:out value='${searchVO.searchEndDe}'/>">

	     <input name="searchEndDeView" type="text" size="10" value="${searchVO.searchEndDeView}"  readOnly
	      	onClick="javascript:fn_NormalCalendar(document.frm, document.frm.searchEndDe, document.frm.searchEndDeView);" id="searchEndDeView">
	      <a href="#noscript" onclick="fn_NormalCalendar(document.frm, document.frm.searchEndDe, document.frm.searchEndDeView); return false;"
	    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		    width="15" height="15"></a>
		</td>
		<td><label for="searchWrd">처리구분</label></td>
	  <td>
	    <input name="searchWrd" type="text" size="15" value="<c:out value='${searchVO.searchWrd}'/>"  maxlength="15" id="searchWrd" title="검색단어입력" >
	  </td>
	  <th>
	   <table border="0">
	    <tr>
	      <!--
	      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
	      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
	      <a href="#noscript" onclick="fn_select_sysLog('1'); return false;"><spring:message code="button.inquire" /></a>
	      </td>
	      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	      -->
	      <td><span class="button"><input type="submit" value="조회" onclick="fn_select_sysLog('1'); return false;"></span></td>
	    </tr>
	   </table>
	  </th>
	 </tr>
	</table>
	<table class="table-line" summary="요청ID, 발생일자, 메소드명, 처리구분, 처리시간, 요청자의 정보를 보여주는 시스템 로그 목록 테이블이다.">
	<CAPTION style="display: none;">시스템 로그 조회</CAPTION>
	 <thead>
	  <tr>
	    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
	    <th class="title" width="5%"  scope="col" nowrap>번호</th>
	    <th class="title" width="15%" scope="col" nowrap>요청ID</th>
	    <th class="title" width="10%" scope="col" nowrap>발생일자</th>
	    <th class="title" width="35%" scope="col" nowrap>메소드명</th>
	    <th class="title" width="10%" scope="col" nowrap>처리구분</th>
	    <th class="title" width="10%" scope="col" nowrap>처리시간</th>
	    <th class="title" width="10%" scope="col" nowrap>요청자</th>
	    <th class="title" width="5%"  scope="col" nowrap>상세보기</th>
	  </tr>
	 </thead>
	 <tbody>
	 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
	<c:if test="${fn:length(resultList) == 0}">
	<tr>
	<td class="lt_text3" colspan="8">
		<spring:message code="common.nodata.msg" />
	</td>
	</tr>
	</c:if>
	 <c:forEach var="result" items="${resultList}" varStatus="status">
	  <tr>
	    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
	    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
	    <td class="lt_text3" nowrap><c:out value="${result.requstId}"/></td>
	    <td class="lt_text3" nowrap><c:out value="${result.occrrncDe}"/></td>
	    <td class="lt_text3" nowrap><c:out value="${result.methodNm}"/></td>
	    <td class="lt_text3" nowrap><c:out value="${result.processSeCodeNm}"/></td>
	    <td class="lt_text3" nowrap><c:out value="${result.processTime}"/></td>
	    <td class="lt_text3" nowrap><c:out value="${result.rqsterNm}"/></td>
	    <td class="lt_text3" nowrap>
	    <a href="#noscript" onclick="fn_inqire_sysLog('<c:out value="${result.requstId}"/>'); return false;"
	    	style="selector-dummy:expression(this.hideFocus=false);">
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif'/>"  alt="상세보기(새창)"
	    	width="15" height="15" style="vertical-align: middle"></a>
	    </td>
	  </tr>
	 </c:forEach>


	 </tbody>
	 <!--tfoot>
	  <tr class="">
	   <td colspan=6 align="center"></td>
	  </tr>
	 </tfoot -->
	</table>
<table border="0">
  <tr>
    <td height="10"></td>
  </tr>
  <tr><td>
	<div align="center">
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_select_sysLog" />
	</div>
  </td></tr>
</table>
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>

