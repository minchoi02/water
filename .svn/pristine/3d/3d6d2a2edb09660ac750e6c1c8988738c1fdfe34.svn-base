package egovframework.appn.sys.code.hcm.web;

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
import egovframework.appn.sys.code.hcm.service.CcmCmmnCodeManageService;
import egovframework.appn.sys.code.hcm.service.CmmnCode;
import egovframework.appn.sys.code.hcm.service.CmmnCodeVO;
import egovframework.appn.sys.code.lcm.service.CcmCmmnDetailCodeManageService;
import egovframework.appn.sys.code.lcm.service.CmmnDetailCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 *
 * 공통코드에 관한 요청을 받아 서비스 클래스로 요청을 전달하고 서비스클래스에서 처리한 결과를 웹 화면으로 전달을 위한 Controller를 정의한다
 * @author 공통서비스 개발팀 이중호
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */

@Controller
public class CcmCmmnCodeManageController {

	@Resource(name = "CmmnCodeManageService")
    private CcmCmmnCodeManageService cmmnCodeManageService;

	@Resource(name = "CmmnDetailCodeManageService")
    private CcmCmmnDetailCodeManageService cmmnDetailCodeManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	@Autowired
	private DefaultBeanValidator beanValidator;

	@Resource(name = "excelView")
    private ExcelView excelView;

    /**
     * 엑셀다운로드
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/sys/code/hcm/CcmCmmnCodeListExcel.do")
	public ModelAndView selectCmmnCodeListExcel(@ModelAttribute("searchVO") CmmnCodeVO searchVO, ModelMap model) throws Exception {

    	ModelAndView mav = new ModelAndView(excelView);
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    searchVO.setExcel("Y");
	    List<?> list = cmmnCodeManageService.selectCmmnCodeList(searchVO);
	    String filename = "공통코드관리 목록_" + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
	    String[] columnArr = {"코드ID", "코드ID명", "사용여부"};
	    String[] columnVarArr = {"codeId", "codeIdNm", "useAt"};

	    dataMap.put("columnArr", columnArr);
	    dataMap.put("columnVarArr", columnVarArr);
	    dataMap.put("sheetNm", "공통코드관리 목록");
	    dataMap.put("list", list);

	    mav.addObject("dataMap", dataMap);
	    mav.addObject("filename", filename);

	    return mav;
	}

	/**
	 * 공통코드를 삭제한다.
	 * @param loginVO
	 * @param cmmnCode
	 * @param model
	 * @return "forward:/sym/ccm/cca/EgovCcmCmmnCodeList.do"
	 * @throws Exception
	 */
    @RequestMapping(value="/sys/code/hcm/CcmCmmnCodeRemove.do")
	public String deleteCmmnCode (@ModelAttribute("loginVO") LoginVO loginVO
			, CmmnCode cmmnCode
			, ModelMap model
			) throws Exception {
    	cmmnCodeManageService.deleteCmmnCode(cmmnCode);
        return "forward:/sys/code/hcm/CcmCmmnCodeList.do";
	}

	/**
	 * 공통코드를 등록한다.
	 * @param loginVO
	 * @param cmmnCode
	 * @param bindingResult
	 * @param model
	 * @return "/cmm/sym/ccm/EgovCcmCmmnCodeRegist"
	 * @throws Exception
	 */
    @RequestMapping(value="/sys/code/hcm/CcmCmmnCodeRegist.do")
	public String insertCmmnCode (@ModelAttribute("searchVO") CmmnCodeVO searchVO, @ModelAttribute("cmmnCode") CmmnCode cmmnCode
			, BindingResult bindingResult
			, ModelMap model
			,HttpServletRequest req) throws Exception {
    	Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);

    	if   (cmmnCode.getCodeId() == null || "".equals(cmmnCode.getCodeId())) {
    		return "sys/code/CcmCmmnCodeRegist";
    	}

    	model.addAttribute("searchVO", searchVO);

        beanValidator.validate(cmmnCode, bindingResult);
		if (bindingResult.hasErrors()){
    		searchVO = new CmmnCodeVO();
    		searchVO.setRecordCountPerPage(999999);
    		searchVO.setFirstIndex(0);
    		searchVO.setSearchCondition("CodeList");

            return "sys/code/CcmCmmnCodeRegist";
		}

    	cmmnCode.setFrstRegisterId(loginvo.getUniqId());
    	if(cmmnCodeManageService.selectCmmnCodeDetail(cmmnCode) == null) {
			cmmnCodeManageService.insertCmmnCode(cmmnCode);
		} else {
			model.addAttribute("resultMsg", "fail.code.insert");
		}
        return "forward:/sys/code/hcm/CcmCmmnCodeList.do";
    }

	/**
	 * 공통코드 상세항목을 조회한다.
	 * @param loginVO
	 * @param cmmnCode
	 * @param model
	 * @return "cmm/sym/ccm/EgovCcmCmmnCodeDetail"
	 * @throws Exception
	 */
	@RequestMapping(value="/sys/code/hcm/CcmCmmnCodeDetail.do")
 	public String selectCmmnCodeDetail (@ModelAttribute("searchVO") CmmnCodeVO searchVO, @ModelAttribute("loginVO") LoginVO loginVO
 			, CmmnCode cmmnCode
 			, ModelMap model
 			) throws Exception {
		CmmnCode vo =cmmnCodeManageService.selectCmmnCodeDetail(cmmnCode);
		model.addAttribute("result", vo);
		model.addAttribute("searchVO", searchVO);

		return "sys/code/CcmCmmnCodeDetail";
	}

    /**
	 * 공통코드 목록을 조회한다.
     * @param loginVO
     * @param searchVO
     * @param model
     * @return "/cmm/sym/ccm/EgovCcmCmmnCodeList"
     * @throws Exception
     */
    @RequestMapping(value="/sys/code/hcm/CcmCmmnCodeList.do")
	public String selectCmmnCodeList (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("searchVO") CmmnCodeVO searchVO
			, ModelMap model) throws Exception {

    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());

		PaginationInfo paginationInfo2 = new PaginationInfo();
		paginationInfo2.setCurrentPageNo(searchVO.getPageIndex2());
		paginationInfo2.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo2.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		CmmnDetailCodeVO searchVO2 = new CmmnDetailCodeVO();

		searchVO2.setFirstIndex(paginationInfo2.getFirstRecordIndex());
		searchVO2.setLastIndex(paginationInfo2.getLastRecordIndex());
		searchVO2.setRecordCountPerPage(paginationInfo2.getRecordCountPerPage());

		if(searchVO.getCodeId()!=null) {
			searchVO2.setCodeId(searchVO.getCodeId());
		}

		model.addAttribute("resultList", new ObjectMapper().writeValueAsString(cmmnCodeManageService.selectCmmnCodeList(searchVO)));
        model.addAttribute("resultList2", new ObjectMapper().writeValueAsString(cmmnDetailCodeManageService.selectCmmnDetailCodeList(searchVO2)));

        int totCnt =cmmnCodeManageService.selectCmmnCodeListTotCnt(searchVO);
        int totCnt2 = cmmnDetailCodeManageService.selectCmmnDetailCodeListTotCnt(searchVO2);
		paginationInfo.setTotalRecordCount(totCnt);
		paginationInfo2.setTotalRecordCount(totCnt2);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("paginationInfo2", paginationInfo2);

        return "sys/code/CcmCmmnCodeList";
	}

	/**
	 * 공통코드를 수정한다.
	 * @param loginVO
	 * @param cmmnCode
	 * @param bindingResult
	 * @param commandMap
	 * @param model
	 * @return "/cmm/sym/ccm/EgovCcmCmmnCodeModify"
	 * @throws Exception
	 */
    @RequestMapping(value="/sys/code/hcm/CcmCmmnCodeModify.do")
	public String updateCmmnCode (@ModelAttribute("searchVO") CmmnCodeVO searchVO, @ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("cmmnCode") CmmnCode cmmnCode
			, BindingResult bindingResult
			, @RequestParam Map <String, Object> commandMap
			, ModelMap model
			) throws Exception {
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		model.addAttribute("searchVO", searchVO);
    	if (sCmd.equals("")) {
    		CmmnCode vo =cmmnCodeManageService.selectCmmnCodeDetail(cmmnCode);
    		model.addAttribute("cmmnCode", vo);

    		return "sys/code/CcmCmmnCodeModify";
    	} else if (sCmd.equals("Modify")) {
            beanValidator.validate(cmmnCode, bindingResult);
    		if (bindingResult.hasErrors()){
        		CmmnCode vo =cmmnCodeManageService.selectCmmnCodeDetail(cmmnCode);
        		model.addAttribute("cmmnCode", vo);

        		return "sys/code/CcmCmmnCodeModify";
    		}

    		cmmnCode.setLastUpdusrId(loginVO.getUniqId());
	    	cmmnCodeManageService.updateCmmnCode(cmmnCode);
	        return "forward:/sys/code/hcm/CcmCmmnCodeList.do";
    	} else {
    		return "forward:/sys/code/hcm/CcmCmmnCodeList.do";
    	}
    }
    /**
     * 비동기식 검색
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sys/code/hcm/searchCcmCmmnCodeList.do", produces = "application/json; charset=utf8")
	public @ResponseBody String searchCcmCmmnCodeList( @RequestBody CmmnCodeVO searchVO) throws Exception {

    	searchVO.setPageSize(searchVO.getPageSize());
    	searchVO.setPageIndex(searchVO.getPageIndex());
    	searchVO.setRecordCountPerPage(searchVO.getRecordCountPerPage());

    	return new ObjectMapper().writeValueAsString(cmmnCodeManageService.selectCmmnCodeList(searchVO));
	}

    /**
     * 비동기식 페이지 건 수 수정-1
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sys/code/hcm/pageCcmCmmnCodeList.do", produces = "application/json; charset=utf8")
	public @ResponseBody String pageCcmCmmnCodeList( @RequestBody CmmnCodeVO searchVO) throws Exception {
		return new ObjectMapper().writeValueAsString(cmmnCodeManageService.selectCmmnCodeListTotCnt(searchVO));
	}

    /**
     * 비동기식 페이지 건 수 수정-2
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sys/code/hcm/pageDetailCcmCmmnCodeList.do", produces = "application/json; charset=utf8")
	public @ResponseBody String pageDetailCcmCmmnCodeList( @RequestBody CmmnDetailCodeVO searchVO) throws Exception {
		return new ObjectMapper().writeValueAsString(cmmnDetailCodeManageService.selectCmmnDetailCodeListTotCnt(searchVO));
	}

    /**
     * 비동기식 페이지네이션
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sys/code/hcm/CcmCmmnCodeListPage.do", produces = "application/json; charset=utf8")
    public @ResponseBody String CcmCmmnCodeListPage( @RequestBody CmmnCodeVO searchVO) throws Exception {

    	searchVO.setPageIndex(searchVO.getPageIndex());
    	searchVO.setRecordCountPerPage(searchVO.getRecordCountPerPage());

    	return new ObjectMapper().writeValueAsString(cmmnCodeManageService.selectCmmnCodeList(searchVO));
    }

    /**
     * 비동기식 상세코드 보기
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sys/code/hcm/selectCcmCmmnCodeList.do", produces = "application/json; charset=utf8")
    public @ResponseBody String selectCcmCmmnCodeList( @RequestBody CmmnDetailCodeVO searchVO) throws Exception {
    	searchVO.setCodeId(searchVO.getCodeId());

    	return new ObjectMapper().writeValueAsString(cmmnDetailCodeManageService.selectCmmnDetailCodeList(searchVO));
    }

}