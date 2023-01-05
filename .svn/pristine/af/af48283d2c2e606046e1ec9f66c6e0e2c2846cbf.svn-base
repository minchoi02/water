<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:importAttribute name="list_headmenu"/>
<tiles:importAttribute name="list_menulist"/>

<!-- <div id="skipNav" class="invisible"> -->
<!--     <dl> -->
<!--         <dt>콘텐츠 바로가기</dt> -->
<!--         <dd><a href="#content">컨텐츠 바로가기</a></dd> -->
<!--         <dd><a href="#topnavi">메인메뉴 바로가기</a></dd> -->
<!--         <dd><a href="#leftmenu">좌메뉴 바로가기</a></dd> -->
<!--     </dl> -->
<!-- </div> -->

<script type="text/javascript">

function fnMyPage(uniqId) {
    document.myPageForm.submit();
}
</script>

    <div class="header-logo">
        <c:if test="${LoginVO.authorCode == 'ROLE_ADMIN' }">
            <h1><a href="<c:url value='/admin/main/mainPage.do'/>" title = "상수도 원격검침 시스템"><em class="hidden">상수도 원격검침 시스템</em></a></h1>
        </c:if>
        <c:if test="${LoginVO.authorCode != 'ROLE_ADMIN' }">
            <h1><a href="<c:url value='/cmm/main/mainPage.do'/>" title = "상수도 원격검침 시스템"><em class="hidden">상수도 원격검침 시스템</em></a></h1>
        </c:if>
    </div>
    <ul class="user-wrap">
        <li><a href="#modal-user" data-bs-toggle="modal"><i class="fas fa-user-circle"></i><c:out value="${LoginVO.name }"/></a></li>
        <li><a href="#" onclick="document.getElementById('logout-form').submit();"><i class="fas fa-sign-out-alt"></i>LOGOUT</a>
	        <form id="logout-form" action='<c:url value='/cmm/login/logout.do'/>' method="POST">
	           <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	        </form>
        </li>
    </ul>
    <nav class="gnb" id="gnb">
        <h2 class="hidden">메뉴</h2>
        <ul>
            <c:forEach var="result" items="${list_headmenu}" varStatus="status">
                    <li <c:if test="${result.menuNo eq baseMenuNo}"> class="active" </c:if>><a href="#LINK" onclick="javascript:goMenuPage('<c:out value="${result.menuNo}"/>')"><c:out value="${result.menuNm}"/></a></li>
            </c:forEach>
            <c:if test="${fn:length(list_headmenu) == 0 }">
<!--           <li>등록된 메뉴가 없습니다.</li> -->
            </c:if>
        </ul>
    </nav>

    <script>
        document.addEventListener('DOMContentLoaded', function(){
            if(document.querySelector('.darkmode')){
                if(localStorage.getItem("darkmode") == 'on'){
                    document.body.dataset.darkmode='on';
                    document.querySelector('#toggle-radio-dark').checked = true;
                }
                document.querySelector('.darkmode').addEventListener("click", e=>{
                    if(e.target.classList.contains('todark')){
                        document.body.dataset.darkmode='on';
                        localStorage.setItem("darkmode", "on");
                    }else if(e.target.classList.contains('tolight')){
                        document.body.dataset.darkmode='off';
                        localStorage.setItem("darkmode", "off");
                    }
                },false);
            }else{
                localStorage.removeItem("darkmode");
            }
        })
    </script>

<!-- modal-user -->
<div class="modal fade" id="modal-user" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                	<h3>회원 정보</h3>
                	<button type="button" class="btn-close text-reset" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h4>상세정보</h4>
                    <button type="button" onclick="javascript:location.href='/cmm/main/UserUpdtView.do?selectedId=${LoginVO.uniqId}';" class="btn btn-secondary btn-xsm float-right">수정</button>
                    <div class="border-list-default">
                        <div class="flex">
                            <div class="thumbnail thumbnail-sm"></div>
                            <div class="list-area">
                            <%
                                LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
                                if(loginVO == null){
                            %>
						        <ul>
						            <li>로그인정보 없음</li>
						            <li><a href="#" >로그인</a></li>
						            <li>로그인후 사용하십시오</li>
						        </ul>
					        <%
                                }else{
					        %>
	                            <c:set var="loginName" value="<%= loginVO.getName()%>"/>
                                <c:set var="uniqId" value="<%= loginVO.getUniqId()%>"/>
                                <c:set var="id" value="<%= loginVO.getId() %>"/>
                                <c:set var="deptId" value="<%= loginVO.getDeptId() %>"/>
                                <c:set var="moblphonNo" value="<%= loginVO.getMoblphonNo() %>"/>
                                <c:set var="codeNm" value="<%= loginVO.getCodeNm() %>"/>
                                <c:set var="authorcode" value="<%= loginVO.getAuthorCode() %>"/>
                                <ul class="list-area-item">
                                    <li><a href="#LINK" onclick="javascript:location.href='/cmm/main/UserUpdtView.do?selectedId=${LoginVO.uniqId}';"><c:out value="${loginName}"/> 님</a></li>
                                    <li>ID : <c:out value="${id}"/></li>
                                    <li> <c:out value="${codeNm}"/> / <c:out value="${deptId}"/></li>
                                    <li><c:out value="${moblphonNo}"/></li>
                                </ul>
                            <%
                                }
                            %>
                            </div>
                        </div>
                    </div>
                    <h4>최근게시물</h4>
                    <div class="table-box table-hover">
                        <table>
                            <caption>테이블 기본</caption>
                            <colgroup>
                                <col style="width:5%;">
                                <col style="width:15%;">
                                <col style="width:auto;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col style="width:10%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">순번</th>
                                    <th scope="col">게시판명</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">댓/답글</th>
                                    <th scope="col">작성일시</th>
                                    <th scope="col">본문</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>5</td>
                                    <td>게시판명</td>
                                    <td>제목</td>
                                    <td>댓/답글</td>
                                    <td>작성일시</td>
                                    <td><a href="#" class="btn btn-default btn-auto" title="새창으로 열립니다."><i class="fas fa-external-link-alt"></i></a></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>게시판명</td>
                                    <td>제목</td>
                                    <td>댓/답글</td>
                                    <td>작성일시</td>
                                    <td><a href="#" class="btn btn-default btn-auto" title="새창으로 열립니다."><i class="fas fa-external-link-alt"></i></a></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>게시판명</td>
                                    <td>제목</td>
                                    <td>댓/답글</td>
                                    <td>작성일시</td>
                                    <td><a href="#" class="btn btn-default btn-auto" title="새창으로 열립니다."><i class="fas fa-external-link-alt"></i></a></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>게시판명</td>
                                    <td>제목</td>
                                    <td>댓/답글</td>
                                    <td>작성일시</td>
                                    <td><a href="#" class="btn btn-default btn-auto" title="새창으로 열립니다."><i class="fas fa-external-link-alt"></i></a></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>게시판명</td>
                                    <td>제목</td>
                                    <td>댓/답글</td>
                                    <td>작성일시</td>
                                    <td><a href="#" class="btn btn-default btn-auto" title="새창으로 열립니다."><i class="fas fa-external-link-alt"></i></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-area">
                        <button type="button" class="btn btn-default btn-lg" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- <div id="logoarea"> -->
<%-- 	<h1><a href="<c:url value='/'/>cmm/login/actionMain.do"><img src="<c:url value='/'/>images/header/logo.png" alt="충청남도 지정문화재관리 시스템" /></a></h1> --%>
<!-- </div> -->
<!--div id="project_title">
	<span class="maintitle">충청남도 </span><strong>문화재 내부업무 사이트</strong>
</div-->
