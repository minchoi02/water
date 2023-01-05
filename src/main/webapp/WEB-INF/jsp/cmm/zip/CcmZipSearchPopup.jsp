<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/cmm/main/inc/incTop.jsp" %>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/zip.css'/>" >
</head>
<body>
<form name="pForm" action="<c:url value='sys/code/zip/CcmZipSearchPopup.do'/>">
<input type="hidden" name="init" value="">
</form>
<!-- IE
<iframe name="ifcal" src="<c:url value='/sym/cmm/EgovCcmZipSearchList.do'/>" style="width:500px; height:325px;" frameborder=0></iframe>
-->
<!-- FIREFOX -->
<iframe name="ifcal" title="우편번호찾기 팝업" src="<c:url value='/sys/code/zip/CcmZipSearchList.do'/>" style="width:100%; height:100%;"></iframe>
</body>
</html>