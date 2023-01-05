<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<script type="text/javascript">
function fncGoAfterErrorPage(){
    history.back(-2);
}
</script>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link type="text/css" rel="shortcut icon" href="/water/images/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="viewport" content="width=1920" />
<title>상수도 원격검침 시스템</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link type="text/css" rel="stylesheet" href="/water/css/common.css" />
</head>
<body>
    <!-- error -->
    <div class="error-wrap">
        <div class="error">
            <h1><em class="hidden">상수도 원격검침 시스템</em></h1>
            <div class="error-body">
                <p>
                    <i class="fas fa-exclamation-circle"></i>
                    죄송합니다.<br />트랜젝션 수행중 오류가 발생하였습니다.
                </p>
            </div>
            <div class="error-footer">
                <a href="#LINK" class="btn btn-secondary btn-auto" onClick="fncGoAfterErrorPage();">이전 페이지로 돌아가기</a>
            </div>
        </div>
    </div>
    <!-- error -->
</body>
</html>