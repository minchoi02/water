<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 목록 화면 function */
function fn_List() {
    document.customerInfoVO.action = "<c:url value='/asset/customer/CustomerInfoList.do'/>";
    document.customerInfoVO.submit();
}

/* 글 등록 function */
function fn_Save() {
    document.customerInfoVO.submit();
}

// -->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>고객 등록</h3>
    </div>
    <form:form commandName="customerInfoVO" name="customerInfoVO" action="${pageContext.request.contextPath}/asset/customer/addCustomerInfo.do" method="post">

     <div class="panel-body">
         <div class="table-box table-row table-col-6 y-scroll content-height-1">
            <table>
                <tr>
                    <th scope="col" class="essential"><span>고객번호</span></th>
                    <td colspan="4">
                        <form:input path="customerNum" id="customerNum" title="고객번호"/>
                        <form:errors path="customerNum" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <th scope="col" class="essential"><span>고지자명</span></th>
                    <td colspan="4">
                        <form:input path="customerName" id="customerName" title="고지자명"/>
                        <form:errors path="customerName" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <th scope="col" class="essential"><span>위치정보</span></th>
                    <td style="text-align: center;">X : </td>
                    <td>
                        <form:input path="lat" id="lat" title="위도"/>
                        <form:errors path="lat" cssClass="error" />
                    </td>
                    <td style="text-align: center;">Y : </td>
                    <td>
                        <form:input path="lot" id="lot" title="경도"/>
                        <form:errors path="lot" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <th scope="col"><span>도로명주소</span></th>
                    <td colspan="3">
                        <form:input path="detailAddr" id="detailAddr" title="도로명주소"/>
                        <form:errors path="detailAddr" cssClass="error" />
                    </td>
                    <td style="text-align: center;"><button type="button" class="btn btn-gray btn-lg">우편번호 찾기</button></td>
                </tr>
                <tr>
                    <th scope="col" class="essential"><span>관리사업소</span></th>
                    <td colspan="4">
                        <form:input path="manageBizplc" id="manageBizplc" title="관리사업소"/>
                        <form:errors path="manageBizplc" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <th scope="col" class="essential"><span>담당자명</span></th>
                    <td colspan="3">
                        <form:input path="chargerNm" id="chargerNm" title="관리사업소"/>
                        <form:errors path="chargerNm" cssClass="error" />
                    </td>
                    <td style="text-align: center;"><button type="button" class="btn btn-gray btn-lg">담당자 검색</button></td>
                </tr>
            </table>
        </div>
    </div>

    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

    </form:form>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javaScript:fn_Save(); return false;">등록</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javaScript:fn_List(); return false;">목록</button>
        </div>
    </div>
</section>