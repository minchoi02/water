package egovframework.appn.sys.cntnts.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.appn.cmm.excel.ExcelView;
import egovframework.appn.sys.cntnts.service.CntntsMstrService;
import egovframework.appn.sys.cntnts.service.CntntsMstrVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CntntsMstrController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "cntntsMstrService")
    private CntntsMstrService cntntsMstrService;

    @Resource(name="egovCntntsIdGnrService")
    private EgovIdGnrService egovCntntsIdGnrService;

	@Resource(name = "excelView")
    private ExcelView excelView;

	@Autowired
	private DefaultBeanValidator beanValidator;

	/**
	 * 엑셀다운로드
	 * @param cntntsMstrVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/cntnts/CntntsMstrManageExcel.do")
	public ModelAndView selectCntntsMstrListExcel(@ModelAttribute("userSearchVO") CntntsMstrVO cntntsMstrVO, ModelMap model) throws Exception{

		ModelAndView mav = new ModelAndView(excelView);
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    cntntsMstrVO.setExcel("Y");
	    List<?> list = cntntsMstrService.selectCntntsMstrList(cntntsMstrVO);
	    String filename = "게시판관리 목록_" + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
	    String[] columnArr = {"게시판ID", "게시판명", "관리자제한여부", "파일첨부여부", "파일첨부갯수", "답글여부", "게시판내용"};
	    String[] columnVarArr = {"cntntsId", "cntntsNm", "adminLimitAt", "fileAtchAt", "fileAtchCnt", "replyAt", "cntntsCn"};

	    dataMap.put("columnArr", columnArr);
	    dataMap.put("columnVarArr", columnVarArr);
	    dataMap.put("sheetNm", "게시판관리 목록");
	    dataMap.put("list", list);

	    mav.addObject("dataMap", dataMap);
	    mav.addObject("filename", filename);

	    return mav;
	}

    /**
     * 목록
     * @param cntntsMstrVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/sys/cntnts/CntntsMstrManage.do")
	public String selectBbsMstrList(@ModelAttribute("searchVO") CntntsMstrVO cntntsMstrVO, ModelMap model) throws Exception {

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(cntntsMstrVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(cntntsMstrVO.getRecordCountPerPage());
		paginationInfo.setPageSize(cntntsMstrVO.getPageSize());

		cntntsMstrVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		cntntsMstrVO.setLastIndex(paginationInfo.getLastRecordIndex());
		cntntsMstrVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("resultList", new ObjectMapper().writeValueAsString(cntntsMstrService.selectCntntsMstrList(cntntsMstrVO)));

        int totCnt = cntntsMstrService.selectCntntsMstrListTotCnt(cntntsMstrVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "sys/cntnts/CntntsMstrManage";
	}

	/**
	 * 등록화면 이동
	 * @param cntntsMstrVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/cntnts/CntntsMstrInsertView.do")
	public String insertBbsMstrView(@ModelAttribute("searchVO") CntntsMstrVO cntntsMstrVO, ModelMap model) throws Exception {




    	model.addAttribute("cntntsMstrVO", cntntsMstrVO);

		return "sys/cntnts/CntntsMstrInsert";
	}

	/**
	 * 등록
	 * @param cntntsMstrVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/cntnts/CntntsMstrInsert.do")
	public String insertCntntsMstr(@ModelAttribute("searchVO") CntntsMstrVO cntntsMstrVO, BindingResult bindingResult, ModelMap model,HttpServletRequest req) throws Exception {

		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		beanValidator.validate(cntntsMstrVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("cntntsMstrVO", cntntsMstrVO);
			return "sys/cntnts/CntntsMstrInsert";
		} else {
			cntntsMstrVO.setCntntsId(egovCntntsIdGnrService.getNextStringId());
			cntntsMstrVO.setFrstRegisterId(loginvo.getUniqId());
			cntntsMstrService.insertCntntsMstr(cntntsMstrVO);
			model.addAttribute("resultMsg", "success.common.insert");
			return "forward:/sys/cntnts/CntntsMstrManage.do";
		}
	}

	/**
	 * 상세
	 * @param cntntsMstrVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/cntnts/CntntsMstrDetailSelect.do")
	public String selectCntntsMstr(@ModelAttribute("searchVO") CntntsMstrVO cntntsMstrVO, ModelMap model) throws Exception {

	   	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(cntntsMstrVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(cntntsMstrVO.getRecordCountPerPage());
		paginationInfo.setPageSize(cntntsMstrVO.getPageSize());

		model.addAttribute("resultList", cntntsMstrService.selectCntntsMstrLogList(cntntsMstrVO));

        int totCnt = cntntsMstrService.selectCntntsMstrLogListTotCnt(cntntsMstrVO);

        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

    	model.addAttribute("cntntsMstrVO",cntntsMstrService.selectCntntsMstr(cntntsMstrVO));
    	return "sys/cntnts/CntntsMstrSelectUpdt";
	}

	/**
	 * 수정
	 * @param cntntsMstrVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/cntnts/CntntsMstrUpdt.do")
	public String updateCntntsMstr(@ModelAttribute("searchVO") CntntsMstrVO cntntsMstrVO, BindingResult bindingResult, ModelMap model,HttpServletRequest req) throws Exception {

		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		beanValidator.validate(cntntsMstrVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("cntntsMstrVO", cntntsMstrVO);
			return "sys/cntnts/CntntsMstrSelectUpdt";
		} else {
			cntntsMstrVO.setLastUpdusrId(loginvo.getUniqId());
			cntntsMstrService.updateCntntsMstr(cntntsMstrVO);
			model.addAttribute("resultMsg", "success.common.update");
			return "forward:/sys/cntnts/CntntsMstrManage.do";
		}
	}
	/**
	 * 수정
	 * @param cntntsMstrVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/cntnts/CntntsMstrRestore.do")
	public String restoreCntntsMstr(@ModelAttribute("searchVO") CntntsMstrVO cntntsMstrVO, BindingResult bindingResult, ModelMap model,HttpServletRequest req) throws Exception {

		Boolean isAdmin = false;
		LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
		isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
		model.addAttribute("isAdmin", isAdmin);
		beanValidator.validate(cntntsMstrVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("cntntsMstrVO", cntntsMstrVO);
			return "sys/cntnts/CntntsMstrSelectUpdt";
		} else {
			cntntsMstrVO.setLastUpdusrId(loginvo.getUniqId());
			cntntsMstrService.restoreCntntsMstr(cntntsMstrVO);
			model.addAttribute("resultMsg", "success.common.update");
			return "forward:/sys/cntnts/CntntsMstrManage.do";
		}
	}

	/**
	 * 삭제(상태값)
	 * @param cntntsMstrVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/cntnts/CntntsMstrDelete.do")
	public String deleteCntntsMstr(@ModelAttribute("searchVO") CntntsMstrVO cntntsMstrVO, ModelMap model) throws Exception {

		cntntsMstrService.deleteCntntsMstr(cntntsMstrVO);
		model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/sys/cntnts/CntntsMstrManage.do";
	}
	/**
	 * 삭제(상태값)
	 * @param cntntsMstrVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/cntnts/CntntsMstrLogDelete.do")
	public String deleteCntntsMstrLog(@ModelAttribute("searchVO") CntntsMstrVO cntntsMstrVO, ModelMap model) throws Exception {

		cntntsMstrService.deleteCntntsMstrLog(cntntsMstrVO);
		model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/sys/cntnts/CntntsMstrManage.do";
	}

	/**
	 * 상세
	 * @param cntntsMstrVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cmm/cntnts/selectCntnts.do")
	public String selectCntnts(@ModelAttribute("searchVO") CntntsMstrVO cntntsMstrVO, ModelMap model,HttpServletResponse response) throws Exception {

    	model.addAttribute("cntntsMstrVO",cntntsMstrService.selectCntntsMstr(cntntsMstrVO));
    	return "cmm/cntnts/selectCntnts";
	}

    /**
     * 비동기식 검색
     * @param cntntsMstrVO
     * @return
     * @throws Exception
     */
	 @RequestMapping(value = "/sys/cntnts/searchCntntsMstrManage.do", produces = "application/json; charset=utf8")
	 public @ResponseBody String searchCntntsMstrManage( @RequestBody CntntsMstrVO cntntsMstrVO) throws Exception {
		 return new ObjectMapper().writeValueAsString(cntntsMstrService.selectCntntsMstrList(cntntsMstrVO));
	 }

    /**
     * 비동기식 검색
     * @param cntntsMstrVO
     * @return
     * @throws Exception
     */
	 @RequestMapping(value = "/sys/cntnts/pageCntntsMstrManage.do", produces = "application/json; charset=utf8")
	 public @ResponseBody String pageCntntsMstrManage( @RequestBody CntntsMstrVO cntntsMstrVO) throws Exception {
		 return new ObjectMapper().writeValueAsString(cntntsMstrService.selectCntntsMstrListTotCnt(cntntsMstrVO));
	 }

    /**
     * 비동기식 검색
     * @param cntntsMstrVO
     * @return
     * @throws Exception
     */
	 @RequestMapping(value = "/sys/cntnts/CntntsMstrManagePage.do", produces = "application/json; charset=utf8")
	 public @ResponseBody String CntntsMstrManagePage( @RequestBody CntntsMstrVO cntntsMstrVO) throws Exception {
		 return new ObjectMapper().writeValueAsString(cntntsMstrService.selectCntntsMstrList(cntntsMstrVO));
	 }
}