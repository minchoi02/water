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
<validator:javascript formName="menuManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<%-- <link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" > --%>
<script type="text/javaScript">
<!--
/* ********************************************************
 * 수정처리 함수
 ******************************************************** */
function updateMenuManage(form) {
    if($("#menuOrdr").val()==0){
        alert("메뉴순서를 입력해주세요");
        return false;
    }
    if(!validateMenuManageVO(form)){
        return;
    }else{
    	if(confirm("<spring:message code='common.save.msg' />")){
    	$('input[name="menuType"]').val($('input[name="menuTypeR"]:checked').val());
         form.action="<c:url value='/sys/menu/mlm/MenuDetailSelectUpdt.do'/>";
         form.submit();
    	}
    }
}

/* ********************************************************
 * 삭제처리함수
 ******************************************************** */
function deleteMenuManage(form) {
    if(confirm("<spring:message code='common.delete.msg' />")){
        form.action="<c:url value='/sys/menu/mlm/MenuManageDelete.do'/>";
        form.submit();
    }
}
/* ********************************************************
 * 게시판목록조회  함수
 ******************************************************** */
function searchBbsNm() {
    document.all.tmp_SearchElementName.value = "progrmFileNm";
    window.open("<c:url value='/sys/menu/mlm/BbsListSearch.do'/>",'','width=800,height=680');
}
/* ********************************************************
 * 컨텐츠목록조회  함수
 ******************************************************** */
function searchCntntsNm() {
    document.all.tmp_SearchElementName.value = "progrmFileNm";
    window.open("<c:url value='/sys/menu/mlm/CntntsListSearch.do'/>",'','width=800,height=680,top=100,left=100');
}
/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
    console.log(document.menuManageVO);
    document.menuManageVO.action = "<c:url value='/sys/menu/mlm/MenuManage.do'/>";
    document.menuManageVO.submit();
}

/* ********************************************************
 * 파일명 엔터key 목록조회  함수
 ******************************************************** */
function press() {
    if (event.keyCode==13) {
        searchFileNm();    // 원래 검색 function 호출
    }
}
function cheangeMenuType(menuType){
	if(menuType==1){
	    $("#menuType1").show();
	    $("#menuType2").hide();
	    $("#menuType3").hide();
	    $("#menuType4").hide();
	    $("#url").val('');
	}else if(menuType==2){
	    $("#menuType1").hide();
	    $("#menuType2").show();
	    $("#menuType3").hide();
	    $("#menuType4").hide();
	    $("#url").val('');
	}else if(menuType==3){
	    $("#menuType1").hide();
	    $("#menuType2").hide();
	    $("#menuType3").show();
	    $("#menuType4").hide();
	    $("#url").val('');
	}else{
	    $("#menuType1").hide();
	    $("#menuType2").hide();
	    $("#menuType3").hide();
	    $("#menuType4").show();
	    $("#url").val('');
	}
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>메뉴 수정</h3>
    </div>
    <form:form commandName="menuManageVO" name="menuManageVO" method="post" action="${pageContext.request.contextPath}/sys/menu/mlm/MenuDetailSelectUpdt.do">
        <div class="panel-body">
            <p class="required"><span class="red">*</span>표기는 필수 입력사항</p>
            <div class="table-box table-row table-col-6 y-scroll content-height-1">
                <table>
                    <caption>메뉴 수정</caption>
                    <colgroup>
                        <col style="width:300px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">메뉴번호</th>
                            <td>
                                <div>
                                    <c:out value="${menuManageVO.menuNo}"/>
                                    <form:hidden path="menuNo" />
                                    <form:errors path="menuNo" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">메뉴순서</th>
                            <td>
                                <div>
                                    <form:input path="menuOrdr" size="10" maxlength="10" title="메뉴순서" />
                                     <form:errors path="menuOrdr" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">메뉴명</th>
                            <td>
                                <div>
                                    <form:input path="menuNm" size="30"  maxlength="30" title="메뉴명" placeholder="입력하세요."/>
                                    <form:errors path="menuNm" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">메뉴 설명</th>
                            <td>
                                <div>
                                    <form:input path="menuDc" rows="14" cols="75" title="메뉴설명" placeholder="입력하세요."/>
                                    <form:errors path="menuDc"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">상위메뉴번호</th>
                            <td>
                                <div>
                                    <form:input path="upperMenuId" rows="14" cols="75" title="상위메뉴번호" placeholder="입력하세요."/>
                                    <form:errors path="upperMenuId"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">사용여부</th>
                            <td>
                                <div class="label-input">
                                    <label><input type="radio" name = "useAt"  id="useAt" value="Y" <c:if test="${menuManageVO.useAt eq 'Y' }">checked</c:if> />사용</label>
                                    <label><input type="radio" name = "useAt"  id="useAt" value="N" <c:if test="${menuManageVO.useAt eq 'N' }">checked</c:if>/>미사용</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">타입 선택</th>
                            <td>
                                <div class="label-input">
                                    <label><input type="radio" name="menuTypeR" value="1" onclick="cheangeMenuType('1')" <c:if test="${menuManageVO.menuType eq 1 }">checked</c:if>/>콘텐츠</label>
                                    <label><input type="radio" name="menuTypeR" value="2" onclick="cheangeMenuType('2')" <c:if test="${menuManageVO.menuType eq 2 }">checked</c:if>/>프로그램</label>
                                    <label><input type="radio" name="menuTypeR" value="3" onclick="cheangeMenuType('3')" <c:if test="${menuManageVO.menuType eq 3 }">checked</c:if>/>링크</label>
                                    <label><input type="radio" name="menuTypeR" value="4" onclick="cheangeMenuType('4')" <c:if test="${menuManageVO.menuType eq 4 }">checked</c:if>/>게시판</label>
                                </div>
                                <div class="label-input mt15">
                                URL:<input  name="url" id="url" type="text"  value="${menuManageVO.url}"/>
                                <div id="menuType1">
						      		 <a href="<c:url value='/sys/menu/mlm/CntntsListSearch.do'/>?tmp_SearchElementName=cntntsNm" target="_blank" title="새창으로 이동" onclick="searchCntntsNm();return false;"  style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/img_search.png' />"
                                 alt='' width="15" height="15" /></a>
						      	</div>
						      	<div id="menuType2" style="display: none;">
						      	</div>
						      	<div id="menuType3" style="display: none;">
						      	</div>
						      	<div id="menuType4" style="display: none;">
						      		 <a href="<c:url value='/sys/menu/mlm/BbsListSearch.do'/>?tmp_SearchElementName=BbsNm" target="_blank" title="새창으로 이동" onclick="searchBbsNm();return false;"  style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/img_search.png' />"
                                 alt='' width="15" height="15" /></a>
						      	</div>

                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 검색조건 유지 -->
        <input type="hidden" name="menuType" value=""/>
        <input type="hidden" name="selectMenuId" value=""/>
        <input type="hidden" name="tmp_SearchElementName" value=""/>
        <input type="hidden" name="tmp_SearchElementVal" value=""/>
        <input name="cmd"    type="hidden"   value="update"/>
        <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
		<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/><c:if test="${searchVO.pageIndex eq null}">1</c:if>"/>
       <!-- 검색조건 유지 -->
    </form:form>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:updateMenuManage(document.getElementById('menuManageVO')); return false;">변경내용 저장</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javascript:selectList(); return false;">목록</button>
        </div>
    </div>
</section>
<!-- panel -->

<!-- modal -->
<div class="modal fade" id="modal-find" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>상위 메뉴 선택</h3>
            </div>
                <div class="modal-body">
                    <div class="tree-area">
                        <div class="list-tree-area">
                           <ul>
                                <li><a href="#"><i class="fa fa-folder"></i>대메뉴1</a>
                                    <ul>
                                        <li><a href="#"><i class="far fa-file"></i>메뉴1</a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><i class="fa fa-folder"></i>대메뉴2</a>
                                    <ul>
                                        <li><a href="#"><i class="far fa-file"></i>메뉴2</a></li>
                                        <li><a href="#"><i class="far fa-file"></i>메뉴3</a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><i class="fa fa-folder"></i>대메뉴3</a>
                                    <ul>
                                        <li><a href="#"><i class="far fa-file"></i>메뉴4</a></li>
                                        <li><a href="#"><i class="far fa-file"></i>메뉴5</a></li>
                                        <li><a href="#"><i class="far fa-file"></i>메뉴6</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            <div class="modal-footer">
                <div class="btn-area">
                    <button type="button" class="btn btn-primary btn-lg">선택</button>
                    <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- modal -->
<!-- modal -->
<div class="modal fade" id="modal-con" role="dialog">
    <div class="modal-dialog modal-default">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>콘텐츠 선택</h3>
            </div>
            <div class="modal-body">
                <div class="table-box table-row">
                    <table>
                        <caption>콘텐츠 선택</caption>
                        <colgroup>
                            <col style="width:200px;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">콘텐츠 구성</th>
                                <td>
                                    <div>
                                        <select>
                                            <option value="1">단일</option>
                                            <option value="2">텝메뉴</option>
                                            <option value="3">목차메뉴</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">콘텐츠명</th>
                                <td>
                                    <div>
                                        <input type="text" placeholder="입력하세요." />
                                        <button type="button" class="btn btn-default">검색</button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-box mt-gutter">
                    <table>
                        <caption>콘텐츠 선택</caption>
                        <colgroup>
                            <col style="width:60%;">
                            <col style="width:20%;">
                            <col style="width:20%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">콘텐츠명</th>
                                <th scope="col">타입</th>
                                <th scope="col">선택</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>TEST1 - test</td>
                                <td>일반</td>
                                <td><button type="button" class="btn btn-default">선택</button></td>
                            </tr>
                            <tr>
                                <td>TEST2 - test</td>
                                <td>일반</td>
                                <td><button type="button" class="btn btn-default">선택</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-area">
                    <button type="button" class="btn btn-primary btn-lg">선택</button>
                    <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- modal -->
<!-- modal -->
<div class="modal fade" id="modal-charge" role="dialog">
    <div class="modal-dialog modal-default">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>담당자 검색</h3>
            </div>
            <div class="modal-body">
                <div class="table-box">
                    <table>
                        <caption>담당자 목록</caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col style="width:auto;">
                            <col style="width:15%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col"><input type="checkbox" /></th>
                                <th scope="col">순번</th>
                                <th scope="col">소속기관</th>
                                <th scope="col">부서</th>
                                <th scope="col">이메일</th>
                                <th scope="col">이름</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" /></td>
                                <td>1</td>
                                <td>소속기관</td>
                                <td>부서</td>
                                <td>이메일</td>
                                <td>이름</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" /></td>
                                <td>2</td>
                                <td>소속기관</td>
                                <td>부서</td>
                                <td>이메일</td>
                                <td>이름</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" /></td>
                                <td>3</td>
                                <td>소속기관</td>
                                <td>부서</td>
                                <td>이메일</td>
                                <td>이름</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" /></td>
                                <td>4</td>
                                <td>소속기관</td>
                                <td>부서</td>
                                <td>이메일</td>
                                <td>이름</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" /></td>
                                <td>5</td>
                                <td>소속기관</td>
                                <td>부서</td>
                                <td>이메일</td>
                                <td>이름</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-area">
                    <button type="button" class="btn btn-primary btn-lg">선택</button>
                    <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- modal -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });

        //file
        var fileTarget = $('.file-area .hidden');
            fileTarget.on('change', function(){
                if(window.FileReader){
                    var filename = $(this)[0].files[0].name;
                } else {
                    var filename = $(this).val().split('/').pop().split('\\').pop();
                }
                $(this).siblings('.upload-name').val(filename);
        });
    });
</script>