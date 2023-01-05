package egovframework.appn.sys.pwm.web;

import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.appn.sys.pwm.service.PopupManageService;
import egovframework.appn.sys.pwm.service.PopupManageVO;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.FileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 개요
 * - 팝업창에 대한 Controller를 정의한다.
 *
 * 상세내용
 * - 팝업창에 대한 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 팝업창의 조회기능은 목록조회, 상세조회로, 사용자 화면 보기로 구분된다.
 * @author 이창원
 * @version 1.0
 * @created 05-8-2009 오후 2:19:57
 * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일              수정자           수정내용
  *  ---------   --------   ---------------------------
  *  2009.08.05   이창원           최초 생성
  *  2011.08.26   정진오           IncludedInfo annotation 추가
  *  2019.05.17   신용호           취약점 조치 및 보완
  *
  * </pre>
 */

@Controller
public class PopupManageController {

	private static final Logger LOGGER = LoggerFactory.getLogger(PopupManageController.class);

	@Autowired
	private DefaultBeanValidator beanValidator;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** popupManageService */
	@Resource(name = "popupManageService")
	private PopupManageService popupManageService;

	@Resource(name = "FileMngService")
	private FileMngService fileMngService;

    @Resource(name = "egovFileIdGnrService")
    private EgovIdGnrService idgenService;

	/**
	 * 팝업창관리 목록을 조회한다.
	 * @param popupManageVO
	 * @param model
	 * @return "egovframework/com/sys/pwm/listPopupManage"
	 * @throws Exception
	 */
//	@IncludedInfo(name = "팝업창관리", order = 720, gid = 50)
	@RequestMapping(value = "/sys/pwm/listPopup.do")
	public String egovPopupManageList(@RequestParam Map<?, ?> commandMap, PopupManageVO popupManageVO, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		popupManageVO.setPageUnit(propertiesService.getInt("pageUnit"));
		popupManageVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(popupManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(popupManageVO.getPageUnit());
		paginationInfo.setPageSize(popupManageVO.getPageSize());

		popupManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		popupManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		popupManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<PopupManageVO> reusltList = popupManageService.selectPopupList(popupManageVO);

		model.addAttribute("resultList", reusltList);

		model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String) commandMap.get("searchKeyword"));
		model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String) commandMap.get("searchCondition"));

		int totCnt = popupManageService.selectPopupListCount(popupManageVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sys/pwm/PopupList";
	}

	/**
	 * 통합링크관리 목록을 상세조회 조회한다.
	 * @param popupManageVO
	 * @param commandMap
	 * @param model
	 * @return
	 *         "/sys/pwm/detailPopupManage"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/pwm/detailPopup.do")
	public String egovPopupManageDetail(@ModelAttribute("searchVO") ComDefaultVO searchVO, PopupManageVO popupManageVO, @RequestParam Map<?, ?> commandMap, ModelMap model) throws Exception {

		String sLocationUrl = "sys/pwm/PopupDetail";

		String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");
		model.addAttribute("searchVO", searchVO);

		if (sCmd.equals("del")) {
			popupManageService.deletePopup(popupManageVO);
			sLocationUrl = "forward:/sys/pwm/listPopup.do";
		} else {
			//상세정보 불러오기
			PopupManageVO popupManageVOs = popupManageService.selectPopup(popupManageVO);
			model.addAttribute("popupManageVO", popupManageVOs);
		}

		return sLocationUrl;
	}

	/**
	 * 통합링크관리를 수정한다.
	 * @param searchVO
	 * @param popupManageVO
	 * @param bindingResult
	 * @param model
	 * @return
	 *         "/sys/pwm/updtPopupManage"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/pwm/updtPopup.do")
	public String egovPopupManageUpdt(@ModelAttribute("searchVO") ComDefaultVO searchVO, @RequestParam Map<?, ?> commandMap, PopupManageVO popupManageVO, BindingResult bindingResult, ModelMap model,HttpServletRequest req) throws Exception {
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));



    	model.addAttribute("isAdmin", isAdmin);
		if (loginvo.getAuthorCode()==null) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}
		model.addAttribute("searchVO", searchVO);
		// 로그인 객체 선언


		String sLocationUrl = "sys/pwm/PopupUpdt";

		String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

		//팝업창시작일자(시)
		model.addAttribute("ntceBgndeHH", getTimeHH());
		//팝업창시작일자(분)
		model.addAttribute("ntceBgndeMM", getTimeMM());
		//팝업창종료일자(시)
		model.addAttribute("ntceEnddeHH", getTimeHH());
		//팝업창정료일자(분)
		model.addAttribute("ntceEnddeMM", getTimeMM());

		if (sCmd.equals("save")) {
			sLocationUrl = "forward:/sys/pwm/listPopup.do";
			//서버  validate 체크
			/*beanValidator.validate(popupManageVO, bindingResult);
			if (bindingResult.hasErrors()) {
				return sLocationUrl;
			}*/

			boolean newFileFlag = false;

	    	String atchFileId = popupManageVO.getAtchFileId();
	    	atchFileId = atchFileId.trim();
	    	if(atchFileId.equals("")) {
	    		newFileFlag = true;
	    	}

	    	String uploadedFilesInfo =  (String)req.getParameter("uploadedFilesInfo");
	    	String modifiedFilesInfo =  (String)req.getParameter("modifiedFilesInfo");

	    	List<FileVO> totFilevoList = new ArrayList<FileVO>();

	    	if(uploadedFilesInfo!="") {
	    		List<FileVO> filevoList = getUploadFileListVO(uploadedFilesInfo,popupManageVO.getAtchFileId());
	    		totFilevoList.addAll(filevoList);
	    	}
	    	if(modifiedFilesInfo!="") {
	    		List<FileVO> filevoList2 = getModifiredFileListVO(modifiedFilesInfo,popupManageVO.getAtchFileId());
	    		fileMngService.deleteFileInfs(filevoList2);
	    	}

	    	if(totFilevoList.size()>0) {
		    	if(newFileFlag) {
		    		fileMngService.insertFileInfs(totFilevoList);
		    		popupManageVO.setAtchFileId(totFilevoList.get(0).getAtchFileId());
		    	}else {
		    		fileMngService.updateFileInfs(totFilevoList);
		    	}
	    	}else {
	    		if(modifiedFilesInfo=="") {
	    			popupManageVO.setAtchFileId("");
	    		}
	    	}
			//아이디 설정
			popupManageVO.setFrstRegisterId(loginvo.getUniqId());
			popupManageVO.setLastUpdusrId(loginvo.getUniqId());
			//저장
			popupManageService.updatePopup(popupManageVO);
		} else {

			PopupManageVO popupManageVOs = popupManageService.selectPopup(popupManageVO);

			FileVO fileVO =  new FileVO();
			fileVO.setAtchFileId(popupManageVOs.getAtchFileId());

	    	model.addAttribute("fileList", new ObjectMapper().writeValueAsString(fileMngService.selectFileInfs(fileVO)));

			String sNtceBgnde = popupManageVOs.getNtceBgnde();
			String sNtceEndde = popupManageVOs.getNtceEndde();

			popupManageVOs.setNtceBgndeHH(sNtceBgnde.substring(8, 10));
			popupManageVOs.setNtceBgndeMM(sNtceBgnde.substring(10, 12));

			popupManageVOs.setNtceEnddeHH(sNtceEndde.substring(8, 10));
			popupManageVOs.setNtceEnddeMM(sNtceEndde.substring(10, 12));

			model.addAttribute("popupManageVO", popupManageVOs);
		}

		return sLocationUrl;
	}

	/**
	 * 통합링크관리를 등록한다.
	 * @param searchVO
	 * @param popupManageVO
	 * @param bindingResult
	 * @param model
	 * @return
	 *         "/sys/pwm/registPopupManage"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/pwm/registPopup.do")
	public String egovPopupManageRegist(@ModelAttribute("searchVO") ComDefaultVO searchVO, @RequestParam Map<?, ?> commandMap, @ModelAttribute("popupManageVO") PopupManageVO popupManageVO, BindingResult bindingResult,
			ModelMap model,HttpServletRequest req) throws Exception {

    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");

		model.addAttribute("searchVO", searchVO);

		String sLocationUrl = "sys/pwm/PopupRegist";

		String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");
		LOGGER.info("cmd => {}", sCmd);

		if (sCmd.equals("save")) {

			boolean newFileFlag = false;

	    	String atchFileId = popupManageVO.getAtchFileId();
	    	atchFileId = atchFileId.trim();
	    	if(atchFileId.equals("")) {
	    		newFileFlag = true;
	    	}

	    	String uploadedFilesInfo =  (String)req.getParameter("uploadedFilesInfo");
	    	String modifiedFilesInfo =  (String)req.getParameter("modifiedFilesInfo");

	    	List<FileVO> totFilevoList = new ArrayList<FileVO>();

	    	if(uploadedFilesInfo!="") {
	    		List<FileVO> filevoList = getUploadFileListVO(uploadedFilesInfo,popupManageVO.getAtchFileId());
	    		totFilevoList.addAll(filevoList);
	    	}
	    	if(modifiedFilesInfo!="") {
	    		List<FileVO> filevoList2 = getModifiredFileListVO(modifiedFilesInfo,popupManageVO.getAtchFileId());
	    		fileMngService.deleteFileInfs(filevoList2);
	    	}

	    	if(totFilevoList.size()>0) {
		    	if(newFileFlag) {
		    		fileMngService.insertFileInfs(totFilevoList);
		    		popupManageVO.setAtchFileId(totFilevoList.get(0).getAtchFileId());
		    	}else {
		    		fileMngService.updateFileInfs(totFilevoList);
		    	}
	    	}else {
	    		if(modifiedFilesInfo=="") {
	    			popupManageVO.setAtchFileId("");
	    		}
	    	}

			//아이디 설정
			popupManageVO.setFrstRegisterId(loginvo.getUniqId());
			popupManageVO.setLastUpdusrId(loginvo.getUniqId());
			//저장
			popupManageService.insertPopup(popupManageVO);

			sLocationUrl = "forward:/sys/pwm/listPopup.do";
		}

		//팝업창시작일자(시)
		model.addAttribute("ntceBgndeHH", getTimeHH());
		//팝업창시작일자(분)
		model.addAttribute("ntceBgndeMM", getTimeMM());
		//팝업창종료일자(시)
		model.addAttribute("ntceEnddeHH", getTimeHH());
		//팝업창정료일자(분)
		model.addAttribute("ntceEnddeMM", getTimeMM());

		return sLocationUrl;
	}

	/**
	 * 팝업창정보를 조회한다.
	 * @param commandMap
	 * @param popupManageVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/pwm/ajaxPopupManageInfo.do")
	public void egovPopupManageInfoAjax(@RequestParam Map<?, ?> commandMap, HttpServletResponse response, PopupManageVO popupManageVO) throws Exception {

		response.setHeader("Content-Type", "text/html;charset=utf-8");
		PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));

		LOGGER.debug("commandMap : {}", commandMap);
		LOGGER.debug("popupManageVO : {}", popupManageVO);

		PopupManageVO popupManageVOs = popupManageService.selectPopup(popupManageVO);

		String sPrint = "";
		sPrint = popupManageVOs.getFileUrl();
		sPrint = sPrint + "||" + popupManageVOs.getPopupWSize();
		sPrint = sPrint + "||" + popupManageVOs.getPopupHSize();
		sPrint = sPrint + "||" + popupManageVOs.getPopupHlc();
		sPrint = sPrint + "||" + popupManageVOs.getPopupWlc();
		sPrint = sPrint + "||" + popupManageVOs.getStopVewAt();
		out.print(sPrint);
		out.flush();
	}

	@RequestMapping(value = "/sys/pwm/ajaxPopupManageInfoGet.do")
	public void egovPopupManageInfoGetAjax(@RequestParam Map<?, ?> commandMap, HttpServletResponse response, PopupManageVO popupManageVO) throws Exception {

		response.setHeader("Content-Type", "text/html;charset=utf-8");
		PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));

		LOGGER.debug("commandMap : {}", commandMap);
		LOGGER.debug("popupManageVO : {}", popupManageVO);

		PopupManageVO popupManageVOs = popupManageService.selectPopup(popupManageVO);

		String sPrint = "";
		sPrint = popupManageVOs.getFileUrl();
		sPrint = sPrint + "||" + popupManageVOs.getPopupWSize();
		sPrint = sPrint + "||" + popupManageVOs.getPopupHSize();
		sPrint = sPrint + "||" + popupManageVOs.getPopupHlc();
		sPrint = sPrint + "||" + popupManageVOs.getPopupWlc();
		sPrint = sPrint + "||" + popupManageVOs.getStopVewAt();
		out.print(sPrint);
		out.flush();
	}

	/**
	 * 팝업창을 오픈 한다.
	 * @param commandMap
	 * @param popupManageVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/pwm/openPopupManage.do")
	public @ResponseBody String egovPopupManagePopupOpen(@RequestParam("fileUrl") String fileUrl, @RequestParam("stopVewAt") String stopVewAt, @RequestParam("popupId") String popupId,
			ModelMap model) throws Exception {

		PopupManageVO popupManageVO = new PopupManageVO();
		popupManageVO.setPopupId(popupId);
		popupManageVO =  popupManageService.selectPopup(popupManageVO);
		String result = "";
		if(popupManageVO.getFileUrl().contains("http")){
			result += "<a href=\""+popupManageVO.getFileUrl()+"\" target=\"_blank\"><img src=\"/cmm/fms/getImage.do?atchFileId="+popupManageVO.getAtchFileId()+"&amp;fileSn="+popupManageVO.getFileSn()+"\"  alt=\"배너이미지\"></a>";
		}else {
			result += "<a href=\""+popupManageVO.getFileUrl()+"\"><img src=\"/cmm/fms/getImage.do?atchFileId="+popupManageVO.getAtchFileId()+"&amp;fileSn="+popupManageVO.getFileSn()+"\"  alt=\"배너이미지\"></a>";
		}
		result += "<script type=\"text/javascript\">";
		result += "function fn_goBbs(bbsId, nodeNum, nttId) {";
		result += "	document.menuListForm.activeMenuId.value=nodeNum;";
		result += "	document.getElementById(\"baseMenuNo\").value=\"8000000\";";
		result += " if(nttId == '' || nttId == null) document.getElementById(\"link\").value=\"forward:/cop/bbs/selectBoardList.do?bbsId=\"+bbsId;";
		result += "	else document.getElementById(\"link\").value=\"forward:/cop/bbs/selectBoardArticle.do?bbsId=\" + bbsId + \"&nttId=\" + nttId;";
		result += "document.menuListForm.action = '/PageLink.do';";
		result += "var gsWin = window.open(\"about:blank\",\"newWindow\");";
		result += "document.menuListForm.target=\"newWindow\";";
		result += "document.menuListForm.submit();";
		result += "}";
		result += "</script>";
		result += "<form name=\"menuListForm\" action=\"\" method=\"post\">";
		result += "<input type=\"hidden\" id=\"baseMenuNo\" name=\"baseMenuNo\" value=\"\" />";
		result += "<input type=\"hidden\" id=\"activeMenuId\" name=\"activeMenuId\" value=\"\" />";
		result += "<input type=\"hidden\" id=\"link\" name=\"link\" value=\"\" />";
		result += "</form>";
		return result;
	}

	/**
	 * 팝업창관리 메인 테스트 목록을 조회한다.
	 * @param popupManageVO
	 * @param model
	 * @return "egovframework/com/sys/pwm/listMainPopup"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/pwm/listMainPopup.do")
	public String egovPopupManageMainList(PopupManageVO popupManageVO, ModelMap model) throws Exception {

		List<PopupManageVO> reusltList = popupManageService.selectPopupMainList(popupManageVO);
		model.addAttribute("resultList", reusltList);

		return "sys/pwm/PopupMainList";
	}

	/**
	 * 시간을 LIST를 반환한다.
	 * @return  List
	 * @throws
	 */
	@SuppressWarnings("unused")
	private List<ComDefaultCodeVO> getTimeHH() {
		ArrayList<ComDefaultCodeVO> listHH = new ArrayList<ComDefaultCodeVO>();
		HashMap<?, ?> hmHHMM;
		for (int i = 0; i <= 24; i++) {
			String sHH = "";
			String strI = String.valueOf(i);
			if (i < 10) {
				sHH = "0" + strI;
			} else {
				sHH = strI;
			}

			ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
			codeVO.setCode(sHH);
			codeVO.setCodeNm(sHH);

			listHH.add(codeVO);
		}

		return listHH;
	}

	/**
	 * 분을 LIST를 반환한다.
	 * @return  List
	 * @throws
	 */
	@SuppressWarnings("unused")
	private List<ComDefaultCodeVO> getTimeMM() {
		ArrayList<ComDefaultCodeVO> listMM = new ArrayList<ComDefaultCodeVO>();
		HashMap<?, ?> hmHHMM;
		for (int i = 0; i <= 60; i++) {

			String sMM = "";
			String strI = String.valueOf(i);
			if (i < 10) {
				sMM = "0" + strI;
			} else {
				sMM = strI;
			}

			ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
			codeVO.setCode(sMM);
			codeVO.setCodeNm(sMM);

			listMM.add(codeVO);
		}
		return listMM;
	}

	/**
	 * 0을 붙여 반환
	 * @return  String
	 * @throws
	 */
	public String dateTypeIntForString(int iInput) {
		String sOutput = "";
		if (Integer.toString(iInput).length() == 1) {
			sOutput = "0" + Integer.toString(iInput);
		} else {
			sOutput = Integer.toString(iInput);
		}

		return sOutput;
	}
	public List<FileVO> getUploadFileListVO(String param,String atchFileId) throws Exception {

		JSONArray ja = (JSONArray)new JSONParser().parse(param);
		JSONArray ja2 = new JSONArray();
		atchFileId = atchFileId.trim();
		int fileSn = 0;
		if(atchFileId.equals("")) {
			//신규파일
			atchFileId = idgenService.getNextStringId();
		}else {
			//기존파일
			FileVO fvo = new FileVO();
			fvo.setAtchFileId(atchFileId);
			fileSn = fileMngService.getMaxFileSN(fvo);

		}
		List<FileVO> filevoList = new ArrayList<>();
		for(int i=0;i<ja.size();i++) {
			FileVO filevo = new FileVO();
			ja2 = (JSONArray)ja.get(i);
			for(int j=0;j<ja2.size();j++) {

				JSONObject jo = (JSONObject)ja2.get(j);

				filevo.setFileExtsn((String)jo.get("fileExtsn"));
				filevo.setFileMg((String)jo.get("fileMg"));
				filevo.setFileSn(String.valueOf(fileSn));
				filevo.setFileStreCours((String)jo.get("fileStreCours"));
				filevo.setOrignlFileNm((String)jo.get("orignlFileNm"));
				filevo.setStreFileNm((String)jo.get("streFileNm"));
				//신규파일
				filevo.setAtchFileId(atchFileId);

				filevoList.add(filevo);
				fileSn++;
			}
		}
		return filevoList;
	}
	public List<FileVO> getModifiredFileListVO(String param,String atchFileId) throws Exception {

		JSONArray ja = (JSONArray)new JSONParser().parse(param);

		List<FileVO> filevoList = new ArrayList<>();

		for(int i=0;i<ja.size();i++) {
			FileVO filevo = new FileVO();
			JSONObject jo = (JSONObject)ja.get(i);

			if(((String)jo.get("isDeleted")).equals("true")) {
				filevo.setAtchFileId((String)jo.get("fileId"));
				filevo.setOrignlFileNm((String)jo.get("fileName"));
				filevo.setAtchFileId(atchFileId);

				filevoList.add(filevo);
			}
		}
		return filevoList;
	}
}