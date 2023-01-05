var draw;
var listener; 
var sketch; //라인스트링 이벤트 시 geometry객체를 담을 변수
var helpTooltipElement; // 화살표 옆 div
var helpTooltip; // 화살표 옆 div 내용
var measureTooltipElement; // 거리, 면적 div
var measureTooltip; // 거리, 면적 div 내용
var continuePolygonMsg = '클릭 시 면적이 계산됩니다.';
var continueLineMsg = '클릭 시 거리가 계산됩니다.';

function drawStart(typeWhat) {
	var type = typeWhat.id;
	map.removeInteraction(draw);
	map.on('pointermove', pointerMoveHandler);
	addInteraction(type);
}

function drawEnd() {
	  map.removeInteraction(draw);
	  measureVector.getSource().clear();
	  map.un('pointermove', pointerMoveHandler);
	  map.removeOverlay(measureTooltip);
	  map.removeOverlay(helpTooltip);
	  $('.ol-measure').remove();
};

function addInteraction(typeWhat) { 
	var type = typeWhat;
	draw = new ol.interaction.Draw({ 
		source: measureSource, 
		type: (type), 
		style: new ol.style.Style({ 
			fill: new ol.style.Fill({ 
				color: 'rgba(255, 255, 255, 0.2)', 
			}), 
			stroke: new ol.style.Stroke({ 
				color: 'rgba(0, 0, 0, 0.5)', 
				lineDash: [10, 10], width: 2, 
			}), 
			image: new ol.style.Circle({ 
				radius: 5,
				stroke: new ol.style.Stroke({
					color: 'rgba(255, 204, 51, 0.9)'
			    }),
			    fill: new ol.style.Fill({
			    	color: 'rgba(255, 204, 51, 0.4)'
			    })
			}), 
		}), 
	}) 
	
	map.addInteraction(draw); 
	createMeasureTooltip(); 
	createHelpTooltip();
	

	draw.on('drawstart', function(evt) { 
		sketch = evt.feature; 
		listener = sketch.getGeometry().on('change', function(evt) { 
			var geom = evt.target; 
			var output;
			if (geom instanceof ol.geom.Polygon) {
				output = formatArea(geom);
				tooltipCoord = geom.getInteriorPoint().getCoordinates();
	        } else if (geom instanceof ol.geom.LineString) {
	        	output = formatLength(geom);
	        	tooltipCoord = geom.getLastCoordinate();
	        }
			measureTooltipElement.innerHTML = output; 
			measureTooltip.setPosition(tooltipCoord); 
		}) 
	}) 
	
	draw.on('drawend', function() { 
		measureTooltipElement.className = 'ol-tooptip ol-tooltip-static'; 
		measureTooltip.setOffset([0, -7]); 
		//unset sketch 
		sketch = null; 
		measureTooltipElement = null; 
		createMeasureTooltip(); 
		new ol.Observable(listener) 
	}) 
}

function createMeasureTooltip() { 
	if (measureTooltipElement) { 
		measureTooltipElement.parentNode.removeChild(measureTooltipElement); 
	} 
	measureTooltipElement = document.createElement('div'); 
	measureTooltipElement.className = 'ol-tooltip ol-tooltip-measure'; 
	measureTooltip = new ol.Overlay({
		element: measureTooltipElement, 
		offset: [0, -15], 
		positioning: 'bottom-center', 
		className: "ol-measure"
	}); 
	map.addOverlay(measureTooltip); 
}; 

function createHelpTooltip() {
	  if (helpTooltipElement) {
	    helpTooltipElement.parentNode.removeChild(helpTooltipElement);
	  }
	  helpTooltipElement = document.createElement('div');
	  helpTooltipElement.className = 'tooltip hidden';
	  helpTooltip = new ol.Overlay({
	    element: helpTooltipElement,
	    offset: [15, 0],
	    positioning: 'center-left',
	    className: "ol-measure"
	  });
	  map.addOverlay(helpTooltip);
	}
var pointerMoveHandler = function(evt) {
	  if (evt.dragging) {
	    return;
	  }
	  var helpMsg = '클릭하면 시작합니다.';
	  if (sketch) {
	    var geom = (sketch.getGeometry());
	    if (geom instanceof ol.geom.Polygon) {
	      helpMsg = continuePolygonMsg;
	    } else if (geom instanceof ol.geom.LineString) {
	      helpMsg = continueLineMsg;
	    }
	  }
	  helpTooltipElement.innerHTML = helpMsg;
	  helpTooltip.setPosition(evt.coordinate);
	  helpTooltipElement.classList.remove('hidden');
	};

function formatLength(line) { 
	var length = ol.sphere.getLength(line); 
	var output; 
	if (length > 1000) { 
		output = Math.round((length / 1000) * 100) / 100 + ' ' + 'km'; 
	} 
	else { 
		output = Math.round(length * 100) / 100 + ' ' + 'm'; 
	} 
	return output; 
};

function formatArea(polygon) { 
	var area = ol.sphere.getArea(polygon); 
	var output; 
	if (area > 1000000) {
		output = Math.round((area / 1000000) * 100) / 100 + ' ' + 'km<sup>2</sup>'; 
	} else { 
		output = Math.round(area * 100) / 100 + ' ' + 'm<sup>2</sup>'; 
	} 
	return output;
};


