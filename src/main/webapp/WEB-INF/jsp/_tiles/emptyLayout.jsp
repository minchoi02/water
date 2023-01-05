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



<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>상수도 원격검침 시스템</title>

<link href="<c:url value='/css/common.css' />" rel="stylesheet" type="text/css" >
<link href="<c:url value='/css/board.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/button.css' />" rel="stylesheet" type="text/css">
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
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<tiles:insertAttribute name="content" />
</body>
</html>