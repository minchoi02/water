<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>


<c:url var="ImgUrl" value="/images"/>
<validator:javascript formName="progrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript">
<!--
/* ********************************************************
 * 입력 처리 함수
 ******************************************************** */
function insertProgramListManage(form) {
    if(confirm("<spring:message code="common.save.msg" />")){
        if(!validateProgrmManageVO(form)){
            return;
        }else{
            form.action="<c:url value='/sys/menu/plm/ProgramListRegist.do'/>";
            form.submit();
        }
    }
}
/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
    document.progrmManageVO.action = "<c:url value='/sys/menu/plm/ProgramListManage.do'/>";
    document.progrmManageVO.submit();
}

/* ********************************************************
 * focus 시작점 지정함수
 ******************************************************** */
 function fn_FocusStart(){
        var objFocus = document.getElementById('F1');
        objFocus.focus();
    }


<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>시스템관리</li>
                            <li>메뉴관리</li>
                            <li class="last"><strong>프로그램관리</strong></li>
                        </ul>
                    </div>
                </div>

                <div class="sub_tit_wrap">
  					<h2>프로그램관리 <strong>등록</strong></h2>
                </div>
                <div id="sub_con_wrap">
                <form:form commandName="progrmManageVO"  action="/sys/menu/plm/ProgramListRegist.do" method="post" name="progrmManageVO" >
					<div class="info_txt1">
	                	<span>*</span>표기는 필수 입력사항
	                </div>
                    <div class="tablestyle_2" >
                        <table summary="프로그램목록 등록">
                          <tr>
						    <th scope="col" class="essential"><span>프로그램 파일명</span></th>
						    <td nowrap="nowrap">
						      <form:input path="progrmFileNm" size="50"  maxlength="50" id="F1" title="프로그램파일명" class="input_style1 input_w1"/>
						      <form:errors path="progrmFileNm" />
						    </td>
						  </tr>
						  <tr>
						    <th scope="col" class="essential"><span>저장경로</span></th>
						    <td nowrap="nowrap">
						      <form:input path="progrmStrePath"  size="60"   maxlength="60" title="저장경로" class="input_style1 input_w1"/>
						      <form:errors path="progrmStrePath" />
						    </td>
						  </tr>
						  <tr>
						    <th scope="col" class="essential"><span>프로그램 한글명</span></th>
						    <td nowrap="nowrap">
						      <form:input path="progrmKoreanNm" size="60"  maxlength="50" title="프로그램 한글명" class="input_style1 input_w1"/>
						      <form:errors path="progrmKoreanNm"/>
						    </td>
						  </tr>
						  <tr>
						    <th scope="col" class="essential"><span>URL</span></th>
						    <td nowrap="nowrap">
						      <form:input path="URL" size="60"    maxlength="60" title="URL" class="input_style1 input_w1"/>
						      <form:errors path="URL"/>
						    </td>
						  </tr>
						  <tr>
						    <th scope="col"><span>프로그램 설명</span></th>
						    <td>
						      <form:textarea path="progrmDc" rows="14" cols="75" cssClass="input_style1 input_w3 input_h1" title="프로그램설명"/>
						      <form:errors path="progrmDc"/>
						    </td>
						  </tr>
                        </table>
                    </div>

                    <!-- 버튼 시작(상세지정 style로 div에 지정) -->
                    <div class="board_btn_wrap">
                		<a href="#LINK" onclick="javascript:insertProgramListManage(document.getElementById('progrmManageVO')); return false;" class="board_btn"><spring:message code="button.save" /></a>
                		<a href="#LINK" onclick="selectList(); return false;" class="board_btn"><spring:message code="button.list" /></a>
	                </div>
                    <!-- 버튼 끝 -->

                    <!-- 검색조건 유지 -->
                    <input name="cmd" type="hidden" value="<c:out value='insert'/>"/>
                    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
			        <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
			        <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/><c:if test="${searchVO.pageIndex eq null}">1</c:if>"/>
                    <!-- 검색조건 유지 -->
                </form:form>
			</div>

