<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

                <!-- 검색 필드 박스 시작 -->
                <h2><strong>로그인 로그 정보</strong></h2>
                <form name="Form" method="post" action="#LINK" >
                    <div class="popop_detail" >
                        <table>
					     <tr>
					        <th width="20%" height="23" align="center">로그ID</th>
					        <td width="80%" nowrap >&nbsp;&nbsp;
					          <c:out value="${result.logId}"/>
					        </td>
					      </tr>
					     <tr>
					        <th width="20%" height="23" align="center">발생일자</th>
					        <td width="80%" nowrap >&nbsp;&nbsp;
					          <c:out value="${result.creatDt}"/>
					        </td>
					      </tr>
					     <tr>
					        <th width="20%" height="23" align="center">로그유형</th>
					        <td width="80%" nowrap >&nbsp;&nbsp;
					          <c:out value="${result.loginMthd}"/>
					        </td>
					      </tr>
					     <tr>
					        <th width="20%" height="23" align="center">요청자</th>
					        <td width="80%" nowrap >&nbsp;&nbsp;
					          <c:out value="${result.loginNm}"/>
					        </td>
					      </tr>
					     <tr>
					        <th width="20%" height="23" align="center">요청자IP</th>
					        <td width="80%" nowrap >&nbsp;&nbsp;
					          <c:out value="${result.loginIp}"/>
					        </td>
					      </tr>
                        </table>
                    </div>

                    <!-- 버튼 시작(상세지정 style로 div에 지정) -->
                    <div class="buttons" style="padding-top:10px;padding-bottom:10px;">
                        <!-- 목록/저장버튼  -->
                        <table border="0">
                        <tr>
                          <td>
                            <a href="#LINK" onclick="javascript:window.close(); return false;"><spring:message code="button.close" /></a>
                          </td>
                        </tr>
                        </table>
                    </div>
                    <!-- 버튼 끝 -->

                    <!-- 검색조건 유지 -->
                    <!-- 검색조건 유지 -->
                </form>
