package egovframework.appn.cmm.tld;

public class PageInfo {
	public static String renderPageInfo(String selectedValue, String totCnt, String selectAt) {
		String returnVal = "";

//		returnVal += "<div id='page_info'>";
//
//		returnVal += "<div id='page_info_left'>";
//		returnVal += "총 <strong>" + totCnt + "건</strong>이 검색 되었습니다.";
//		returnVal += "</div>";
//
//
//		if("Y".equals(selectAt)) {
//			returnVal += "<div id='page_info_right'>";
//			returnVal += "<select id='recordCountPerPage' name='recordCountPerPage' onchange='fnSearch();' class='select_style1 input_w5'>";
//
//			if("10".equals(selectedValue)) returnVal += "	<option value='10' selected>10개</option>";
//			else returnVal += "	<option value='10'>10개</option>";
//
//			if("30".equals(selectedValue)) returnVal += "	<option value='30' selected>30개</option>";
//			else returnVal += "	<option value='30'>30개</option>";
//
//			if("50".equals(selectedValue)) returnVal += "	<option value='50' selected>50개</option>";
//			else returnVal += "	<option value='50'>50개</option>";
//
//			returnVal += "</select>";
//			returnVal += "</div>";
//		}else {
//			returnVal += "<div id='page_info_right'>";
//			returnVal += "<a href='#' class='filetype filetype1' onclick='fnExcel(); return false;'>엑셀</a>";
//			returnVal += "<label class='first'>다운로드</label>";
//			returnVal += "</div>";
//		}
//
//
//		returnVal += "</div>";

		returnVal += "<div class='table-header'>";
		returnVal += "<div> 총 <strong class='secondary'>" + totCnt + "</strong>건이 검색 되었습니다.</div>";

		if("Y".equals(selectAt)) {
			returnVal += "<div>";
			returnVal += "<select id='recordCountPerPage' name='recordCountPerPage' onchange='fnSearch();'>";

			if("10".equals(selectedValue)) returnVal += "<option value='10' selected>10개씩보기</option>";
			else returnVal +="<option value='10'>10개씩보기</option>";

			if("30".equals(selectedValue)) returnVal += "<option value='30' selected>30개씩보기</option>";
			else returnVal +="<option value='30'>30개씩보기</option>";

			if("50".equals(selectedValue)) returnVal += "<option value='50' selected>50개씩보기</option>";
			else returnVal +="<option value='50'>50개씩보기</option>";

			returnVal += "</select></div></div>";
		}
		return returnVal;
	}

	public static String renderPageInfo(String selectedValue, String totCnt) {
		String returnVal = "";

		returnVal += "<div id='page_info'>";

		returnVal += "<div id='page_info_left'>";
		returnVal += "총 <strong>" + totCnt + "건</strong>이 검색 되었습니다.";
		returnVal += "</div>";

		returnVal += "<div id='page_info_right'>";
		returnVal += "<a href='#' class='filetype filetype1' onclick='fnExcel(); return false;'>엑셀</a>";
		returnVal += "<label class='first'>다운로드</label>";
		returnVal += "<select id='recordCountPerPage' name='recordCountPerPage' onchange='fnSearch();' class='select_style1 input_w5'>";

		if("10".equals(selectedValue)) returnVal += "	<option value='10' selected>10개</option>";
		else returnVal += "	<option value='10'>10개</option>";

		if("30".equals(selectedValue)) returnVal += "	<option value='30' selected>30개</option>";
		else returnVal += "	<option value='30'>30개</option>";

		if("50".equals(selectedValue)) returnVal += "	<option value='50' selected>50개</option>";
		else returnVal += "	<option value='50'>50개</option>";

		returnVal += "</select>";
		returnVal += "</div>";

		returnVal += "</div>";

		return returnVal;
	}

}
