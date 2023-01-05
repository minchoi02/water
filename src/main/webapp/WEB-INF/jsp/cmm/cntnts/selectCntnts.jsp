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

<script type="text/javaScript">
<!--
function fnUpdate(){
	if(!validateCntntsMstrVO(document.cntntsMstrVO)) return;
    if(!confirm('<spring:message code="common.save.msg" />')) return;

    document.cntntsMstrVO.submit();
}

function fnListPage() {
	document.cntntsMstrVO.action = "<c:url value='/sys/cntnts/CntntsMstrManage.do'/>";
    document.cntntsMstrVO.submit();
}

function fnDelete() {
	if(!confirm('<spring:message code="common.delete.msg" />')) return;
	document.cntntsMstrVO.action = "<c:url value='/sys/cntnts/CntntsMstrDelete.do'/>";
    document.cntntsMstrVO.submit();
}
//-->
</script>
    <div id="sub_con_wrap">
    	${cntntsMstrVO.cntntsCn}
	</div>
