<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>GIS 모니터링시스템 대전광역시상수도사업본부</title>
<script src="/gis/OL5.3.0/ol.js"></script>
<script src="/gis/jquery/jQuery-3.4.0.min.js"></script>
<script src="/gis/js/proj4js-combined.js"></script>
<script src="https://unpkg.com/gifler@0.1.0/gifler.min.js"></script>
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" />
<link type="text/css" rel="stylesheet" href="/gis/OL5.3.0/ol.css" />
<link type="text/css" rel="stylesheet" href="/gis/css/common.css" />
<link type="text/css" rel="stylesheet" href="/gis/css/dev.css" />
</head>
<body>
  <div class="info-wrap">
    <header>
      <h1><a href=".">GIS 모니터링시스템 대전광역시상수도사업본부</a></h1>
      <div class="con-search">
        <form action="javascript:" onsubmit="searchCustomer()">
          <label for="search" class="hidden">검색</label>
          <input type="text" id="search" placeholder="수용가 명을 입력하세요." />
          <button type="submit"><i class="fas fa-search" title="검색"></i></button>
        </form>
      </div>
    </header>
    <section class="place-wrap">
      <h2 class="hidden">검색결과</h2>
      <strong id="searchString"></strong>
      <ul id="searchResult">
      </ul>
    </section>
    <div class="place-icon">
      <h3 onclick="showAll()">범례</h3>
      <ul>
        <li id="showNormal" data-value="1" onclick="showStatus(this)">정상</li>
        <li id="showCheck"  data-value="2" onclick="showStatus(this)">점검</li>
        <li id="showError"  data-value="3" onclick="showStatus(this)">장애</li>
      </ul>
    </div>
  </div>
  <div class="slide-btn"><a id="close" onclick="openCloseSearchPan(this.id)"><i class="fas fa-caret-left"></i></a></div>
  <div class="map_pan">
    <div id="spatial_map"></div>
  </div>
  <div class="view-info" id="popup" onmouseover="popupMouseOver()" onmouseleave="popupMouseOut()">
    <ul>
      <li id="popup_content1">
      </li>
    </ul>
  </div>
  
  <div class="view-info" id="clickInfo">
    <ul>
      <li id="clickInfoContent1">
      </li>
    </ul>
  </div>
  
  <main>
    <section class="view-wrap">
      <h2 class="hidden">지도</h2>
      <div class="location">
        <div class="normal"><i class="fas fa-map-marker-alt"></i></div>
        <div class="check"><i class="fas fa-map-marker-alt"></i></div>
        <div class="error"><i class="fas fa-map-marker-alt"></i></div>
      </div>
      <div class="view-info" id="sample_view-info">
        <ul>
          <li>
            대전광역시 유성구 대학로 291<br/>한국과학기술원
            <dl>
              <dt>지번</dt>
              <dd>구성동 23외 10건 (우) 34141</dd>
            </dl>
          </li>
        </ul>
      </div>
    </section>
    <aside class="control-wrap">
      <h2 class="hidden">컨트롤</h2>
      <div class="tools">
        <a href="javascript:resetMap()">
          <div class="tooltip">
            <i class="fas fa-redo-alt"></i>
            <span class="tooltiptext tooltip-left">초기화</span>
          </div>
        </a>
        <a href="javascript:goToEntireLoc()">
          <div class="tooltip">
            <i class="fas fa-expand-arrows-alt"></i>
            <span class="tooltiptext tooltip-left">전체화면</span>
          </div>
        </a>
        <a href="javascript:zoomInMap()">
          <div class="tooltip">
            <i class="fas fa-search-plus"></i>
            <span class="tooltiptext tooltip-left">확대</span>
          </div>
        </a>
        <a href="javascript:zoomOutMap()">
          <div class="tooltip">
            <i class="fas fa-search-minus"></i>
            <span class="tooltiptext tooltip-left">축소</span>
          </div>
        </a>
        <a href="#">
          <div class="tooltip">
            <i class="fas fa-arrows-alt"></i>
            <span class="tooltiptext tooltip-left">이동</span>
          </div>
        </a>
        <a id="LineString" onClick="drawStart(this)">
          <div class="tooltip">
            <i class="fas fa-ruler-horizontal"></i>
            <span class="tooltiptext tooltip-left">거리측정</span>
          </div>
        </a>
        <a id="Polygon" onClick="drawStart(this)">
          <div class="tooltip">
            <i class="fas fa-vector-square"></i>
            <span class="tooltiptext tooltip-left">면적측정</span>
          </div>
        </a>
        <a href="#">
          <div class="tooltip">
            <i class="fas fa-layer-group"></i>
            <span class="tooltiptext tooltip-left">분할영역</span>
          </div>
        </a>
        <a href="#">
          <div class="tooltip">
            <i class="fas fa-mountain"></i>
            <span class="tooltiptext tooltip-left">토지정보</span>
          </div>
        </a>
      </div>
      <!-- 
      <div class="zoom">
        <a href="javascript:goToInitialLoc()">
          <i class="fas fa-crosshairs"></i>
        </a>
        <a href="#">
          <i class="fas fa-plus"></i>
        </a>
        <a href="#">
          <i class="fas fa-minus"></i>
        </a>
      </div>
      -->
    </aside>
  </main>
  <script src="/gis/js/common.js"></script>
  <script src="/gis/js/ajax.js"></script>
  <script src="/gis/js/ol_custom.js"></script>
  <script src="/gis/js/measurement.js"></script>

</body>
</html>
