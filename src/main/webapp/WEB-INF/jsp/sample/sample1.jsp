<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/cmm/main/inc/incTop.jsp" %>

<script src="/js/jquery/jquery-3.5.1.min.js"></script>
<script type="text/javaScript">
	$(document).ready(function(){
		$("#lev2").chained("#lev1");
		$("#lev3").chained("#lev2");
	});

	/* lnb */
	(function($){
		var lnbUI = {
			click : function (target, speed) {
				var _self = this,
				$target = $(target);
				_self.speed = speed || 300;

				$target.each(function(){
					if(findChildren($(this))) {
						return;
					}
					$(this).addClass('noDepth');
				});

				function findChildren(obj) {
					return obj.find('> ul').length > 0;
				}

				$target.on('click','a', function(e){
					e.stopPropagation();
					var $this = $(this),
					$depthTarget = $this.next(),
					$siblings = $this.parent().siblings();

					$this.parent('li').find('ul li').removeClass('on');
					$siblings.removeClass('on');
					$siblings.find('ul').slideUp(250);

					if($depthTarget.css('display') == 'none') {
						_self.activeOn($this);
						$depthTarget.slideDown(_self.speed);
					} else {
						$depthTarget.slideUp(_self.speed);
						_self.activeOff($this);
					}
				})
			},
			activeOff : function($target) {
				$target.parent().removeClass('on');
			},
			activeOn : function($target) {
				$target.parent().addClass('on');
			}
		};

		// Call lnbUI
		$(function(){
			lnbUI.click('#nav li', 300)
		});
	}(jQuery));
</script>

<link href="<c:url value='/'/>css/board.css" rel="stylesheet" type="text/css" ><!-- 20210204 장주연추가 -->

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header"><c:import url="/PageLink.do?link=cmm/main/inc/IncHeader" /></div>
    <div id="topnavi"><c:import url="/cmm/main/MainMenuHead.do" /></div>
    <!-- //header 끝 -->
    <!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/cmm/main/MainMenuLeft.do" /></div>
        <!-- //좌측메뉴 끝 -->
            <!-- 현재위치 네비게이션 시작 -->
            <!-- 현재위치 네비게이션 시작 -->
            <div id="content">
              <form name="frm">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>Home</li>
                            <li>디자인템플릿</li>
                            <li class="last"><strong>HTML요소</strong></li><!-- 마지막 li에 class="last" 추가  -->
                        </ul>
                    </div>
                </div>

                <!-- 서브타이틀 -->
                <div class="sub_tit_wrap">
                	<h2>문화재 관리 대장 <strong>목록</strong></h2>
                </div>
                <!-- //서브타이틀 -->

                <!-- 문화재 목록 -->
                <div id="sub_con_wrap">

	                <!-- 검색 필드 박스 시작 -->
	                <div id="search_field">

	                    <fieldset>
	                    	<legend>조건정보 영역</legend>
	                        <div class="sf_start">

	                            <ul class="search_form">
	                            	<li>
	                            		<label for="heritageSelect1" class="first">지역별</label>
	                            		<select name="heritageSelect1" id="heritageSelect1" class="select_style1">
						                    <option value="1">전체</option>
						                    <option value="2">셀렉트2</option>
						                    <option value="3">셀렉트3</option>
						                </select>
						                <label for="heritageSelect2">분류 </label>
	                            		<select name="heritageSelect2" id="heritageSelect2" class="select_style1">
						                    <option value="1">지정문화재</option>
						                    <option value="2">셀렉트2</option>
						                    <option value="3">셀렉트3</option>
						                </select>
						                <label for="heritageSelect3">종별</label>
	                            		<select name="heritageSelect3" id="heritageSelect3" class="select_style1">
						                    <option value="1">전체</option>
						                    <option value="2">셀렉트2</option>
						                </select>
						                <label for="heritageSelect4">진행상황</label>
	                            		<select name="heritageSelect4" id="heritageSelect4" class="select_style1">
						                    <option value="1">신청</option>
						                    <option value="2">셀렉트2</option>
						                    <option value="3">셀렉트3</option>
						                </select>
	                            	</li>
	                            	<li>
	                            		<label for="heritageName" class="first">문화재명</label>
	                            		<input name="heritageName" id="heritageName" type="text" value="" class="input_style1 input_w1" />
	                            		<label>신청일</label>
	                            		<input class="input_style1 input_w2" type="text" id="date1" name="date1" />
										<button type="submit" class="btn-date" title="날짜선택">날짜선택</button>
										<span class="date_dash"> ~ </span>
										<input class="input_style1 input_w2" type="text" id="date2" name="date2" />
										<button type="submit" class="btn-date" title="날짜선택">날짜선택</button>
	                            	</li>
	                            </ul>

	                            <div class="search_btn_wrap">
                                    <a href="#LINK" onclick="" class="search_btn">검색<!-- spring:message code="button.inquire" /--></a>
                                </div>
	                        </div>
	                    </fieldset>
	                </div>
	                <!-- //검색 필드 박스 끝 -->

	                <div id="page_info">
	                	<div id="page_info_left">총 <strong>03건</strong>이 검색 되었습니다.</div>
	                	<div id="page_info_right">
	                		<a href="#" class="filetype filetype1">엑셀</a>
	                		<a href="#" class="filetype filetype2">한글</a>
	                		<a href="#" class="filetype filetype3">PDF</a>
	                		<label for="listNum" class="first">다운로드</label>
	                		<div>
		                		<select name="listNum" id="listNum" class="select_style1 input_w5" title="보여질 목록 갯수 선택">
				                    <option value="1">10개</option>
				                    <option value="2">30개</option>
				                    <option value="3">50개</option>
				                </select>
			                </div>
	                	</div>
	                </div>

	                <!-- table add start -->
	                <div class="tablestyle_1">
	                    <table summary="요약">
	                    <caption>캡션</caption>
	                    <colgroup>
	                    <col width="10%" >
	                    <col width="3%" >
	                    <col width="13%" >
	                    <col width="13%" >
	                    <col width="13%" >
	                    <col width="" >
	                    <col width="13%" >
	                    <col width="10%" >
	                    </colgroup>
	                    <thead>
	                    <tr>
	                        <th scope="col" class="f_field" nowrap="nowrap">No</th>
	                        <th scope="col" nowrap="nowrap"><input name="checkAll" type="checkbox" title="Check All" onclick=""/></th>
	                        <th scope="col" nowrap="nowrap">아아디</th>
	                        <th scope="col" nowrap="nowrap">사용자이름</th>
	                        <th scope="col" nowrap="nowrap">소속기관</th>
	                        <th scope="col" nowrap="nowrap">사용자이메일</th>
	                        <th scope="col" nowrap="nowrap">등록일</th>
	                        <th scope="col" nowrap="nowrap">가입상태</th>
	                    </tr>
	                    </thead>
	                    <tbody>
	                      <tr>
		                    <td nowrap="nowrap"><strong>1</strong></td>
		                    <td nowrap="nowrap"><input name="checkField" title="Check" type="checkbox"/></td>
		                    <td nowrap class="td_link" >test0101</td>
		                    <td nowrap class="td_link" >김지민</td>
		                    <td nowrap class="td_link" >충남도청</td>
		                    <td nowrap class="td_link" >abc123@do.com</td>
		                    <td nowrap class="td_link" >2021-01-22</td>
		                    <td nowrap class="td_link" >승인</td>
	                      </tr>
	                      <tr>
		                    <td nowrap="nowrap"><strong>2</strong></td>
		                    <td nowrap="nowrap"><input name="checkField" title="Check" type="checkbox"/></td>
		                    <td nowrap class="td_link" >test0101</td>
		                    <td nowrap class="td_link" ></td>
		                    <td nowrap class="td_link" ></td>
		                    <td nowrap class="td_link" ></td>
		                    <td nowrap class="td_link" ></td>
		                    <td nowrap class="td_link" ></td>
	                      </tr>
	                      <tr>
		                    <td nowrap="nowrap"><strong>3</strong></td>
		                    <td nowrap="nowrap"><input name="checkField" title="Check" type="checkbox"/></td>
		                    <td nowrap class="td_link" ></td>
		                    <td nowrap class="td_link" ></td>
		                    <td nowrap class="td_link" ></td>
		                    <td nowrap class="td_link" ></td>
		                    <td nowrap class="td_link" ></td>
		                    <td nowrap class="td_link" ></td>
	                      </tr>
	                    </tbody>
	                    </table>
	                </div>
	                <!-- 페이지 네비게이션 시작 -->
	                <div id="paging_div">
	                    <a href="#" class="paging_control first">처음</a>
	                    <a href="#" class="paging_control prev">이전</a>
	                    <ul class="paging_align">
	                        <ui:pagination paginationInfo = "${paginationInfo}"  type="image" jsFunction="fnLinkPage" />
	                    </ul>
	                    <a href="#" class="paging_control next">다음</a>
	                    <a href="#" class="paging_control last">마지막</a>
	                </div>
	                <!-- //페이지 네비게이션 끝 -->

	                <!-- 하단버튼영역 -->
	                <div class="board_btn_wrap">
	                	<a href="#" class="board_btn">등록</a>
	                </div>
	                <!-- //하단버튼영역 -->
	            </div>
	            <!-- //문화재 목록 -->

	            <!-- 서브타이틀 -->
                <div class="sub_tit_wrap">
                	<h2>문화재 지정  등록신청 관리 <strong>등록문화재 신청</strong></h2>
                </div>
                <!-- //서브타이틀 -->

                <!-- 등록문화재 신청 -->
                <div id="sub_con_wrap">

	                <div class="info_txt1">
	                	<span>*</span>표기는 필수 입력사항
	                	<a href="#" class="board_btn2">도움말</a>
	                </div>

	                <div class="tablestyle_2">

	                	<table summary="요약">
	                    <caption>캡션</caption>
	                    <colgroup>
	                    <col width="8%" >
	                    <col width="19%" >
	                    <col width="25%" >
	                    <col width="70px" >
	                    <col width="20%" >
	                    <col width="70px" >
	                    <col width="" >
	                    </colgroup>
	                    <tbody>
	                      <tr>
		                    <th scope="col" rowspan="4">신청인</th>
		                    <th scope="col" class="essential"><span>성명 또는 기관명</span></th>
		                    <td colspan="5"><input name="name1" id="name1" type="text" value="" title="성명 또는 기관명" class="input_style1 input_w1" /></td>
	                      </tr>
	                      <tr>
		                    <th scope="col" class="essential"><span>주소</span></th>
		                    <td colspan="5">
		                    	<input name="add1_1" id="add1_1" type="text" value="" title="우편번호" class="input_style1 input_w2" />
		                    	<button type="submit" class="board_btn3" title="우편번호 찾기">우편번호 찾기</button>
		                    	<input name="add1_2" id="add1_2" type="text" value="" title="상세주소" class="input_style1 input_w3 mt5" />
		                    </td>
	                      </tr>
	                      <tr>
		                    <th scope="col"><span>전화번호</span></th>
		                    <td colspan="5">
		                    	<select name="phone1_1" id="phone1_1" class="select_style1 input_w4" title="전화번호 앞번호 선택">
				                    <option value="1">선택</option>
				                </select> -
				                <input name="phone1_2" id="phone1_2" type="text" value="" title="전화번호 중간번호 입력" class="input_style1 input_w4" /> -
				                <input name="phone1_3" id="phone1_3" type="text" value="" title="전화번호 끝번호 입력" class="input_style1 input_w4" />
		                    </td>
	                      </tr>
	                      <tr>
		                    <th scope="col" class="essential"><span>대상물 소유자와의 관계</span></th>
		                    <td colspan="5"><input name="relation" id="relation" type="text" value="" title="대상물 소유자와의 관계 입력" class="input_style1 input_w3" /></td>
	                      </tr>
	                      <tr>
		                    <th scope="col" rowspan="6"><span>대상물</span></th>
		                    <th scope="col" class="essential"><span>명칭</span></th>
		                    <td colspan="5"><input name="name2" id="name2" type="text" value="" title="명칭 입력" class="input_style1 input_w3" /></td>
	                      </tr>
	                      <tr>
		                    <th scope="col"><span>대상물 구분</span></th>
		                    <td><input name="index1" id="index1" type="text" value="" title="대상물 구분 입력" class="input_style1 input_w3" /></td>
		                    <th scope="col" class="th_leftL"><span>용도</span></th>
		                    <td><input name="index2" id="index2" type="text" value="" title="용도 입력" class="input_style1 input_w3" /></td>
		                    <th scope="col"class="th_leftL"><span>수량</span></th>
		                    <td><input name="index3" id="index3" type="text" value="" title="수량 입력" class="input_style1 input_w3" /></td>
	                      </tr>
	                      <tr>
		                    <th scope="col"><span>소재지(보관장소)</span></th>
		                    <td colspan="5"><input name="add3" id="add3" type="text" value="" title="소재지(보관장소) 입력" class="input_style1 input_w3" /></td>
	                      </tr>
	                      <tr>
		                    <th scope="col"><span>구조 및 규모</span></th>
		                    <td colspan="5"><textarea name="structure" id="structure" title="구조 및 규모 입력" class="input_style1 input_w3 input_h1"></textarea></td>
	                      </tr>
	                      <tr>
		                    <th scope="col"><span>연혁</span></th>
		                    <td colspan="5"><textarea name="history" id="history" title="연혁 입력" class="input_style1 input_w3 input_h1"></textarea></td>
	                      </tr>
	                      <tr>
		                    <th scope="col"><span>소유자<br/>(또는 관리자)</span></th>
		                    <td colspan="5" class="no_padding">
		                    	<table summary="요약">
			                    <caption>캡션</caption>
			                    <colgroup>
			                    <col width="12.5%" >
			                    <col width="" >
			                    <col width="12.5%" >
			                    <col width="36%" >
			                    </colgroup>
			                    <tbody>
			                      <tr>
				                    <th scope="col"><span>성명</span></th>
				                    <td><input name="name3" id="name3" type="text" value="" title="성명 또는 기관명" class="input_style1 input_w3" /></td>
				                    <th scope="col" class="th_leftL"><span>전화번호</span></th>
				                    <td>
				                    	<select name="phone2_1" id="phone2_1" class="select_style1 input_w4" title="전화번호 앞번호 선택">
						                    <option value="1">선택</option>
						                </select> -
						                <input name="phone2_2" id="phone2_2" type="text" value="" title="전화번호 중간번호 입력" class="input_style1 input_w4" /> -
						                <input name="phone2_3" id="phone2_3" type="text" value="" title="전화번호 끝번호 입력" class="input_style1 input_w4" />
				                    </td>
			                      </tr>
			                      <tr>
				                    <th scope="col" class="no_bline"><span>주소</span></th>
				                    <td colspan="3" class="no_bline">
				                    	<input name="add2_1" id="add2_1" type="text" value="" title="우편번호" class="input_style1 input_w2" />
				                    	<button type="submit" class="board_btn3" title="우편번호 찾기">우편번호 찾기</button>
				                    	<input name="add2_2" id="add2_2" type="text" value="" title="상세주소" class="input_style1 input_w3 mt5" />
				                    </td>
			                      </tr>
			                    </tbody>
			                    </table>
		                    </td>
	                      </tr>
	                      <tr>
		                    <th scope="col" colspan="2"><span>등록신청 사유</span></th>
		                    <td colspan="5"><textarea name="reason" id="reason" title="등록신청 사유 입력" class="input_style1 input_w3 input_h1"></textarea></td>
	                      </tr>
	                      <tr>
		                    <th scope="col" colspan="2"><span>그 밖의 사항</span></th>
		                    <td colspan="5"><textarea name="etc" id="etc" title="그 밖의 사항 입력" class="input_style1 input_w3 input_h1"></textarea></td>
	                      </tr>
	                      <tr>
		                    <th scope="col" colspan="2"><span>첨부파일</span></th>
		                    <td colspan="5">
		                    	<select name="phone1_1" id="phone1_1" class="select_style1" title="카테고리 선택">
				                    <option value="1">카테고리</option>
				                </select>
				                <span class="file_title">파일명</span><input name="file1" id="file1" type="text" value="" title="파일명" class="input_style1 input_w2" />
				                <input name="file2" id="file2" type="text" value="" title="파일찾아보기" class="input_style1 input_w6 ml30" />
				                <button type="submit" class="board_btn4" title="찾아보기">찾아보기</button>
				                <button type="submit" class="board_btn4" title="파일추가">파일추가</button>
				                <p class="info_txt2">* 첨부파일 최대 100M, 5개까지 등록 가능 (zip, egg, jpg, gif, pdf, hwp, doc, docx, ppt, pptx, xls, xlsx)</p>
		                    </td>
	                      </tr>
	                      <tr>
		                    <th scope="col" colspan="2"><span>신청일</span></th>
		                    <td colspan="5">
		                    	<input class="input_style1 input_w2" type="text" id="date3" name="date3" />
								<button type="submit" class="btn-date" title="날짜선택">날짜선택</button>
							</td>
	                      </tr>
	                    </tbody>
	                    </table>

	                </div>

	                <!-- 하단버튼영역 -->
	                <div class="board_btn_wrap">
	                	<a href="#" class="board_btn">등록</a>
	                	<a href="#" class="board_btn del">삭제</a>
	                </div>
	                <!-- //하단버튼영역 -->

	                <!-- 유의사항 -->
	                <div class="note_tit">작성 요령 및 첨부서류 유의사항</div>

	                <div class="tablestyle_3">
	                	<table summary="요약">
	                    <caption>캡션</caption>
	                    <colgroup>
	                    <col width="25%" >
	                    <col width="" >
	                    </colgroup>
	                    <tbody>
	                      <tr>
		                    <th scope="col">신청인(대표자)<br/>제출서류</th>
		                    <td>
		                    	1. 대상 문화재의 소유자 동의서(소유자가 등록을 신청하는 경우에는 제출하지 아니합니다)<br/>
		                    	2. 대상 문화재의 사진ㆍ도면(배치도, 평면도, 단면도 등) 및 문헌 자료 사본<br/>
		                    	3. 별지 제34호 서식에 따른 대상 문화재 보존관리 및 활용계획서<br/>
		                    	4. 대상 문화재의 변형 및 수리 이력(변형 및 수리 이력이 있는 경우로 한정합니다)
		                    </td>
	                      </tr>
	                      <tr>
		                    <th scope="col">담당 공무원<br/>확인사항</th>
		                    <td class="no_bline">
		                    	1. 시장ㆍ군수의 검토의견서<br/>
		                    	2. 관계전문가의 조사의견 및 관련 자료<br/>
		                    	3. 건축물대장 등본<br/>
		                    	4. 토지(임야) 대장<br/>
		                    	5. 건물등기부 등본<br/>
		                    	6. 토지등기부 등본
		                    </td>
	                      </tr>
	                    </tbody>
	                    </table>
	                </div>
	                <!-- //유의사항 -->

	            </div>
	            <!-- //등록문화재 신청 -->

                <!-- 서브타이틀 -->
                <div class="sub_tit_wrap">
                	<h2>문화재 관리 대장 <strong>목록</strong></h2>
                </div>
                <!-- //서브타이틀 -->

                <!-- 문화재 목록 -->
                <div id="sub_con_wrap">

	                <!-- 검색 필드 박스 시작 -->
	                <div id="search_field">

	                    <fieldset>
	                    	<legend>조건정보 영역</legend>
	                        <div class="sf_start">

	                            <ul class="search_form search_form2">
	                            	<li class="nline">
	                            		<label for="heritageSelect1" class="first">지역별</label>
	                            		<select name="heritageSelect1" id="heritageSelect1" class="select_style1">
						                    <option value="1">전체</option>
						                    <option value="2">셀렉트2</option>
						                    <option value="3">셀렉트3</option>
						                </select>
						                <label for="heritageSelect2">분류 </label>
	                            		<select name="heritageSelect2" id="heritageSelect2" class="select_style1">
						                    <option value="1">지정문화재</option>
						                    <option value="2">셀렉트2</option>
						                    <option value="3">셀렉트3</option>
						                </select>
						                <label for="heritageSelect3">종별</label>
	                            		<select name="heritageSelect3" id="heritageSelect3" class="select_style1">
						                    <option value="1">전체</option>
						                    <option value="2">셀렉트2</option>
						                </select>
						                <label for="heritageName">문화재명</label>
	                            		<input name="heritageName" id="heritageName" type="text" value="" class="input_style1 input_w7" />
	                            	</li>
	                            </ul>

	                            <div class="search_btn_wrap search_btn_wrap2">
                                    <a href="#LINK" onclick="" class="search_btn">검색<!-- spring:message code="button.inquire" /--></a>
                                </div>
	                        </div>
	                    </fieldset>
	                </div>
	                <!-- //검색 필드 박스 끝 -->

	                <div id="page_info">
	                	<div id="page_info_left">총 <strong>03건</strong>이 검색 되었습니다.</div>
	                	<div id="page_info_right">
	                		<a href="#" class="filetype filetype1">엑셀</a>
	                		<a href="#" class="filetype filetype2">한글</a>
	                		<a href="#" class="filetype filetype3">PDF</a>
	                		<label for="listNum" class="first">다운로드</label>
	                		<div>
		                		<select name="listNum" id="listNum" class="select_style1 input_w5" title="보여질 목록 갯수 선택">
				                    <option value="1">10개</option>
				                    <option value="2">30개</option>
				                    <option value="3">50개</option>
				                </select>
			                </div>
	                	</div>
	                </div>

	                <!-- table add start -->
	                <div class="tablestyle_1">
	                    <table summary="요약">
	                    <caption>캡션</caption>
	                    <colgroup>
	                    <col width="5%" >
	                    <col width="10%" >
	                    <col width="10%" >
	                    <col width="" >
	                    <col width="10%" >
	                    <col width="7%" >
	                    <col width="10%" >
	                    <col width="10%" >
	                    <col width="10%" >
	                    <col width="10%" >
	                    </colgroup>
	                    <thead>
	                    <tr>
	                        <th scope="col" class="f_field" nowrap="nowrap">No</th>
	                        <th scope="col" nowrap="nowrap">종별</th>
	                        <th scope="col" nowrap="nowrap">지정번호</th>
	                        <th scope="col" nowrap="nowrap">문화재명</th>
	                        <th scope="col" nowrap="nowrap">분류</th>
	                        <th scope="col" nowrap="nowrap">기본정보</th>
	                        <th scope="col" nowrap="nowrap">보수정비</th>
	                        <th scope="col" nowrap="nowrap">방재시설</th>
	                        <th scope="col" nowrap="nowrap">현상변경 </th>
	                        <th scope="col" nowrap="nowrap">정기조사</th>
	                    </tr>
	                    </thead>
	                    <tbody>
	                      <tr>
		                    <td nowrap="nowrap"><strong>1</strong></td>
		                    <td nowrap="nowrap">유형문화재</td>
		                    <td nowrap="nowrap">3</td>
		                    <td nowrap="nowrap">신안사 대광전</td>
		                    <td nowrap="nowrap">유적건조물</td>
		                    <td nowrap="nowrap"><a href="#" class="board_btn5">관리</a></td>
		                    <td nowrap="nowrap">1건<a href="#" class="board_btn5 ml5">관리</a></td>
		                    <td nowrap="nowrap">2건<a href="#" class="board_btn5 ml5">관리</a></td>
		                    <td nowrap="nowrap">3건<a href="#" class="board_btn5 ml5">관리</a></td>
		                    <td nowrap="nowrap">1건<a href="#" class="board_btn5 ml5">관리</a></td>
	                      </tr>
	                      <tr>
		                    <td nowrap="nowrap"><strong>2</strong></td>
		                    <td nowrap="nowrap">기념물</td>
		                    <td nowrap="nowrap">69</td>
		                    <td nowrap="nowrap">신자경선생묘</td>
		                    <td nowrap="nowrap">봉토묘</td>
		                    <td nowrap="nowrap"><a href="#" class="board_btn5">관리</a></td>
		                    <td nowrap="nowrap"></td>
		                    <td nowrap="nowrap"></td>
		                    <td nowrap="nowrap"></td>
		                    <td nowrap="nowrap"></td>
	                      </tr>
	                      <tr>
		                    <td nowrap="nowrap"><strong>3</strong></td>
		                    <td nowrap="nowrap">도문화재자료</td>
		                    <td nowrap="nowrap">216</td>
		                    <td nowrap="nowrap">영탑사칠층석탑</td>
		                    <td nowrap="nowrap">탑</td>
		                    <td nowrap="nowrap"><a href="#" class="board_btn5">관리</a></td>
		                    <td nowrap="nowrap"></td>
		                    <td nowrap="nowrap"></td>
		                    <td nowrap="nowrap"></td>
		                    <td nowrap="nowrap"></td>
	                      </tr>
	                    </tbody>
	                    </table>
	                </div>
	                <!-- 페이지 네비게이션 시작 -->
	                <div id="paging_div">
	                    <a href="#" class="paging_control first">처음</a>
	                    <a href="#" class="paging_control prev">이전</a>
	                    <ul class="paging_align">
	                        <ui:pagination paginationInfo = "${paginationInfo}"  type="image" jsFunction="fnLinkPage" />
	                    </ul>
	                    <a href="#" class="paging_control next">다음</a>
	                    <a href="#" class="paging_control last">마지막</a>
	                </div>
	                <!-- //페이지 네비게이션 끝 -->

	                <!-- 하단버튼영역 -->
	                <div class="board_btn_wrap">
	                	<a href="#" class="board_btn">등록</a>
	                </div>
	                <!-- //하단버튼영역 -->
	            </div>
	            <!-- //문화재 목록 -->
              </form>
            </div>
            <!-- //content 끝 -->
        </div>
        <!-- //container 끝 -->
        <!-- footer 시작  -->
        <div id="footer"><c:import url="/PageLink.do?link=cmm/main/inc/IncFooter" /></div>
        <!-- //footer 끝 -->
    </div>
    <!-- //전체 레이어 끝 -->
 </body>
</html>