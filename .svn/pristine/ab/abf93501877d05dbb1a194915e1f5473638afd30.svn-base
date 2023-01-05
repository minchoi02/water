<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ page import ="java.util.List" %>
<%@ page import ="egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper" %>
<script type="text/javaScript">


function fnChangeKnd(e) {
	if (e.value == "") {
		$('#kndMclas').empty();
		var option = $("<option value=''>--선택--</option>");
		$('#kndMclas').append(option);
		$('#kndSclas').empty();
		var option2 = $("<option value=''>--선택--</option>");
		$('#kndSclas').append(option2);
	} else {
		$.ajax({
					url : '<c:url value='/icp/icpReqstInfo/selectIcpCodeList.do'/>',
					dataType : 'json',
					data : {
						code : e.value
					},
					success : function(data) {

						$('#kndMclas').empty();

						$('#kndMclas').append(
								"<option value=''>--선택--</option>");
						for (var i = 0; i < data.length; i++) {
							var option = $("<option value="+data[i].code+">"
									+ data[i].codeNm + "</option>");
							$('#kndMclas').append(option);
						}

						$("#kndMclas option").each(function() {
							if (this.value == "${searchVO.kndMclas}") {
								$(this).attr("selected", "selected");
							}
						});
						$('#kndMclas').trigger('change');

					}
				});
	}
}
function gotoTcp(){
    var insttCode = $('#insttCode').val();
    var kndLclas = $('#kndLclas').val();
    var kndMclas = $('#kndMclas').val();
    var searchNm = $('#searchNm').val();
    var param = "";
    if(insttCode!=''){
        param = param+"insttCode="+insttCode;
    }
    if(kndLclas!=''){
        param = param+"&kndLclas="+kndLclas;
    }
    if(kndMclas!=''){
        param = param+"&kndMclas="+kndMclas;
    }
    if(searchNm!=''){
        param = param+"&crltsKoreanNm="+searchNm;
    }
    fn_goManage2('2000000', '/tcp/tcpManageRegstr/TcpManageRegstrList.do', '/tcp/tcpManageRegstr/TcpManageRegstrList.do',"?"+param);
}

function fnMyPage(uniqId) {
	document.myPageForm.submit();
}

function fn_goBbs(bbsId, nodeNum, nttId) {
	document.menuListForm.activeMenuId.value=nodeNum;
	document.getElementById("baseMenuNo").value="8000000";

	if(nttId == '' || nttId == null) document.getElementById("link").value="forward:/cop/bbs/selectBoardList.do?bbsId="+bbsId;
	else document.getElementById("link").value="forward:/cop/bbs/selectBoardArticle.do?bbsId=" + bbsId + "&nttId=" + nttId;

    document.menuListForm.action = "<c:url value='/PageLink.do'/>";
    document.menuListForm.submit();
}

function fn_goManage(baseMenuNo, uurl, url) {
 	var turl;
 	if(uurl != "")
 		turl = uurl;
 	else
 		turl = url;

 	document.getElementById("baseMenuNo").value=baseMenuNo;
    var tNode = new Array;
    for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
        tNode[i] = document.menuListForm.tmp_menuNm[i].value;
        var nValue = tNode[i].split("|");
        if (nValue[5]==turl) {
        	document.menuListForm.activeMenuId.value=i;
        	document.getElementById("link").value="forward:" + url;

            document.menuListForm.action = "<c:url value='/PageLink.do'/>";
            document.menuListForm.submit();
        }
    }
}

/* 보수정비/방재시설 문화재명 선택 팝업 */
function popup_TcpMendngImprmnList(crltsManageId,jobSe,imprmnSn){
	var url = "/tcp/tcpMendngImprmn/TcpMendngImprmnList.do?crltsManageId="+crltsManageId+"&jobSe="+jobSe+"&imprmnSn="+imprmnSn;
	window.open(url, 'popup',"width = 1300, height = 800, top = 100, left = 200, location = no, scrollbars = yes");
}

/* 현상변경 문화재명 선택 팝업 */
function popup_TcpPhnomenChangeList(crltsManageId,seNo,prmisnNo,changeOdr){
    var url = "/tcp/tcpPhnomenChange/TcpPhnomenChangeList.do?crltsManageId="+crltsManageId+"&seNo="+seNo+"&prmisnNo="+prmisnNo;
	window.open(url, 'popup',"width = 1300, height = 800, top = 100, left = 200, location = no, scrollbars = yes");
}

/* 정기조사 사업명 선택 팝업 */
function fn_detail(examinId,bsnsYear){
    document.getElementById("listForm").bsnsYear.value = bsnsYear;
    document.getElementById("listForm").examinId.value = examinId;
	document.getElementById("listForm").pageIndex.value = 1;
   	document.getElementById("listForm").action = "<c:url value='/tcp/tcpFdrmInfo/updateTcpFdrmInfoView2.do'/>";
   	document.getElementById("listForm").submit();
}

</script>
</head>
<!-- popup -->

<div class="modal-popup" id="layerPopup" style="display:none;">

    <div class="popup-area" id="popup-area">
		<c:forEach var="obj" items="${popupList}">
        <div id="${obj.popupId}" style="display:none;">
        	<a href="${obj.fileUrl}" <c:if test="${fn:contains(obj.fileUrl, 'http')}"> target="_black"</c:if>>
            <img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fn:replace(fn:replace(obj.atchFileId, '<', '&lt;'), '>', '&gt;')}"/>&fileSn=${obj.fileSn}' alt="${obj.popupDc}" />
           	</a>
            <div class="popup-close">
                <span><input type="checkbox" />오늘 하루 보지 않기</span>
                <button type="button" onclick="closePopup(this);">닫기</button>
            </div>

        </div>
        </c:forEach>
    </div>
	<div class="popup-allclose">
          <span><input type="checkbox"  id="closeAllPopupCheck"/>전부 오늘 하루 보지 않기</span>
          <button type="button" onclick="closeAllPopup(this);">전부 닫기</button>
     </div>

</div>

<!-- container -->
<div class="container container-wrap">
    <!-- main -->
    <main id="contents">
        <div class="content-wrap">
            <h2 class="hidden">컨텐츠영역</h2>
            <div class="main-title" data-aos="fade-up">
                <p><strong>${LoginVO.name }</strong>님 접속을 환영합니다.</p>
                <span id="current_date1">
                    <script>
                        date = new Date();
                        year = date.getFullYear();
                        month = date.getMonth() + 1;
                        day = date.getDate();
                        document.getElementById("current_date1").innerHTML = year + "년 " + month + "월 " + day + "일";
                    </script>
                </span>
            </div>
            <section>
                <h3 class="hidden">상태</h3>
                <div class="monitoring-date" data-aos="fade-up" data-aos-delay="500">
                    <ul class="date">
                        <li class="font-weight-bold" id="current_date2">
                            <script>
	                            date =  new Date();
	                            year = date.getFullYear();
	                            monthvalue = date.getMonth() + 1;
	                            month = ('0' + monthvalue).slice(-2);
	                            day = ('0' + date.getDate()).slice(-2);
	                            document.getElementById("current_date2").innerHTML = year + "-" + month + "-" + day;
                            </script>
                        </li>
                        <li id="current_time">
                            <script>
                                date = new Date();
                                hours = ('0' + date.getHours()).slice(-2);
                                minutes = ('0' + date.getMinutes()).slice(-2);
                                seconds = ('0' + date.getSeconds()).slice(-2);
                                document.getElementById("current_time").innerHTML = hours + ":" + minutes + ":" + seconds;
                            </script>
                        </li>
                        <li class="font-weight-light">기준</li>
                    </ul>
                    <div class="tab-area flex">
                        <ul class="nav medium gray">
                            <li>
                                <a class="active" data-bs-toggle="tab" href="#tab1">시간</a>
                            </li>
                            <li>
                                <a data-bs-toggle="tab" href="#tab2">일간</a>
                            </li>
                            <li>
                                <a data-bs-toggle="tab" href="#tab3">주간</a>
                            </li>
                            <li>
                                <a data-bs-toggle="tab" href="#tab4">월간</a>
                            </li>
                        </ul>
                        <div class="btn-area">
                            <button type="button" class="btn btn-primary btn-md">사용자지정</button>
                            <button type="button" class="btn btn-primary btn-md">새로고침</button>
                        </div>
                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab1">
                        <div class="monitoring" data-aos="fade-up" data-aos-delay="700">
                            <ul>
                                <li class="danger">상태</li>
                            </ul>
                            <ul class="danger">
                                <li><strong>계량기</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>1</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul>
                                <li><strong>통신단말기</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>0</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul>
                                <li><strong>게이트웨이</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>0</span></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="monitoring-place" data-aos="fade-up" data-aos-delay="900">
                            <ul>
                                <li>사업소</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1100">
                            <ul>
                                <li>유성구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">5</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">4</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1300">
                            <ul>
                                <li>대덕구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1500">
                            <ul>
                                <li>서구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">7</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">2</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1700">
                            <ul>
                                <li>중구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1900">
                            <ul>
                                <li>동구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">2</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">0</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab2">
                        <div class="monitoring" data-aos="fade-up" data-aos-delay="700">
                            <ul>
                                <li class="danger">상태</li>
                            </ul>
                            <ul>
                                <li><strong>계량기</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>1</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="danger">
                                <li><strong>통신단말기</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>0</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul>
                                <li><strong>게이트웨이</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>0</span></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="monitoring-place" data-aos="fade-up" data-aos-delay="900">
                            <ul>
                                <li>사업소</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1100">
                            <ul>
                                <li>유성구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">5</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">4</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1300">
                            <ul>
                                <li>대덕구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1500">
                            <ul>
                                <li>서구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">7</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">2</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1700">
                            <ul>
                                <li>중구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1900">
                            <ul>
                                <li>동구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">2</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">0</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab3">
                        <div class="monitoring" data-aos="fade-up" data-aos-delay="700">
                            <ul>
                                <li class="danger">상태</li>
                            </ul>
                            <ul class="danger">
                                <li><strong>계량기</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>1</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul>
                                <li><strong>통신단말기</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>0</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="danger">
                                <li><strong>게이트웨이</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>0</span></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="monitoring-place" data-aos="fade-up" data-aos-delay="900">
                            <ul>
                                <li>사업소</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1100">
                            <ul>
                                <li>유성구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">5</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">4</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1300">
                            <ul>
                                <li>대덕구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1500">
                            <ul>
                                <li>서구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">7</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">2</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1700">
                            <ul>
                                <li>중구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1900">
                            <ul>
                                <li>동구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">2</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">0</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab4">
                        <div class="monitoring" data-aos="fade-up" data-aos-delay="700">
                            <ul>
                                <li class="danger">상태</li>
                            </ul>
                            <ul class="danger">
                                <li><strong>계량기</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>1</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="danger">
                                <li><strong>통신단말기</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>0</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="danger">
                                <li><strong>게이트웨이</strong>
                                    <ul>
                                        <li>작동<span>50,000</span></li>
                                        <li>장애<span>0</span></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="monitoring-place" data-aos="fade-up" data-aos-delay="900">
                            <ul>
                                <li>사업소</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                            <ul>
                                <li>자산현황</li>
                                <li>장애발생</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1100">
                            <ul>
                                <li>유성구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">5</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">4</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1300">
                            <ul>
                                <li>대덕구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1500">
                            <ul>
                                <li>서구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">7</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">2</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1700">
                            <ul>
                                <li>중구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">1</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                        <div class="monitoring-land" data-aos="fade-up" data-aos-delay="1900">
                            <ul>
                                <li>동구</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">2</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li class="danger">0</li>
                            </ul>
                            <ul>
                                <li>10,000</li>
                                <li>-</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <section class="row" data-aos="fade-up" data-aos-delay="2200">
                <div class="col-6">
                    <section class="panel-wrap">
                        <h3>장애공지</h3>
                        <ul class="main-notice list-dot">
                            <li>발생시간 / 장애코드 / 위치(사업소)</li>
                            <li>발생시간 / 장애코드 / 위치(사업소)</li>
                            <li>발생시간 / 장애코드 / 위치(사업소)</li>
                            <li>발생시간 / 장애코드 / 위치(사업소)</li>
                            <li>발생시간 / 장애코드 / 위치(사업소)</li>
                        </ul>
                    </section>
                </div>
                <div class="col-6">
                    <section class="panel-wrap">
                        <h3>장애전파 및 복구 상황</h3>
                        <ul class="main-notice list-dot">
                            <li>현재상태 / 조치예정시간/ 후속대응</li>
                            <li>현재상태 / 조치예정시간/ 후속대응</li>
                            <li>현재상태 / 조치예정시간/ 후속대응</li>
                            <li>현재상태 / 조치예정시간/ 후속대응</li>
                            <li>현재상태 / 조치예정시간/ 후속대응</li>
                        </ul>
                    </section>
                </div>
            </section>
        </div>
    </main>
    <!-- main -->
</div>
<!-- container -->

 <script type="text/javascript">

 $(document).ready(function() {
	 AOS.init({
	        duration: 1500,
	        once : true,
	        offset : -200,
	        delay : 0
	    });



    <c:if test="${fn:length(popupList) eq 0}">
    	 $("#layerPopup").hide();
	</c:if>
	checkCookie();

 });

 function closePopup(ob){
     ob.parentElement.parentElement.style.display='none'
     var popDiv = $(ob.parentElement.parentElement.parentElement).children();

     var popflag = true;
     $(popDiv).each(function (index, item) {
         if($(item).css('display')=='block'){popflag= false}
     });

     if(popflag){
         $("#layerPopup").hide();
         $("#layerPopup").off('scroll touchmove mousewheel');
     }

     var id = $(ob.parentElement.parentElement).attr('id');

	 if($(ob.parentElement.parentElement).find('input').is(":checked")){
	 	setCookie(id,"done",1);
	 };
 }
 function closeAllPopup(ob){

     var popDiv = $("#popup-area").children();

     if($("#closeAllPopupCheck").is(":checked")){
	    $(popDiv).each(function (index, item) {
	        setCookie($(item).attr('id'),"done",1);
	    });
     }

     $("#layerPopup").hide();
     $("#layerPopup").off('scroll touchmove mousewheel');

}
 function checkCookie()
 {

     <c:forEach var="obj" items="${popupList}">
    	if(getCookie("${obj.popupId}") != "done"){
    	    $("#layerPopup").show();
    	    $("#"+"${obj.popupId}").show();
    		$("#layerPopup").on('scroll touchmove mousewheel', function(e){
	     		e.preventDefault();
	     		e.stopPropagation();
	     		return false;
	     	});

    	}
     </c:forEach>
 }

 function setCookie( name, value, expiredays )
 {
     var todayDate = new Date();
     todayDate.setDate( todayDate.getDate() + expiredays );
     document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
 }
 function getCookie( name )
 {
     var nameOfCookie = name + "=";
     var x = 0;
     while ( x <= document.cookie.length )
     {
         var y = (x+nameOfCookie.length);
         if ( document.cookie.substring( x, y ) == nameOfCookie )
         {
             if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                 endOfCookie = document.cookie.length;
             return unescape( document.cookie.substring( y, endOfCookie ) );
         }
         x = document.cookie.indexOf( " ", x ) + 1;
         if ( x == 0 )
             break;
     }
     return "";
 }


 </script>

 <!-- popup -->