package egovframework.appn.sys.code.lcm.web;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.appn.cmm.excel.ExcelView;
import egovframework.appn.sys.code.hcm.service.CcmCmmnCodeManageService;
import egovframework.appn.sys.code.hcm.service.CmmnCode;
import egovframework.appn.sys.code.hcm.service.CmmnCodeVO;
import egovframework.appn.sys.code.lcm.service.CcmCmmnDetailCodeManageService;
import egovframework.appn.sys.code.lcm.service.CmmnDetailCodeVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 *
 * 공통상세코드에 관한 요청을 받아 서비스 클래스로 요청을 전달하고 서비스클래스에서 처리한 결과를 웹 화면으로 전달을 위한 Controller를 정의한다
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
public class CcmCmmnDetailCodeManageController {

	@Resource(name = "CmmnDetailCodeManageService")
    private CcmCmmnDetailCodeManageService cmmnDetailCodeManageService;

	@Resource(name = "CmmnCodeManageService")
    private CcmCmmnCodeManageService cmmnCodeManageService;

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
    @RequestMapping(value="/sys/code/lcm/CcmCmmnDetailCodeListExcel.do")
	public ModelAndView selectCmmnDetailCodeListExcel(@ModelAttribute("searchVO") CmmnDetailCodeVO searchVO, ModelMap model) throws Exception {

    	ModelAndView mav = new ModelAndView(excelView);
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    searchVO.setExcel("Y");
	    List<?> list = cmmnDetailCodeManageService.selectCmmnDetailCodeList(searchVO);
	    String filename = "상세코드관리 목록_" + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
	    String[] columnArr = {"코드ID", "코드", "코드명", "사용여부"};
	    String[] columnVarArr = {"codeId", "code", "codeNm", "useAt"};

	    dataMap.put("columnArr", columnArr);
	    dataMap.put("columnVarArr", columnVarArr);
	    dataMap.put("sheetNm", "상세코드관리 목록");
	    dataMap.put("list", list);

	    mav.addObject("dataMap", dataMap);
	    mav.addObject("filename", filename);

	    return mav;
	}

    @RequestMapping(value="/sys/code/lcm/CcmCmmnDetailCodeRemove.do")
	public String deleteCmmnDetailCode (@ModelAttribute("loginVO") LoginVO loginVO
			, CmmnDetailCode cmmnDetailCode
			, ModelMap model
			) throws Exception {
    	cmmnDetailCodeManageService.deleteCmmnDetailCode(cmmnDetailCode);
        return "forward:/sys/code/lcm/CcmCmmnDetailCodeList.do";
	}

	/**
	 * 공통상세코드를 등록한다.
	 * @param loginVO
	 * @param cmmnDetailCode
	 * @param cmmnCode
	 * @param bindingResult
	 * @param model
	 * @return "/cmm/sym/ccm/EgovCcmCmmnDetailCodeRegist"
	 * @throws Exception
	 */
    @RequestMapping(value="/sys/code/lcm/CcmCmmnDetailCodeRegist.do")
	public String insertCmmnDetailCode	(@ModelAttribute("searchVO") ComDefaultVO searchVO, @ModelAttribute("cmmnDetailCode") CmmnDetailCode cmmnDetailCode
			, @ModelAttribute("cmmnCode") CmmnCode cmmnCode
			, BindingResult bindingResult
			, @RequestParam Map <String, Object> commandMap
			, ModelMap model
			, HttpServletRequest req)	throws Exception {
    	Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);

    	model.addAttribute("searchVO", searchVO);

		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
    	if   (cmmnDetailCode.getCodeId() == null
        		||cmmnDetailCode.getCodeId().equals("")
        		||cmmnDetailCode.getCode() == null
        		||cmmnDetailCode.getCode().equals("")
        		||sCmd.equals("")) {

                CmmnCodeVO searchCodeVO;
                searchCodeVO = new CmmnCodeVO();
                searchCodeVO.setRecordCountPerPage(999999);
                searchCodeVO.setFirstIndex(0);

                model.addAttribute("cmmnCodeList", cmmnCodeManageService.selectCmmnCodeList(searchCodeVO));

                return "sys/code/CcmCmmnDetailCodeRegist";
    	} else if (sCmd.equals("Regist")) {

	        beanValidator.validate(cmmnDetailCode, bindingResult);
			if (bindingResult.hasErrors()){
	            CmmnCodeVO searchCodeVO;
	            searchCodeVO = new CmmnCodeVO();
	            searchCodeVO.setRecordCountPerPage(999999);
	            searchCodeVO.setFirstIndex(0);
	            searchCodeVO.setSearchCondition("clCode");

	            model.addAttribute("cmmnCodeList", cmmnCodeManageService.selectCmmnCodeList(searchCodeVO));

	            return "sys/code/CcmCmmnDetailCodeRegist";
			}

	    	cmmnDetailCode.setFrstRegisterId(loginvo.getUniqId());

	    	if(cmmnDetailCodeManageService.selectCmmnDetailCodeDetail(cmmnDetailCode) == null) {
	    		cmmnDetailCodeManageService.insertCmmnDetailCode(cmmnDetailCode);
	    	} else {
	    		model.addAttribute("resultMsg", "fail.code.insert");
	    		return "forward:/sys/code/hcm/CcmCmmnCodeList.do";
	    	}
	    	if("Y".equals(cmmnDetailCode.getCmmncodeRegAt())) {
	    		cmmnCode.setCodeId(cmmnDetailCode.getCode());
	    		cmmnCode.setCodeIdNm(cmmnDetailCode.getCodeNm());
	    		cmmnCode.setCodeIdDc(cmmnDetailCode.getCodeDc());
	    		cmmnCode.setFrstRegisterId(loginvo.getUniqId());
	    		if(cmmnCodeManageService.selectCmmnCodeDetail(cmmnCode) == null) {
	    			cmmnCodeManageService.insertCmmnCode(cmmnCode);
	    		} else {
	    			model.addAttribute("resultMsg", "fail.code.high.insert");
	    		}
	    	}
	        return "forward:/sys/code/hcm/CcmCmmnCodeList.do";
    	}  else {
    		return "forward:/sys/code/hcm/CcmCmmnCodeList.do";
    	}
    }

	/**
	 * 공통상세코드 상세항목을 조회한다.
	 * @param loginVO
	 * @param cmmnDetailCode
	 * @param model
	 * @return "cmm/sym/ccm/EgovCcmCmmnDetailCodeDetail"
	 * @throws Exception
	 */
	@RequestMapping(value="/sys/code/lcm/CcmCmmnDetailCodeDetail.do")
 	public String selectCmmnDetailCodeDetail (@ModelAttribute("searchVO") ComDefaultVO searchVO, @ModelAttribute("loginVO") LoginVO loginVO
 			, CmmnDetailCode cmmnDetailCode
 			,	ModelMap model
 			)	throws Exception {
    	CmmnDetailCode vo = cmmnDetailCodeManageService.selectCmmnDetailCodeDetail(cmmnDetailCode);
		model.addAttribute("result", vo);
		model.addAttribute("searchVO", searchVO);

		return "sys/code/CcmCmmnDetailCodeDetail";
	}

    /**
	 * 공통상세코드 목록을 조회한다.
     * @param loginVO
     * @param searchVO
     * @param model
     * @return "/cmm/sym/ccm/EgovCcmCmmnDetailCodeList"
     * @throws Exception
     */
    @RequestMapping(value="/sys/code/lcm/CcmCmmnDetailCodeList.do")
	public String selectCmmnDetailCodeList (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("searchVO") CmmnDetailCodeVO searchVO
			, ModelMap model
			) throws Exception {
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

        model.addAttribute("resultList", cmmnDetailCodeManageService.selectCmmnDetailCodeList(searchVO));

        int totCnt = cmmnDetailCodeManageService.selectCmmnDetailCodeListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "sys/code/CcmCmmnDetailCodeList";
	}

	/**
	 * 공통상세코드를 수정한다.
	 * @param loginVO
	 * @param cmmnDetailCode
	 * @param bindingResult
	 * @param commandMap
	 * @param model
	 * @return "/cmm/sym/ccm/EgovCcmCmmnDetailCodeModify"
	 * @throws Exception
	 */
    @RequestMapping(value="/sys/code/lcm/CcmCmmnDetailCodeModify.do")
	public String updateCmmnDetailCode (@ModelAttribute("searchVO") ComDefaultVO searchVO, @ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("cmmnDetailCode") CmmnDetailCode cmmnDetailCode
			, BindingResult bindingResult
			, @RequestParam Map <String, Object> commandMap
			, ModelMap model
			) throws Exception {
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		model.addAttribute("searchVO", searchVO);
    	if (sCmd.equals("")) {
    		CmmnDetailCode vo = cmmnDetailCodeManageService.selectCmmnDetailCodeDetail(cmmnDetailCode);
    		model.addAttribute("cmmnDetailCode", vo);

    		return "sys/code/CcmCmmnDetailCodeModify";
    	} else if (sCmd.equals("Modify")) {
            beanValidator.validate(cmmnDetailCode, bindingResult);
    		if (bindingResult.hasErrors()){
        		CmmnDetailCode vo = cmmnDetailCodeManageService.selectCmmnDetailCodeDetail(cmmnDetailCode);
        		model.addAttribute("cmmnDetailCode", vo);

        		return "sys/code/CcmCmmnDetailCodeModify";
    		}

    		cmmnDetailCode.setLastUpdusrId(loginVO.getUniqId());
	    	cmmnDetailCodeManageService.updateCmmnDetailCode(cmmnDetailCode);
	        return "forward:/sys/code/hcm/CcmCmmnCodeList.do";
    	} else {
    		return "forward:/sys/code/hcm/CcmCmmnCodeList.do";
    	}
    }

}