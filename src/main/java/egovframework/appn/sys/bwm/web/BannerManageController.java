package egovframework.appn.sys.bwm.web;

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

import egovframework.appn.sys.bwm.service.BannerManageService;
import egovframework.appn.sys.bwm.service.BannerManageVO;
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
 * - 배너창에 대한 Controller를 정의한다.
 *
 * 상세내용
 * - 배너창에 대한 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 배너창의 조회기능은 목록조회, 상세조회로, 사용자 화면 보기로 구분된다.
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
public class BannerManageController {

	private static final Logger LOGGER = LoggerFactory.getLogger(BannerManageController.class);

	@Autowired
	private DefaultBeanValidator beanValidator;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** bannerManageService */
	@Resource(name = "bannerManageService")
	private BannerManageService bannerManageService;

	@Resource(name = "FileMngService")
	private FileMngService fileMngService;

    @Resource(name = "egovFileIdGnrService")
    private EgovIdGnrService idgenService;

	/**
	 * 배너창관리 목록을 조회한다.
	 * @param bannerManageVO
	 * @param model
	 * @return "egovframework/com/sys/bwm/listBannerManage"
	 * @throws Exception
	 */
//	@IncludedInfo(name = "배너창관리", order = 720, gid = 50)
	@RequestMapping(value = "/sys/bwm/listBanner.do")
	public String egovBannerManageList(@RequestParam Map<?, ?> commandMap, BannerManageVO bannerManageVO, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		bannerManageVO.setPageUnit(propertiesService.getInt("pageUnit"));
		bannerManageVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(bannerManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(bannerManageVO.getPageUnit());
		paginationInfo.setPageSize(bannerManageVO.getPageSize());

		bannerManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		bannerManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		bannerManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<BannerManageVO> reusltList = bannerManageService.selectBannerList(bannerManageVO);

		model.addAttribute("resultList", reusltList);

		model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String) commandMap.get("searchKeyword"));
		model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String) commandMap.get("searchCondition"));

		int totCnt = bannerManageService.selectBannerListCount(bannerManageVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sys/bwm/BannerList";
	}

	/**
	 * 통합링크관리 목록을 상세조회 조회한다.
	 * @param bannerManageVO
	 * @param commandMap
	 * @param model
	 * @return
	 *         "/sys/bwm/detailBannerManage"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/bwm/detailBanner.do")
	public String egovBannerManageDetail(@ModelAttribute("searchVO") ComDefaultVO searchVO, BannerManageVO bannerManageVO, @RequestParam Map<?, ?> commandMap, ModelMap model) throws Exception {

		String sLocationUrl = "sys/bwm/BannerDetail";

		String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");
		model.addAttribute("searchVO", searchVO);

		if (sCmd.equals("del")) {
			bannerManageService.deleteBanner(bannerManageVO);
			sLocationUrl = "forward:/sys/bwm/listBanner.do";
		} else {
			//상세정보 불러오기
			BannerManageVO bannerManageVOs = bannerManageService.selectBanner(bannerManageVO);
			model.addAttribute("bannerManageVO", bannerManageVOs);
		}

		return sLocationUrl;
	}

	/**
	 * 통합링크관리를 수정한다.
	 * @param searchVO
	 * @param bannerManageVO
	 * @param bindingResult
	 * @param model
	 * @return
	 *         "/sys/bwm/updtBannerManage"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/bwm/updtBanner.do")
	public String egovBannerManageUpdt(@ModelAttribute("searchVO") ComDefaultVO searchVO, @RequestParam Map<?, ?> commandMap, BannerManageVO bannerManageVO, BindingResult bindingResult, ModelMap model,HttpServletRequest req) throws Exception {
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


		String sLocationUrl = "sys/bwm/BannerUpdt";

		String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

		//배너창시작일자(시)
		model.addAttribute("ntceBgndeHH", getTimeHH());
		//배너창시작일자(분)
		model.addAttribute("ntceBgndeMM", getTimeMM());
		//배너창종료일자(시)
		model.addAttribute("ntceEnddeHH", getTimeHH());
		//배너창정료일자(분)
		model.addAttribute("ntceEnddeMM", getTimeMM());

		if (sCmd.equals("save")) {
			sLocationUrl = "forward:/sys/bwm/listBanner.do";
			//서버  validate 체크
			/*beanValidator.validate(bannerManageVO, bindingResult);
			if (bindingResult.hasErrors()) {
				return sLocationUrl;
			}*/
			//아이디 설정
			bannerManageVO.setFrstRegisterId(loginvo.getUniqId());
			bannerManageVO.setLastUpdusrId(loginvo.getUniqId());
			//저장
			bannerManageService.updateBanner(bannerManageVO);
		} else {

			BannerManageVO bannerManageVOs = bannerManageService.selectBanner(bannerManageVO);

			FileVO fileVO =  new FileVO();
			fileVO.setAtchFileId(bannerManageVOs.getAtchFileId());

	    	model.addAttribute("fileList", new ObjectMapper().writeValueAsString(fileMngService.selectFileInfs(fileVO)));

			String sNtceBgnde = bannerManageVOs.getNtceBgnde();
			String sNtceEndde = bannerManageVOs.getNtceEndde();

			bannerManageVOs.setNtceBgndeHH(sNtceBgnde.substring(8, 10));
			bannerManageVOs.setNtceBgndeMM(sNtceBgnde.substring(10, 12));

			bannerManageVOs.setNtceEnddeHH(sNtceEndde.substring(8, 10));
			bannerManageVOs.setNtceEnddeMM(sNtceEndde.substring(10, 12));

			model.addAttribute("bannerManageVO", bannerManageVOs);
		}

		return sLocationUrl;
	}

	/**
	 * 통합링크관리를 등록한다.
	 * @param searchVO
	 * @param bannerManageVO
	 * @param bindingResult
	 * @param model
	 * @return
	 *         "/sys/bwm/registBannerManage"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/bwm/registBanner.do")
	public String egovBannerManageRegist(@ModelAttribute("searchVO") ComDefaultVO searchVO, @RequestParam Map<?, ?> commandMap, @ModelAttribute("bannerManageVO") BannerManageVO bannerManageVO, BindingResult bindingResult,
			ModelMap model,HttpServletRequest req) throws Exception {
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

		String sLocationUrl = "sys/bwm/BannerRegist";

		String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");
		LOGGER.info("cmd => {}", sCmd);

		if (sCmd.equals("save")) {
			//서버  validate 체크
			beanValidator.validate(bannerManageVO, bindingResult);
			if (bindingResult.hasErrors()) {
				return sLocationUrl;
			}
			//아이디 설정
			bannerManageVO.setFrstRegisterId(loginvo.getUniqId());
			bannerManageVO.setLastUpdusrId(loginvo.getUniqId());
			//저장
			bannerManageService.insertBanner(bannerManageVO);

			sLocationUrl = "forward:/sys/bwm/listBanner.do";
		}

		//배너창시작일자(시)
		model.addAttribute("ntceBgndeHH", getTimeHH());
		//배너창시작일자(분)
		model.addAttribute("ntceBgndeMM", getTimeMM());
		//배너창종료일자(시)
		model.addAttribute("ntceEnddeHH", getTimeHH());
		//배너창정료일자(분)
		model.addAttribute("ntceEnddeMM", getTimeMM());

		return sLocationUrl;
	}

	/**
	 * 배너창정보를 조회한다.
	 * @param commandMap
	 * @param bannerManageVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/bwm/ajaxBannerManageInfo.do")
	public void egovBannerManageInfoAjax(@RequestParam Map<?, ?> commandMap, HttpServletResponse response, BannerManageVO bannerManageVO) throws Exception {

		response.setHeader("Content-Type", "text/html;charset=utf-8");
		PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));

		LOGGER.debug("commandMap : {}", commandMap);
		LOGGER.debug("bannerManageVO : {}", bannerManageVO);

		BannerManageVO bannerManageVOs = bannerManageService.selectBanner(bannerManageVO);

		String sPrint = "";
		sPrint = bannerManageVOs.getFileUrl();
		sPrint = sPrint + "||" + bannerManageVOs.getBannerWSize();
		sPrint = sPrint + "||" + bannerManageVOs.getBannerHSize();
		sPrint = sPrint + "||" + bannerManageVOs.getBannerHlc();
		sPrint = sPrint + "||" + bannerManageVOs.getBannerWlc();
		sPrint = sPrint + "||" + bannerManageVOs.getStopVewAt();
		out.print(sPrint);
		out.flush();
	}

	@RequestMapping(value = "/sys/bwm/ajaxBannerManageInfoGet.do")
	public void egovBannerManageInfoGetAjax(@RequestParam Map<?, ?> commandMap, HttpServletResponse response, BannerManageVO bannerManageVO) throws Exception {

		response.setHeader("Content-Type", "text/html;charset=utf-8");
		PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));

		LOGGER.debug("commandMap : {}", commandMap);
		LOGGER.debug("bannerManageVO : {}", bannerManageVO);

		BannerManageVO bannerManageVOs = bannerManageService.selectBanner(bannerManageVO);

		String sPrint = "";
		sPrint = bannerManageVOs.getFileUrl();
		sPrint = sPrint + "||" + bannerManageVOs.getBannerWSize();
		sPrint = sPrint + "||" + bannerManageVOs.getBannerHSize();
		sPrint = sPrint + "||" + bannerManageVOs.getBannerHlc();
		sPrint = sPrint + "||" + bannerManageVOs.getBannerWlc();
		sPrint = sPrint + "||" + bannerManageVOs.getStopVewAt();
		out.print(sPrint);
		out.flush();
	}

	/**
	 * 배너창을 오픈 한다.
	 * @param commandMap
	 * @param bannerManageVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/bwm/openBannerManage.do")
	public @ResponseBody String egovBannerManageBannerOpen(@RequestParam("fileUrl") String fileUrl, @RequestParam("stopVewAt") String stopVewAt, @RequestParam("bannerId") String bannerId,
			ModelMap model) throws Exception {

		BannerManageVO bannerManageVO = new BannerManageVO();
		bannerManageVO.setBannerId(bannerId);
		bannerManageVO =  bannerManageService.selectBanner(bannerManageVO);
		String result = "";
		if(bannerManageVO.getFileUrl().contains("http")){
			result += "<a href=\""+bannerManageVO.getFileUrl()+"\" target=\"_blank\"><img src=\"/cmm/fms/getImage.do?atchFileId="+bannerManageVO.getAtchFileId()+"&amp;fileSn="+bannerManageVO.getFileSn()+"\"  alt=\"배너이미지\"></a>";
		}else {
			result += "<a href=\""+bannerManageVO.getFileUrl()+"\"><img src=\"/cmm/fms/getImage.do?atchFileId="+bannerManageVO.getAtchFileId()+"&amp;fileSn="+bannerManageVO.getFileSn()+"\"  alt=\"배너이미지\"></a>";
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
	 * 배너창관리 메인 테스트 목록을 조회한다.
	 * @param bannerManageVO
	 * @param model
	 * @return "egovframework/com/sys/bwm/listMainBanner"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/bwm/listMainBanner.do")
	public String egovBannerManageMainList(BannerManageVO bannerManageVO, ModelMap model) throws Exception {

		List<BannerManageVO> reusltList = bannerManageService.selectBannerMainList(bannerManageVO);
		model.addAttribute("resultList", reusltList);

		return "sys/bwm/BannerMainList";
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