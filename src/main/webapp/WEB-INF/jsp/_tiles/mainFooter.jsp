<%--
  Class Name : EgovIncFooter.jsp
  Description : 화면하단 Footer(include)
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- footer -->


<footer>
<c:if test="${fn:length(bannerList) ne 0}">
    <div class="banner-wrap">
        <h3 class="hidden">배너모음</h3>
        <div class="banner-area">
            <div class="slider banner-slider">
            <c:forEach var="obj" items="${bannerList}">
                <a href="${obj.fileUrl}" target="_blank" <c:if test="${fn:contains(obj.fileUrl, 'http')}"> target="_black"</c:if>>${obj.bannerTitleNm}</a>
            </c:forEach>
            </div>
            <div class="banner-button dropup">
                <button type="button" class="slick-prev slick-arrow">이전</button>
                <button type="button" class="slick-play">재생</button>
                <button type="button" class="slick-pause">정지</button>
                <button type="button" class="slick-next slick-arrow">다음</button>
                <button type="button" class="all dropdown-toggle" id="bannerButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">전체보기</button>
                <div class="dropdown-menu" id="dropdown1" aria-labelledby="bannerButton">
                	 <c:forEach var="obj" items="${bannerList}">
		                <a href="${obj.fileUrl}" target="_blank" class="dropdown-item" <c:if test="${fn:contains(obj.fileUrl, 'http')}"> target="_black"</c:if>>${obj.bannerTitleNm}</a>
		            </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="site-wrap">
        <div class="site-area">
            <ul>
                <li><a href="#">이용안내</a></li>
                <li><a href="#">개인정보처리방침</a></li>
            </ul>
            <div class="site-button">
                <div class="dropup">
                    <button type="button" class="dropdown-toggle" id="siteButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">대전광역시관련 사이트</button>
                    <ul class="dropdown-menu" id="dropdown2" aria-labelledby="siteButton1">
                        <li><a href="http://www.daejeon.go.kr" target="_blank" title="새창" class="dropdown-item">대전광역시청</a></li>
                        <li><a href="http://www.oworld.kr/" target="_blank" title="새창" class="dropdown-item">대전동물원</a></li>
                        <li><a href="http://tour.daejeon.go.kr" target="_blank" title="새창" class="dropdown-item">대전문화관광</a></li>
                        <li><a href="http://map.daejeon.go.kr" target="_blank" title="새창" class="dropdown-item">새주소안내/생활지리</a></li>
                        <li><a href="http://traffic.daejeon.go.kr" target="_blank" title="새창" class="dropdown-item">대전교통정보센터</a></li>
                        <li><a href="http://tax.daejeon.go.kr/main/index.htm" target="_blank" title="새창" class="dropdown-item">지방세도우미</a></li>
                        <li><a href="http://star.metro.daejeon.kr" target="_blank" title="새창" class="dropdown-item">시민천문대</a></li>
                        <li><a href="http://www.djac.or.kr" target="_blank" title="새창" class="dropdown-item">대전문화예술의전당</a></li>
                        <li><a href="http://nanumi.metro.daejeon.kr" target="_blank" title="새창" class="dropdown-item">자원봉사센터</a></li>
                    </ul>
                </div>
                <div class="dropup">
                    <button type="button" class="dropdown-toggle" id="siteButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">상수도관련 사이트</button>
                    <ul class="dropdown-menu" id="dropdown3" aria-labelledby="siteButton2">
                        <li><a href="http://water.seoul.go.kr" target="_blank" title="새창" class="dropdown-item">서울상수도사업본부</a></li>
                        <li><a href="http://water.busan.go.kr/" target="_blank" title="새창" class="dropdown-item">부산상수도사업본부</a></li>
                        <li><a href="http://water.daegu.go.kr" target="_blank" title="새창" class="dropdown-item">대구상수도사업본부</a></li>
                        <li><a href="http://waterworksh.incheon.kr/" target="_blank" title="새창" class="dropdown-item">인천상수도사업본부</a></li>
                        <li><a href="http://water.gwangju.go.kr" target="_blank" title="새창" class="dropdown-item">광주상수도사업본부</a></li>
                        <li><a href="http://water.ulsan.go.kr/" target="_blank" title="새창" class="dropdown-item">울산상수도사업본부</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //배너슬라이
        $('.banner-slider').slick({
            dots: false,
            infinite: true,
            slidesToShow: 5,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2500,
            speed: 500,
            pauseOnHover:true,
            prevArrow: $('.slick-prev'),
            nextArrow: $('.slick-next')
        });
        $('.banner-wrap .slick-pause').on('click', function(){
            $('.banner-slider').slick('slickPause');
            $(this).hide().siblings('.slick-play').show();
            $(this).hide().siblings('.slick-play').focus();
        });
        $('.banner-wrap .slick-play').on('click', function(){
            $('.banner-slider').slick('slickPlay');
            $(this).hide().siblings('.slick-pause').show();
            $(this).hide().siblings('.slick-pause').focus();
        });
        //업슬라이드
        $('.dropdown-toggle').on('click', function() {
            var clickObId = $(this).next().attr('id');
            $('.dropdown-menu').each(function(){
                if($(this).attr('id')!=clickObId&&$(this).css("display")=='block'){
                    $(this).slideToggle(400);
                }
             });
            $(this).next('.dropdown-menu').slideToggle(400);
        });
        $(document).click(function(e){
            if (!$(e.target).is('.dropdown-toggle')) {
                $('.dropdown-menu').each(function(){
                   if($(this).css("display")=='block'){
                     $(this).slideToggle(400);
                   }
                });

            }
        });
    </script>
</c:if>
    <div class="footer-info">35278 대전광역시 서구 신갈마로 141번길 80 대표전화 042-715-6114 야간, 휴일당직실이용 042-715-6900<br />Copyright(c) 대전광역시 상수도사업본부. All Rights Reserved.</div>
</footer>
<!-- footer -->