package egovframework.appn.sys.menu.plm.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.appn.cmm.excel.ExcelView;
import egovframework.appn.sys.author.arm.service.AuthorManageService;
import egovframework.appn.sys.author.arm.service.AuthorManageVO;
import egovframework.appn.sys.menu.mcm.service.MenuCreatVO;
import egovframework.appn.sys.menu.mcm.service.MenuCreateManageService;
import egovframework.appn.sys.menu.plm.service.AuthorVO;
import egovframework.appn.sys.menu.plm.service.ProgrmManageService;
import egovframework.appn.sys.menu.plm.service.ProgrmManageVO;
import egovframework.appn.sys.user.urm.service.UserDefaultVO;
import egovframework.appn.sys.user.urm.service.UserManageService;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmUseService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 프로그램목록 관리및 변경을 처리하는 비즈니스 구현 클래스
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */

@Controller
public class ProgrmManageController {

	/** Validator */
	@Autowired
	private DefaultBeanValidator beanValidator;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "progrmManageService")
	private ProgrmManageService progrmManageService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "excelView")
    private ExcelView excelView;

	/** userManageService */
	@Resource(name = "userManageService")
	private UserManageService userManageService;

	@Resource(name = "authorManageService")
	private AuthorManageService authorManageService;

	/** cmmUseService */
	@Resource(name = "CmmUseService")
	private CmmUseService cmmUseService;

	@Resource(name = "meunCreateManageService")
	private MenuCreateManageService menuCreateManageService;


    /**
     * 엑셀다운로드
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/sys/menu/plm/ProgramListManageExcel.do")
	public ModelAndView selectProgrmListExcel(@ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model) throws Exception {

    	ModelAndView mav = new ModelAndView(excelView);
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    searchVO.setExcel("Y");
	    List<?> list = progrmManageService.selectProgrmList(searchVO);
	    String filename = "프로그램관리 목록_" + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
	    String[] columnArr = {"프로그램파일명", "프로그램한글명", "URL", "프로그램설명"};
	    String[] columnVarArr = {"progrmFileNm", "progrmKoreanNm", "url", "progrmDc"};

	    dataMap.put("columnArr", columnArr);
	    dataMap.put("columnVarArr", columnVarArr);
	    dataMap.put("sheetNm", "프로그램관리 목록");
	    dataMap.put("list", list);

	    mav.addObject("dataMap", dataMap);
	    mav.addObject("filename", filename);

	    return mav;
	}

	/**
	 * 프로그램목록 리스트조회한다.
	 * @param searchVO ComDefaultVO
	 * @return 출력페이지정보 "sym/prm/EgovProgramListManage"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/plm/ProgramListManage.do")
	public String selectProgrmList(@ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model) throws Exception {

		// 내역 조회
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("list_progrmmanage", progrmManageService.selectProgrmList(searchVO));
		model.addAttribute("searchVO", searchVO);

		int totCnt = progrmManageService.selectProgrmListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sys/menu/plm/ProgramListManage";
	}

	/**
	 * 프로그램목록을 수정 한다.
	 * @param progrmManageVO ProgrmManageVO
	 * @return 출력페이지정보 "forward:/sym/prm/EgovProgramListManage.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/plm/ProgramListDetailSelectUpdt.do")
	public String updateProgrmList(@ModelAttribute("progrmManageVO") ProgrmManageVO progrmManageVO, BindingResult bindingResult, ModelMap model,HttpServletRequest req) throws Exception {
		String resultMsg = "";
		String sLocationUrl = null;
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);

		if (loginvo.getAuthorCode()==null) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}

		beanValidator.validate(progrmManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			sLocationUrl = "forward:/sys/menu/plm/ProgramListDetailSelect.do";
			return sLocationUrl;
		}
		if (progrmManageVO.getProgrmDc() == null || progrmManageVO.getProgrmDc().equals("")) {
			progrmManageVO.setProgrmDc(" ");
		}
		progrmManageService.updateProgrm(progrmManageVO);
		resultMsg = egovMessageSource.getMessage("success.common.update");
		sLocationUrl = "forward:/sys/menu/plm/ProgramListManage.do";
		model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
	}

	/**
	 * 프로그램목록을 상세화면 호출 및 상세조회한다.
	 * @param tmp_progrmNm  String
	 * @return 출력페이지정보 "sym/prm/EgovProgramListDetailSelectUpdt"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/plm/ProgramListDetailSelect.do")
	public String selectProgrm(@RequestParam("tmp_progrmNm") String tmp_progrmNm, @ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model,HttpServletRequest req) throws Exception {
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		if (loginvo.getAuthorCode()==null) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}
		ProgrmManageVO progrmManageVO = progrmManageService.selectProgrm(tmp_progrmNm);
		model.addAttribute("progrmManageVO", progrmManageVO);
		model.addAttribute("searchVO", searchVO);
		return "sys/menu/plm/ProgramListDetailSelectUpdt";
	}

	/**
	 * 프로그램목록을 등록화면으로 이동 및 등록 한다.
	 * @param progrmManageVO ProgrmManageVO
	 * @param commandMap     Map
	 * @return 출력페이지정보 등록화면 호출시 "sym/prm/EgovProgramListRegist",
	 *         출력페이지정보 등록처리시 "forward:/sym/prm/EgovProgramListManage.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/plm/ProgramListRegist.do")
	public String insertProgrmList(@RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") ComDefaultVO searchVO, @ModelAttribute("progrmManageVO") ProgrmManageVO progrmManageVO, BindingResult bindingResult,
			ModelMap model,HttpServletRequest req) throws Exception {
		String resultMsg = "";
		String sLocationUrl = null;
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
		String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");
		if (sCmd.equals("insert")) {
			beanValidator.validate(progrmManageVO, bindingResult);
			if (bindingResult.hasErrors()) {
				sLocationUrl = "sym/prm/EgovProgramListRegist";
				return sLocationUrl;
			}
			if (progrmManageVO.getProgrmDc() == null || progrmManageVO.getProgrmDc().equals("")) {
				progrmManageVO.setProgrmDc(" ");
			}
			progrmManageService.insertProgrm(progrmManageVO);
			resultMsg = egovMessageSource.getMessage("success.common.insert");
			sLocationUrl = "forward:/sys/menu/plm/ProgramListManage.do";
		} else {
			sLocationUrl = "sys/menu/plm/ProgramListRegist";
		}
		model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
	}

	/**
	 * 프로그램목록을 삭제 한다.
	 * @param progrmManageVO ProgrmManageVO
	 * @return 출력페이지정보 "forward:/sym/prm/EgovProgramListManage.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/plm/ProgramListManageDelete.do")
	public String deleteProgrmList(@ModelAttribute("progrmManageVO") ProgrmManageVO progrmManageVO, ModelMap model,HttpServletRequest req) throws Exception {
		String resultMsg = "";
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		if (loginvo.getAuthorCode()==null) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}
		progrmManageService.deleteProgrm(progrmManageVO);
		resultMsg = egovMessageSource.getMessage("success.common.delete");
		model.addAttribute("resultMsg", resultMsg);
		return "forward:/sys/menu/plm/ProgramListManage.do";
	}

	/**
	 * 프로그램목록 멀티 삭제한다.
	 * @param checkedProgrmFileNmForDel String
	 * @return 출력페이지정보 "forward:/sym/prm/EgovProgramListManage.do"
	 * @exception Exception
	 */
	@RequestMapping("/sys/menu/plm/ProgrmManageListDelete.do")
	public String deleteProgrmManageList(@RequestParam("checkedProgrmFileNmForDel") String checkedProgrmFileNmForDel,
			@ModelAttribute("progrmManageVO") ProgrmManageVO progrmManageVO, ModelMap model,HttpServletRequest req) throws Exception {
		String sLocationUrl = null;
		String resultMsg = "";
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		if (loginvo.getAuthorCode()==null) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}
		String[] delProgrmFileNm = checkedProgrmFileNmForDel.split(",");
		if (delProgrmFileNm == null || (delProgrmFileNm.length == 0)) {
			resultMsg = egovMessageSource.getMessage("fail.common.delete");
			sLocationUrl = "forward:/sys/menu/plm/ProgramListManage.do";
		} else {
			progrmManageService.deleteProgrmManageList(checkedProgrmFileNmForDel);
			resultMsg = egovMessageSource.getMessage("success.common.delete");
			sLocationUrl = "forward:/sys/menu/plm/ProgramListManage.do";
		}
		model.addAttribute("resultMsg", resultMsg);
		//status.setComplete();
		return sLocationUrl;
	}

	/**
	 * 프로그램파일명을 조회한다.
	 * @param searchVO ComDefaultVO
	 * @return 출력페이지정보 "sym/prm/EgovFileNmSearch"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/plm/ProgramListSearch.do")
	public String selectProgrmListSearch(@ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model,HttpServletRequest req) throws Exception {
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		if (loginvo.getAuthorCode()==null) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}
		// 내역 조회
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> list_progrmmanage = progrmManageService.selectProgrmList(searchVO);
		model.addAttribute("list_progrmmanage", list_progrmmanage);

		int totCnt = progrmManageService.selectProgrmListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sys/menu/plm/FileNmSearch.empty";

	}


}