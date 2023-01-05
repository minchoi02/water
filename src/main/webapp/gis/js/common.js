// Proj4js preset
Proj4js.defs["EPSG:3857"] = "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs";
Proj4js.defs["EPSG:4326"] = "+proj=longlat +datum=WGS84 +no_defs";
const epsg3857  = new Proj4js.Proj('EPSG:3857');
const epsg4326  = new Proj4js.Proj('EPSG:4326');

function coordConvert_Proj4js(loc, source, target) {
  var sourceLoc = new Proj4js.Point(loc[0] + "," + loc[1]);
  var sourceProj = new Proj4js.Proj('EPSG:' + source);
  var targetProj = new Proj4js.Proj('EPSG:' + target);
  var targetLoc = Proj4js.transform(sourceProj, targetProj, new Proj4js.Point(loc[0] + "," + loc[1]));
}

function coordConvert_olProj(loc, source, target) {
  var sourceLoc = loc;
  var targetLoc = ol.proj.transform(sourceLoc, 'EPSG:' + source, 'EPSG:' + target);
}

// inital location preset
var init_lon, init_lat;
setInitialLoc({x: 127.35618821104175, y: 36.36226924397291});
function setInitialLoc(loc) {
	init_lon = loc.x; // longitude
	init_lat = loc.y; // latitude
}

var Entire_lon, Entire_lat;
setEntireLoc({x: 127.38468933105467, y: 36.350195188138755});
function setEntireLoc(loc) {
	Entire_lon = loc.x; // longitude
	Entire_lat = loc.y; // latitude
}


function resetMap() {
	customer_layer.setVisible(true);
	status_chk_vector.setVisible(true);
	status_err_vector.setVisible(true);
	drawEnd();
}

function zoomInMap() {
  view.setZoom(view.getZoom() + 1);
}

function zoomOutMap() {
  view.setZoom(view.getZoom() - 1);
}

function goToInitialLoc() {
  view.setCenter(ol.proj.transform([init_lon, init_lat], 'EPSG:4326', 'EPSG:3857'));
}

function goToEntireLoc() {
  view.setCenter(ol.proj.transform([Entire_lon, Entire_lat], 'EPSG:4326', 'EPSG:3857'));
  view.setZoom(12);
}

function goToMyLoc() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(loc => {
      var lon = loc.coords.longitude;
      var lat = loc.coords.latitude;
      view.setCenter(ol.proj.transform([lon, lat], 'EPSG:4326', 'EPSG:3857'));
    });
  }
}

// from layout
function openCloseSearchPan(buttonId) {
  var button = document.getElementById(buttonId);
  if(buttonId == "close") {
    closePan();
    button.id = "open";
    button.innerHTML = '<i class="fas fa-caret-right"></i>';
  } else if(button.id == "open") {
    openPan();
    button.id = "close";
    button.innerHTML = '<i class="fas fa-caret-left"></i>';
  }
}

function closePan() {
  var el_searchPan = document.getElementsByClassName("info-wrap")[0];
  var el_button = document.getElementsByClassName("slide-btn")[0];
  var el_spatialMap = document.getElementById("spatial_map");
  var el_searchString = document.getElementById("searchString");
  
  el_searchPan.style.visibility = "hidden";
  el_searchString.style.visibility = "hidden";
  el_spatialMap.style.width = "calc(100%)";
  el_button.style.left = "0rem";

  map.updateSize();
}
function openPan() {
  var el_searchPan = document.getElementsByClassName("info-wrap")[0];
  var el_button = document.getElementsByClassName("slide-btn")[0];
  var el_spatialMap = document.getElementById("spatial_map");
  var el_searchString = document.getElementById("searchString");
  
  el_searchPan .style.visibility = "visible";
  el_searchString.style.visibility = "hidden";
  el_spatialMap.style.width = "calc(100% - 40rem)";
  el_button.style.left = "40rem";

  map.updateSize();
}

function searchCustomer() {
  var name = document.getElementById('search').value;
  if(name == "") {
    // no search text
    return;
  } else {
    if(validateOnSubmit(name)) ajax_searchCustomer(name);
    else return;
    document.getElementById('searchString').innerText = "'" + name + "' 검색 결과.";
    document.getElementById('searchString').style.visibility = "visible";
  }
}

function validateOnSubmit(text) {
  return true;
}

function clickResult(lng, lat, cusnum) {
  clickedOne = {
    cusnum: cusnum,
    lng: lng,
    lat: lat,
  }
  clickLocate(lng, lat);
}
function clickLocate(lng, lat) {
  var realCoord = Proj4js.transform(epsg4326, epsg3857, new Proj4js.Point(lng + "," + lat));
  view.setCenter([realCoord.x, realCoord.y]);
  view.setZoom(19);
}


//--------------------------------------------------------------------------------------------------
// popup
function showPopup(feature) {
  var realCoord = new Proj4js.Point(feature.getGeometry().getCoordinates()[0] + "," + feature.getGeometry().getCoordinates()[1]);

  var popupContent1 = document.getElementById("popup_content1");
  var cusnum = feature.getProperties().cusnum;
  var npsnm = feature.getProperties().npsnm;
  var nstadr = feature.getProperties().nstadr;
  var status;
  switch (feature.getProperties().status) {
    case "1":
      status = "정상";
      break;
    case "2":
      status = "점검";
      break;
    case "3":
      status = "장애";
      break;
  }
  popupContent1.innerHTML = ''+
    '<b>' + cusnum + '</b> ' + npsnm +
    '<dl><dt>도로명</dt><dd>' + nstadr + '</dd></dl>' +
    '<dl><dt>상태</dt><dd>' + status + '</dd></dl>';

  popupOverlay.setPosition([realCoord.x, realCoord.y]);
  popupElement.style.visibility = 'visible';
}

function closePopup() {
  popupElement.style.visibility = 'hidden';
}
var popupTimeout;
var isOnPopup;
function popupMouseOver() {
  isOnPopup = true;
  if (popupTimeout) clearTimeout(popupTimeout);
}
function popupMouseOut() {
  isOnPopup = false;
  popupTimeout = setTimeout(closePopup(), 300);
  
}

//--------------------------------------------------------------------------------------------------
// category
//var showStatusParams = {"showNormal" : '1', "showCheck" : '2', "showError" : '3'};
function showStatus(click){
	
	if(click.className == ''){
		click.className = 'clickDisable';
	}
	else{
		click.className = '';
	}
	
	switch(click.id){
	case "showNormal":
		customer_layer.setVisible(!customer_layer.getVisible());
	break;
	case "showCheck":
		status_chk_vector.setVisible(!status_chk_vector.getVisible());
	break;
	case "showError":
		status_err_vector.setVisible(!status_err_vector.getVisible());
	break;
	
	}
	/*
	var showStatusArray = new Array();
	
	if(click.className == ''){
		click.className = 'clickDisable';
		showStatusParams[click.id] = '';
	}
	else{
		click.className = '';
		showStatusParams[click.id] = click.dataset.value;
	}
	if(click.id == 'showError') status_err_vector.setVisible(!status_err_vector.getVisible());
	
	for(var i in showStatusParams)
   {
		if(showStatusParams[i] != '') showStatusArray.push(showStatusParams[i]);
   }
	if(showStatusArray.length == 0) {
		var filterParams = {"CQL_FILTER" : "1=2"};
	}
	else {
		var filterParams = {"CQL_FILTER" : "status in ("+showStatusArray.join(", ")+")"};
	}
	customer_source.updateParams(filterParams);*/
    
    

}
