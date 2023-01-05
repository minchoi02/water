function fnSearch() {
    document.listForm.pageIndex.value = "1";
    document.listForm.submit();
}
function fnFileListHtml(fileList){

    var html = "";
    if(fileList.length>0){
        html+= "<tr id=\"fileList\" name=\"fileList\">";
        html+= "<th scope=\"col\"><span>첨부파일목록</span></th>";
        html+= "<td colspan=\"2\">";

        for(var i=0;i<fileList.length;i++){
         var cateView = "";
         if(fileList[i].cateNm != null && fileList[i].cateNm != "")
        	 cateView += "[" + fileList[i].cateNm + "]";
         if(fileList[i].odr != null && fileList[i].odr != "")
        	 cateView += "[" + fileList[i].odr + "차]";

    	 html+=  "<span class=\"link\"><a href=\"#LINK\" onclick=\"javascript:fn_egov_downFile('"+fileList[i].atchFileId+"','"+fileList[i].fileSn+"')\">";
    	 html+=	 cateView + fileList[i].orignlFileNm+"&nbsp;["+fileList[i].fileMg+"&nbsp;byte]</a>";
    	 html+=  "</span>";
    	 html+=  "<img  alt=\"파일 삭제\" src=\"/images/btn/bu5_close.gif\"";
    	 html+=  "width=\"19\" height=\"18\" onClick=\"fn_egov_deleteFile('"+fileList[i].atchFileId+"','"+fileList[i].fileSn+"');\" />";
    	 html+=  "<br/>"
        }
        html+=  "</td>";
        html+= "</tr>";
    }
   return html;
}

/* 3자리 콤마 정규식 : 화면 출력 용도 */
function fn_numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/**
 * 단일 input 전화번호 하이픈 처리
 * @param objId
 * @returns
 */
function fn_egov_blurChkTel(objId){
	var telVal = chkDigit(objId.val());
	var len = telVal.length;
	var rtnVal = true;

	if(len==8){
		if(telVal.substring(0,2)==02){
			rtnVal = error_number(objId);
		}else{
			objId.val(phone_format(1, telVal));
		}
	}else if(len==9){
		if(telVal.substring(0,2)==02){
			objId.val(phone_format(2, telVal));
		}else{
			rtnVal = error_number(objId);
		}
	}else if(len==10){
		if(telVal.substring(0,2)==02){
			objId.val(phone_format(2, telVal));
		}else{
			objId.val(phone_format(3, telVal));
		}
	}else if(len==11){
		if(telVal.substring(0,2)==02){
			rtnVal = error_number(objId);
		}else{
			objId.val(phone_format(3, telVal));
		}
	}else{
		rtnVal = error_number(objId);
	}
	return rtnVal;
}

// 하이픈 제거 용도
function chkDigit(num){
	var digit = "1234567890";
	var chkDigtVal = num;
	var rtnVal = "";

	for(i=0; i<chkDigtVal.length; i++){
		if(digit.indexOf(chkDigtVal.substring(i, i+1))>=0){
			rtnVal = rtnVal+chkDigtVal.substring(i, i+1);
		}
	}
	return rtnVal;
}

// 전화번호 관련 정규식
function phone_format(type, num){
	if(type==1){
		return num.replace(/([0-9]{4})([0-9]{4})/, "$1-$2");
	}else if(type==2){
		return num.replace(/([0-9]{2})([0-9]+)([0-9]{4})/, "$1-$2-$3");
	}else{
		return num.replace(/(^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
	}
}

// 유효성검사 에러시 출력 용도
function error_number(objId){
	alert("정상적인 전화번호가 아닙니다.");
	objId.focus();
	return false;
}
function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
    }
}

function maxLengthCheck(e){
	var obj = $("#"+e.id);
    var maxLength = obj.attr("maxLength") != null ? obj.attr("maxLength") : 100;

    if(Number(byteCheck(obj)) > Number(maxLength)) {
        alert("입력가능문자수를 초과하였습니다.\n(영문, 숫자, 일반 특수문자 : " + maxLength + " / 한글, 한자 : " + parseInt(maxLength/3, 10) + ").");
        var reStr = e.value.slice(0, -1);
        e.value = reStr;
        obj.focus();
        return false;
    } else {
        return true;
   }
}

function byteCheck(el){
    var codeByte = 0;
    for (var idx = 0; idx < el.val().length; idx++) {
        var oneChar = escape(el.val().charAt(idx));
        if ( oneChar.length == 1 ) {
            codeByte ++;
        } else if (oneChar.indexOf("%u") != -1) {
            codeByte += 3;
        } else if (oneChar.indexOf("%") != -1) {
            codeByte ++;
        }
    }
    return codeByte;
}
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
// 사이트맵
jQuery(document).ready(function() {

	// all nav
	jQuery(".Sitemap").click(function(e){
		jQuery("#overlay").show();
		jQuery("#all_nav").addClass("active");
	});
	jQuery(".all_nav_close").click(function(e){
		jQuery("#overlay").hide();
		jQuery("#all_nav").removeClass("active");
	});

	// SlideToggle
/*	$('.slideBtn').click(function (e) {
		$("#leftmenu, .slideBtn").toggleClass("slide");
	});*/

});

