package egovframework.appn.sys.link.llm.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.appn.cmm.excel.ExcelView;
import egovframework.appn.sys.cntnts.service.CntntsMstrVO;
import egovframework.appn.sys.link.llm.service.LinkListManageService;
import egovframework.appn.sys.link.llm.service.LinkVO;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.service.CmmUseService;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class LinkListManageController {

	/** LinkListManageService */
	@Resource(name="linkService")
	private LinkListManageService linkService;

	/** cmmUseService */
	@Resource(name = "CmmUseService")
	private CmmUseService cmmUseService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	@Resource(name = "excelView")
    private ExcelView excelView;

	 /** Message ID Generation */
    @Resource(name ="egovLinkListIdGnrService")
    private EgovIdGnrService egovLinkListIdGnrService;

    /**
     * 엑셀다운로드
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/sys/link/llm/LinkListManageExcel.do")
	public ModelAndView selectListLinkExcel(@ModelAttribute("searchVO") LinkVO searchVO, ModelMap model) throws Exception {

    	ModelAndView mav = new ModelAndView(excelView);
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    searchVO.setExcel("Y");
	    List<?> list = linkService.selectLink(searchVO);
	    String filename = "연계코드관리 목록_" + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
	    String[] columnArr = {"연계정보명", "기관명", "연계유형", "연계주기", "연계형식", "담당자", "연락처"};
	    String[] columnVarArr = {"lnkNm", "insttNm", "lnkTy", "lnkCycle", "lnkFom", "chargerNm", "chargerTelno"};

	    dataMap.put("columnArr", columnArr);
	    dataMap.put("columnVarArr", columnVarArr);
	    dataMap.put("sheetNm", "연계코드관리 목록");
	    dataMap.put("list", list);

	    mav.addObject("dataMap", dataMap);
	    mav.addObject("filename", filename);

	    return mav;
	}

	/**
	 * 연계관리 목록을 보여준다.
	 * @param linkVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sys/link/llm/LinkListManage.do")
	public String selectListLink (@ModelAttribute("searchVO")LinkVO linkVO,ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		linkVO.setPageUnit(propertiesService.getInt("pageUnit"));
		linkVO.setPageSize(propertiesService.getInt("pageSize"));


		/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(linkVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(linkVO.getRecordCountPerPage());
		paginationInfo.setPageSize(linkVO.getPageSize());

		linkVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		linkVO.setLastIndex(paginationInfo.getLastRecordIndex());
		linkVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("resultList", new ObjectMapper().writeValueAsString(linkService.selectLink(linkVO)));


		int totCnt = linkService.selectLinkListTotCnt(linkVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("linkVO",linkVO);
		return "sys/link/llm/LinkList";
	}



	/**
	 * 연계관리 등록 화면으로 이동한다.
	 * @param linkVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sys/link/llm/addListManage.do")
	public String addListLink (@ModelAttribute("linkVo") LinkVO linkVO, ModelMap model) throws Exception {

		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		//연계유형으로부터 조회
		vo.setCodeId("COM012");
		model.addAttribute("lnkTyCode_result", cmmUseService.selectCmmCodeDetail(vo));

		//연계형식으로부터 조회
		vo.setCodeId("COM013");
		model.addAttribute("lnkFomCode_result", cmmUseService.selectCmmCodeDetail(vo));

		model.addAttribute("linkVO", linkVO);

		return "sys/link/llm/ListLinkInsert";
	}

	/**
	 * 연계관리 등록한다.
	 * @param linkVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sys/link/llm/insertLinkListManage.do")
	//등록 과정
	public String insertListLink(@ModelAttribute("searchVO") LinkVO linkVO, ModelMap model) throws Exception{
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		//연계유형으로부터 조회
		vo.setCodeId("COM012");
		model.addAttribute("lnkTyCode_result", cmmUseService.selectCmmCodeDetail(vo));

		//연계형식으로부터 조회
		vo.setCodeId("COM013");
		model.addAttribute("lnkFomCode_result", cmmUseService.selectCmmCodeDetail(vo));

		String lnkId=egovLinkListIdGnrService.getNextStringId();
		linkVO.setLnkId(lnkId);
		linkService.insertLinkManage(linkVO);

		return "forward:/sys/link/llm/LinkListManage.do";
	}

	/**
	 * 연계관리 상세 정보를 조회한다.
	 * @param linkVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sys/link/llm/selectLinkListDetail.do")
	//등록 과정
	public String selectList(@RequestParam("req_lnkId") String req_lnkId, @ModelAttribute("searchVO") LinkVO linkVO, ModelMap model) throws Exception{

		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		//연계유형으로부터 조회5
		vo.setCodeId("COM012");
		model.addAttribute("lnkTyCode_result", cmmUseService.selectCmmCodeDetail(vo));

		//연계형식으로부터 조회
		vo.setCodeId("COM013");
		model.addAttribute("lnkFomCode_result", cmmUseService.selectCmmCodeDetail(vo));

		linkVO.setLnkId(req_lnkId);
		model.addAttribute("searchVO",linkService.selectLinkListDetail(linkVO));
		model.addAttribute("linkVO", linkVO);

		return "sys/link/llm/LinkListDetail";
	}


	/**
	 * 연계관리 상세 정보를 수정한다.
	 * @param linkVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sys/link/llm/updateLinkList.do")
	//등록 과정
	public String updateList(@ModelAttribute("searchVO") LinkVO linkVO, ModelMap model) throws Exception{

		linkService.updateLinkList(linkVO);

		return "forward:/sys/link/llm/LinkListManage.do";
	}
	/**
	 * 연계관리정보 조회 후  삭제
	 * @param LinkVO 검색조건
	 * @param model 화면모델
	 * @return forward:/uss/umt/user/EgovUserManage.do
	 * @throws Exception
	 */
	@RequestMapping("/sys/link/llm/deleteLinkList.do")
	public String deleteUser(@ModelAttribute("searchVO") LinkVO linkVO, Model model) throws Exception {

		linkService.deleteLinkList(linkVO);
		return "forward:/sys/link/llm/LinkListManage.do";
	}

    /**
     * 비동기식 검색
     * @param linkVO
     * @return
     * @throws Exception
     */
	 @RequestMapping(value = "/sys/link/llm/searchLinkList.do", produces = "application/json; charset=utf8")
	 public @ResponseBody String searchLinkList( @RequestBody LinkVO linkVO) throws Exception {
		 return new ObjectMapper().writeValueAsString(linkService.selectLink(linkVO));
	 }

    /**
     * 비동기식 페이지 건 수 수정
     * @param linkVO
     * @return
     * @throws Exception
     */
	 @RequestMapping(value = "/sys/link/llm/pageLinkList.do", produces = "application/json; charset=utf8")
	 public @ResponseBody String pageLinkList( @RequestBody LinkVO linkVO) throws Exception {
		 return new ObjectMapper().writeValueAsString(linkService.selectLinkListTotCnt(linkVO));
	 }

    /**
     * 비동기식 페이지네이션
     * @param linkVO
     * @return
     * @throws Exception
     */
	 @RequestMapping(value = "/sys/link/llm/LinkListPage.do", produces = "application/json; charset=utf8")
	 public @ResponseBody String LinkListPage( @RequestBody LinkVO linkVO) throws Exception {
		 return new ObjectMapper().writeValueAsString(linkService.selectLink(linkVO));
	 }
}
