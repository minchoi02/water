//==================================================================================================
// OpenLayers related functions
//--------------------------------------------------------------------------------------------------
/**
* Use this function only for the zoom levels lower than 19.
* vworld map supports 6 to 19 zoom levels of OpenLayers.
* Following shows OpneLayers zoom level - resolution table.
* +-------------+---------------++-------------+---------------+
* | Zoom Level  | Resolution    || Zoom Level  | Resolution    |
* +-------------+---------------++-------------+---------------+
* | 28          | 0.00059       || 13          | 19.10926      |
* | 27          | 0.00117       || 12          | 38.21852      |
* | 16          | 0.00234       || 11          | 76.43703      |
* | 15          | 0.00467       || 10          | 152.87406     |
* | 14          | 0.00934       || 9           | 305.74812     |
* | 13          | 0.01867       || 8           | 611.49623     |
* | 12          | 0.03733       || 7           | 1222.99246    |
* | 11          | 0.07465       || 6           | 2445.98491    |
* | 10          | 0.14930       || 5           | 4891.96982    |
* | 19          | 0.29859       || 4           | 9783.93963    |
* | 18          | 0.59717       || 3           | 19567.87925   |
* | 17          | 1.19433       || 2           | 39135.75849   |
* | 16          | 2.38866       || 1           | 78271.51697   |
* | 15          | 4.77732       || 0           | 156543.03393  |
* | 14          | 9.55463       ||             |               |
* +-------------+---------------++-------------+---------------+
*/
function func_ol_getMaxResolutionFromZoom(zoom) {
  const RESOLUTION_BASE_VALUE = 15654303393;
  return Math.ceil(RESOLUTION_BASE_VALUE / Math.pow(2, zoom)) / 100000;
}

function func_ol_getMinResolutionFromZoom(zoom) {
  const RESOLUTION_BASE_VALUE = 15654303393;
  return Math.floor(RESOLUTION_BASE_VALUE / Math.pow(2, zoom)) / 100000;
}
//##################################################################################################
//││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││
//##################################################################################################
//==================================================================================================
// Layers from geoserver.
//--------------------------------------------------------------------------------------------------
// WMS
//--------------------------------------------------------------------------------------------------

//Vworld WMTS
var VmapLayer = new ol.layer.Tile({
	title : 'Vworld Map',
	visible : true,
	type : 'base',
	source : new ol.source.XYZ({
		url : 'http://api.vworld.kr/req/wmts/1.0.0/824C9DB7-0115-3208-858A-6F12E0E36AEF/Base/{z}/{y}/{x}.png'
	})
});

//Customer Layer
var wmsUrl = "/gis/proxy.do";
var customer_source = new ol.source.TileWMS({
	url: wmsUrl,
	params: {
		SERVICE: "WMS",
		VERSION: '1.3.0', // wms version
		LAYERS: 'gis:gis_customer',
		SRS: 'EPSG:3857',
	},
	serverType: 'geoserver',
	crossOrigin: 'anonymous',
	gutter: 20,
});

var customer_layer = new ol.layer.Tile({
	title:'customLayer',
	source: customer_source,
	minResolution: func_ol_getMinResolutionFromZoom(19),
	maxResolution: func_ol_getMinResolutionFromZoom(15),
	visible: true,
});


//##################################################################################################
//││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││
//##################################################################################################
//==================================================================================================
// Vector.
//--------------------------------------------------------------------------------------------------
//bbox 추가해야함 꼭

//장애 WFS
var status_err_vectorLoader = function(extent, resolution, projection) {
	$.ajax({
        url: wmsUrl,
        data: {
    		"SERVICE": "WFS",
    		"VERSION": "1.1.0",
    		"TYPENAME": "gis:gis_customer",
    		"SRS": "EPSG:3857",
    		"OUTPUTFORMAT": "application/json",
    		"CQL_FILTER": "status=3"	
        },
        dataType: 'json',
        xhrFields: {
            withCredentials: true
        },
        error: function (data) {
            return false;
        },
        success: function (data) {      	
        	var dif = new ol.format.GeoJSON(),
            features = dif.readFeatures(data);
            status_err_vectorSource.addFeatures(features);
            
            const gif = gifler("/gis/images/error.gif");
            gif.frames(
              document.createElement('canvas'),
              function (ctx, frame) {
                for(var i = 0; i < status_err_vectorSource.getFeatures().length; i++) {
                	var baseScale = status_err_vectorSource.getFeatures()[i].get("CLICKED")?ICONSCALE_CLICKED:ICONSCALE_BASIC;
                    var iconScaleMultiplier = status_err_vectorSource.getFeatures()[i].get("HITON")?1.15:1.0;
                	status_err_vectorSource.getFeatures()[i].setStyle(
                    new ol.style.Style({
                      image: new ol.style.Icon({
                        img: ctx.canvas,
                        imgSize: [frame.width, frame.height],
                        scale: baseScale * iconScaleMultiplier,
                      }),
                    })
                  );
                }
                
                ctx.clearRect(0, 0, frame.width, frame.height);
                ctx.drawImage(frame.buffer, frame.x, frame.y);
                map.render();
              },
              true
            );
            
        },
    });
}
  
var status_err_vectorSource = new ol.source.Vector({
    loader: status_err_vectorLoader,
});

var status_err_vector = new ol.layer.Vector({
	title:'statusErrLayer',
	format: new ol.format.GeoJSON(),
	source:status_err_vectorSource,
	minResolution: func_ol_getMinResolutionFromZoom(19),
	maxResolution: func_ol_getMaxResolutionFromZoom(15),
	visible: true,
});

//점검 WFS
var status_chk_vectorLoader = function(extent, resolution, projection) {
	$.ajax({
        url: wmsUrl,
        data: {
    		"SERVICE": "WFS",
    		"VERSION": "1.1.0",
    		"TYPENAME": "gis:gis_customer",
    		"SRS": "EPSG:3857",
    		"OUTPUTFORMAT": "application/json",
    		"CQL_FILTER": "status=2"	
        },
        dataType: 'json',
        xhrFields: {
            withCredentials: true
        },
        error: function (data) {
            return false;
        },
        success: function (data) {      	
        	var dif = new ol.format.GeoJSON(),
            features = dif.readFeatures(data);
            status_chk_vectorSource.addFeatures(features);  
            for (var i = 0; i < status_chk_vectorSource.getFeatures().length; i++) {
            	var baseScale = status_chk_vectorSource.getFeatures()[i].get("CLICKED")?ICONSCALE_CLICKED:ICONSCALE_BASIC;
                var iconScaleMultiplier = status_chk_vectorSource.getFeatures()[i].get("HITON")?1.15:1.0;
                status_chk_vectorSource.getFeatures()[i].setStyle(
                  new ol.style.Style({
                    image: new ol.style.Icon({
                      src: '/gis/images/check.png',
                      scale: baseScale * iconScaleMultiplier,
                    }),
                  })
                );
             }
        },
    });
}

var status_chk_vectorSource = new ol.source.Vector({
    loader: status_chk_vectorLoader,
});

var status_chk_vector = new ol.layer.Vector({
	title:'statusChkLayer',
	format: new ol.format.GeoJSON(),
	source:status_chk_vectorSource,
/*	style: new ol.style.Style({
	    image: new ol.style.Icon({
	            crossOrigin: 'anonymous',
	            scale:0.8,
	            src: '/gis/images/check.png'
	    })
	}),*/
	minResolution: func_ol_getMinResolutionFromZoom(19),
	maxResolution: func_ol_getMaxResolutionFromZoom(15),
	visible: true,
});

var measureSource = new ol.source.Vector();

var measureVector = new ol.layer.Vector({
  source: measureSource,
  style: new ol.style.Style({
    fill: new ol.style.Fill({
      color: 'rgba(255, 255, 255, 0.2)'
    }),
    stroke: new ol.style.Stroke({
      color: '#ffcc33',
      width: 2
    }),
    image: new ol.style.Circle({
      radius: 7,
      fill: new ol.style.Fill({
        color: '#ffcc33'
      })
    })
  })
});


//--------------------------------------------------------------------------------------------------
// Overlay(popup)
//--------------------------------------------------------------------------------------------------
var popupElement = document.getElementById("popup");
var popupOverlay = new ol.Overlay({
  element : popupElement,
});

var clickPopupElement = document.getElementById("clickInfo");
var clickPopupOverlay = new ol.Overlay({
	element : clickPopupElement
});
//##################################################################################################
//││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││
//##################################################################################################
//==================================================================================================
// spatial_map view creation.
//--------------------------------------------------------------------------------------------------
var view = new ol.View({
  center: ol.proj.transform([127.35618821104175, 36.36226924397291], 'EPSG:4326', 'EPSG:3857'),
  maxZoom: 19,
  minZoom: 6,
  zoom: 18
});
//--------------------------------------------------------------------------------------------------
// spatial_map view events.
//--------------------------------------------------------------------------------------------------
view.on('change:center', function () {
  var center = view.getCenter();
});

// 확대 및 축소 시 when zoom in or zoom out
view.on('change:resolution', function () {
  var center = view.getCenter();
  var zoomLevel = view.getZoom();
});
//==================================================================================================
// spatial_map creation
//--------------------------------------------------------------------------------------------------
var map = new ol.Map({
  target: 'spatial_map',
  layers: [
	  VmapLayer, customer_layer, status_chk_vector, status_err_vector, measureVector
  ],
  view: view,
  overlays: [
	  clickPopupOverlay,popupOverlay
  ],
  renderer: 'canvas',
  interactions: ol.interaction.defaults({
    altShiftDragRotate: false,
    pinchRotate: false,
    doubleClickZoom: false,
  }),
  loadTilesWhileAnimating: true,
  loadTilesWhileInteracting: true,
});
//##################################################################################################
//││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││
//##################################################################################################
//==================================================================================================
// spatial_map events.
//--------------------------------------------------------------------------------------------------

//클릭한 지점 주소 찾기 및 기본정보 띄우기
map.on('singleclick', function (e) {
    var p = ol.proj.transform([e.coordinate[0], e.coordinate[1]], 'EPSG:3857', 'EPSG:4326')
    console.log(p);

});

map.on('dblclick', function (e) {
  // double Click
});



map.on('pointerdown', function () {
  
});

map.on('pointerup', function () {

});

var prevFeature = null;
var highlightedFeature = null;
var hit2;
var isHitOn;
var hitOnCount = 0;
var hitOutCount = 0;
const ICONSCALE_CLICKED = 1.2;
const ICONSCALE_BASIC = 0.8;

map.on('pointermove', function (e) {

	if (e.dragging) {
        return;
    }
      

  // hit out detector.
  if (hit2 == undefined) {
    hitOutCount++;
    if(hitOutCount > 1) {
      // when (map.forEachFeatrueAtPixel returns undefined 2 or more times, assume it as 'hit Out'.)
      hitOnCount = 0;
      isHitOn = false;

      if(hitOutCount == 2 && prevFeature != null) {
        console.log("### Hit Detector ### -- out");
        highlightedFeature = null;
        prevFeature.set("HITON", false, true);
        var revokeStyle = prevFeature.getStyle();
        revokeStyle.getImage().setScale(prevFeature.get("CLICKED")?ICONSCALE_CLICKED:ICONSCALE_BASIC);
        prevFeature.setStyle(revokeStyle);
        if(!isOnPopup) popupTimeout = setTimeout(closePopup(), 300);
      }
    } else {
      isHitOn = true;
    }
  }

  // hit detector
  var hit2 = map.forEachFeatureAtPixel(e.pixel, function (feature, layer) {
    hitOnCount++;
    hitOutCount = 0;
    isHitOn = true;

    highlightedFeature = feature;
    highlightedFeature.set("HITON", true, true);
    var baseScale = highlightedFeature.get("CLICKED")?ICONSCALE_CLICKED:ICONSCALE_BASIC;
    var iconScaleMultiplier = highlightedFeature.get("HITON")?1.15:1.0;
    var tempStyle = feature.getStyle();
    tempStyle.getImage().setScale(baseScale * iconScaleMultiplier);
    highlightedFeature.setStyle(tempStyle);

    if (prevFeature != null) {
      // not first Hit
      if (prevFeature == highlightedFeature) {
        // hit previous feature again - called on mousemove
        if(hitOnCount == 1) {
          // called once
          console.log("### Hit Detecter ### -- re-Hit");
          if(!isOnPopup) showPopup(highlightedFeature);
        }
      } else {
        // new feature hit.
        console.log("### Hit Detecter ### -- new Hit");
        var revokeStyle = prevFeature.getStyle();
        revokeStyle.getImage().setScale(prevFeature.get("CLICKED")?ICONSCALE_CLICKED:ICONSCALE_BASIC);
        prevFeature.setStyle(revokeStyle);
        prevFeature = highlightedFeature;
        if(!isOnPopup) showPopup(highlightedFeature);
      }
    } else {
      // first hit
      console.log("### Hit Detecter ### -- first Hit");
      prevFeature = highlightedFeature;
      if(!isOnPopup) showPopup(highlightedFeature);
    }
    return true;
  }, {
    layerFilter: function (layer) {
      return (layer == status_err_vector || layer == status_chk_vector);
    },
    hitTolerance: 5,
  });

  map.getTargetElement().style.cursor = isHitOn ? 'pointer' : '';
});

map.on('moveend', function () {

});

