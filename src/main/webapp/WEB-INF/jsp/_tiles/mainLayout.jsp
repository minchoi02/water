<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:importAttribute name="list_headmenu"/>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ page import ="java.util.List" %>
<%@ page import ="egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper" %>

<!DOCTYPE html>
<html lang="ko">
<link type="text/css" rel="shortcut icon" href="/water/images/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="viewport" content="width=1920" />
<meta http-equiv="Content-Language" content="ko" >
<title>(사용자)상수도 원격검침 시스템</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<link type="text/css" rel="stylesheet" href="/water/css/common.css" />


<link rel="stylesheet" href="/js/jquery/jquery-ui.css">

<script src="/js/jquery/jquery-3.5.1.min.js"></script>
<script src="<c:url value='/js/jquery/jquery-ui.js'/>" ></script>
<script src="<c:url value='/js/jquery_chained/jquery.chained.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/showModalDialogCallee.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 전체 레이어 시작 -->

<div id="wrap" class="main-wrap">
    <div class="main-area">
         <!-- header 시작 -->
	    <header class="header-wrap">
			<tiles:insertAttribute name="top" />
			<tiles:insertAttribute name="header" />
		</header>
		<div id="topnavi"><tiles:insertAttribute name="topNav" /></div>
		<!-- header 끝 -->
		<!-- main_container -->
		<div id="main_container" class="container container-wrap">
            <div id="content"><tiles:insertAttribute name="content" />
            </div>
        </div>

    </div>
</div>
 <!-- footer 시작 -->
 <div><tiles:insertAttribute name="footer" /></div>
 <!-- //footer 끝 -->
<form id="myPageForm" name="myPageForm" action="/sys/user/urm/UserSelectUpdtView.do" method="post">
	<input type="hidden" name="selectedId" value="${uniqId}">
	<input type="hidden" name="reqFlag" value="user">
</form>

<!-- //전체 레이어 끝 -->
</body>
</html>