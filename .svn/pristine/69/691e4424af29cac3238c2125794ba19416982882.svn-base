package egovframework.appn.sys.bbs.web;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.appn.cmm.excel.ExcelView;
import egovframework.appn.sys.bbs.service.BbsMstrService;
import egovframework.appn.sys.bbs.service.BbsMstrVO;
import egovframework.appn.sys.code.hcm.service.CmmnCodeVO;
import egovframework.appn.sys.code.lcm.service.CmmnDetailCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BbsMstrController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "bbsMstrService")
    private BbsMstrService bbsMstrService;

    @Resource(name="egovBBSIdGnrService")
    private EgovIdGnrService egovBBSIdGnrService;

	@Resource(name = "excelView")
    private ExcelView excelView;

	@Autowired
	private DefaultBeanValidator beanValidator;

	/**
	 * 엑셀다운로드
	 * @param bbsMstrVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/bbs/BbsMstrManageExcel.do")
	public ModelAndView selectBbsMstrListExcel(@ModelAttribute("userSearchVO") BbsMstrVO bbsMstrVO, ModelMap model) throws Exception{

		ModelAndView mav = new ModelAndView(excelView);
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    bbsMstrVO.setExcel("Y");
	    List<?> list = bbsMstrService.selectBbsMstrList(bbsMstrVO);
	    String filename = "게시판관리 목록_" + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
	    String[] columnArr = {"게시판ID", "게시판명", "관리자제한여부", "파일첨부여부", "파일첨부갯수", "답글여부", "게시판설명"};
	    String[] columnVarArr = {"bbsId", "bbsNm", "adminLimitAt", "fileAtchAt", "fileAtchCnt", "replyAt", "bbsDc"};

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
     * @param bbsMstrVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/sys/bbs/BbsMstrManage.do")
	public String selectBbsMstrList(@ModelAttribute("searchVO") BbsMstrVO bbsMstrVO, ModelMap model) throws Exception {

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(bbsMstrVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(bbsMstrVO.getRecordCountPerPage());
		paginationInfo.setPageSize(bbsMstrVO.getPageSize());

		bbsMstrVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		bbsMstrVO.setLastIndex(paginationInfo.getLastRecordIndex());
		bbsMstrVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("resultList", new ObjectMapper().writeValueAsString(bbsMstrService.selectBbsMstrList(bbsMstrVO)));

        int totCnt = bbsMstrService.selectBbsMstrListTotCnt(bbsMstrVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "sys/bbs/BbsMstrManage";
	}

	/**
	 * 등록화면 이동
	 * @param bbsMstrVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/bbs/BbsMstrInsertView.do")
	public String insertBbsMstrView(@ModelAttribute("searchVO") BbsMstrVO bbsMstrVO, ModelMap model) throws Exception {

    	model.addAttribute("bbsMstrVO", bbsMstrVO);

		return "sys/bbs/BbsMstrInsert";
	}

	/**
	 * 등록
	 * @param bbsMstrVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/bbs/BbsMstrInsert.do")
	public String insertBbsMstr(@ModelAttribute("searchVO") BbsMstrVO bbsMstrVO, BindingResult bindingResult, ModelMap model,HttpServletRequest req) throws Exception {

		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		beanValidator.validate(bbsMstrVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("bbsMstrVO", bbsMstrVO);
			return "sys/bbs/BbsMstrInsert";
		} else {
			bbsMstrVO.setBbsId(egovBBSIdGnrService.getNextStringId());
			bbsMstrVO.setFrstRegisterId(loginvo.getUniqId());
			bbsMstrService.insertBbsMstr(bbsMstrVO);
			model.addAttribute("resultMsg", "success.common.insert");
			return "forward:/sys/bbs/BbsMstrManage.do";
		}
	}

	/**
	 * 상세
	 * @param bbsMstrVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/bbs/BbsMstrDetailSelect.do")
	public String selectBbsMstr(@ModelAttribute("searchVO") BbsMstrVO bbsMstrVO, ModelMap model) throws Exception {


    	model.addAttribute("bbsMstrVO",bbsMstrService.selectBbsMstr(bbsMstrVO));
    	return "sys/bbs/BbsMstrSelectUpdt";
	}

	/**
	 * 수정
	 * @param bbsMstrVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/bbs/BbsMstrUpdt.do")
	public String updateBbsMstr(@ModelAttribute("searchVO") BbsMstrVO bbsMstrVO, BindingResult bindingResult, ModelMap model,HttpServletRequest req) throws Exception {

		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		beanValidator.validate(bbsMstrVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("bbsMstrVO", bbsMstrVO);
			return "sys/bbs/BbsMstrSelectUpdt";
		} else {
			bbsMstrVO.setLastUpdusrId(loginvo.getUniqId());
			bbsMstrService.updateBbsMstr(bbsMstrVO);
			model.addAttribute("resultMsg", "success.common.update");
			return "forward:/sys/bbs/BbsMstrManage.do";
		}
	}

	/**
	 * 삭제(상태값)
	 * @param bbsMstrVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/bbs/BbsMstrDelete.do")
	public String deleteBbsMstr(@ModelAttribute("searchVO") BbsMstrVO bbsMstrVO, ModelMap model) throws Exception {

		bbsMstrService.deleteBbsMstr(bbsMstrVO);
		model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/sys/bbs/BbsMstrManage.do";
	}

    /**
     * 비동기식 검색
     * @param bbsMstrVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sys/bbs/searchBbsMstrManage.do", produces = "application/json; charset=utf8")
	public @ResponseBody String searchBbsMstrManage( @RequestBody BbsMstrVO bbsMstrVO) throws Exception {

    	return new ObjectMapper().writeValueAsString(bbsMstrService.selectBbsMstrList(bbsMstrVO));
	}

    /**
     * 비동기식 페이지 건 수 수정-1
     * @param bbsMstrVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sys/bbs/pageBbsMstrManage.do", produces = "application/json; charset=utf8")
	public @ResponseBody String pageBbsMstrManage( @RequestBody BbsMstrVO bbsMstrVO) throws Exception {

		return new ObjectMapper().writeValueAsString(bbsMstrService.selectBbsMstrListTotCnt(bbsMstrVO));
	}

    /**
     * 비동기식 페이지네이션
     * @param bbsMstrVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sys/bbs/BbsMstrManagePage.do", produces = "application/json; charset=utf8")
    public @ResponseBody String BbsMstrManagePage( @RequestBody BbsMstrVO bbsMstrVO) throws Exception {

    	return new ObjectMapper().writeValueAsString(bbsMstrService.selectBbsMstrList(bbsMstrVO));
    }
}