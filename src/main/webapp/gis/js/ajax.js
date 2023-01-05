
// search customer
var clickedOne = null;
function ajax_searchCustomer(text) {
  $.ajax({
    type: "POST",
    url: "/gis/jsp/search.jsp",
    datatype: "text",
    data: {
      "t": text,
    },
    error: function (data) {
      return false;
    },
    success: function (data) {
      var splitData = data.split('\r\n').join('');
      var eachMeter = splitData.slice(0, -2).split("//");

      var resultContainer = document.getElementById("searchResult");
      while (resultContainer.firstChild) {
        resultContainer.removeChild(resultContainer.firstChild);
      }
      var html = '';
      if (eachMeter.length == 0 || eachMeter[0] == "") {
        document.getElementById('searchString').innerText = "'" + text + "' 검색 결과가 없습니다.";
        document.getElementById('searchString').style.visibility = "visible";
      }
      else {
        for (var i = 0; i < eachMeter.length; i++) {
          var dataPerMeter = eachMeter[i].split('|');
          var cusnum = dataPerMeter[0];
          var npsnm = dataPerMeter[1];
          var nstadr =  dataPerMeter[2];
          var lat =  dataPerMeter[3];
          var lng =  dataPerMeter[4];
          var status = '-';
          var color = '#555';
          switch (dataPerMeter[5]) {
            case "1":
              status = "정상";
              color = '#27AE60';
              break;
            case "2":
              status = "점검";
              color = '#E1B82B';
              break;
            case "3":
              status = "장애";
              color = '#EB5757';
              break;
          }
          html += '' +
            '<li>' +
            '  <a onclick="clickResult('+ lng +', ' + lat + ', \'' + cusnum + '\')"><b>' + cusnum + '</b> ' + npsnm +
            '    <dl>' +
            '      <dt>도로명</dt>' +
            '      <dd>' + nstadr + '</dd>' +
            '    </dl>' +
            '    <dl>' +
            '      <dt>상태</dt>' + 
            '      <dd style="color:' + color + ';">' + status + '</dd>' +
            '    </dl>' +
            '  </a>' +
            '</li>';
        }
      }
      resultContainer.innerHTML = html;
    },
    complete: function (xhr, status) {}
  });
}
