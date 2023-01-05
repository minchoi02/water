package egovframework.appn.sys.menu.mlm.web;

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
import egovframework.appn.sys.bbs.service.BbsMstrService;
import egovframework.appn.sys.bbs.service.BbsMstrVO;
import egovframework.appn.sys.cntnts.service.CntntsMstrService;
import egovframework.appn.sys.cntnts.service.CntntsMstrVO;
import egovframework.appn.sys.menu.mlm.service.MenuManage;
import egovframework.appn.sys.menu.mlm.service.MenuManageService;
import egovframework.appn.sys.menu.mlm.service.MenuManageVO;
import egovframework.appn.sys.menu.plm.service.ProgrmManageService;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 메뉴목록 관리및 메뉴생성, 사이트맵 생성을 처리하는 비즈니스 구현 클래스
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
 *	 2011.07.01	 서준식	   메뉴정보 삭제시 참조되고 있는 하위 메뉴가 있는지 체크하는 로직 추가
 *	 2011.07.27	 서준식	   deleteMenuManageList() 메서드에서 메뉴 멀티 삭제 버그 수정
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 * </pre>
 */
@Controller
public class MenuManageController {

	/* Validator */
	@Autowired
	private DefaultBeanValidator beanValidator;
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "meunManageService")
	private MenuManageService menuManageService;

	@Resource(name = "progrmManageService")
	private ProgrmManageService progrmManageService;

    @Resource(name = "cntntsMstrService")
    private CntntsMstrService cntntsMstrService;

    @Resource(name = "bbsMstrService")
    private BbsMstrService bbsMstrService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "excelView")
    private ExcelView excelView;

	/**
	 * 엑셀 다운로드
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/menu/mlm/MenuManageExcel.do")
	public ModelAndView selectMenuManageListExcel(@ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model) throws Exception {

    	ModelAndView mav = new ModelAndView(excelView);
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    searchVO.setExcel("Y");
	    List<?> list = menuManageService.selectMenuManageListExcel(searchVO);
	    String filename = "메뉴목록관리 목록_" + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
	    String[] columnArr = {"메뉴번호", "메뉴명", "프로그램파일명", "메뉴설명", "상위메뉴번호"};
	    String[] columnVarArr = {"menuNo", "menuNm", "progrmFileNm", "menuDc", "upperMenuId"};

	    dataMap.put("columnArr", columnArr);
	    dataMap.put("columnVarArr", columnVarArr);
	    dataMap.put("sheetNm", "메뉴목록관리 목록");
	    dataMap.put("list", list);

	    mav.addObject("dataMap", dataMap);
	    mav.addObject("filename", filename);

	    return mav;
	}

	/**
	 * 메뉴목록 리스트조회한다.
	 * @param searchVO ComDefaultVO
	 * @return 출력페이지정보 "sym/mnu/mpm/EgovMenuManage"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/mlm/MenuManage.do")
	public String selectMenuManageList(@ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model,HttpServletRequest req) throws Exception {

		model.addAttribute("list_menulist", new ObjectMapper().writeValueAsString( menuManageService.selectMenuManageList(searchVO)));

		return "sys/menu/mlm/MenuManage";
	}

	/**
	 * 메뉴정보목록을 상세화면 호출 및 상세조회한다.
	 * @param req_menuNo  String
	 * @return 출력페이지정보 "sym/mnu/mpm/EgovMenuDetailSelectUpdt"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/mlm/MenuManageListDetailSelect.do")
	public String selectMenuManage(@RequestParam("selectMenuId") String selectMenuId, @ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model,HttpServletRequest req
) throws Exception {
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		if (loginvo.getAuthorCode() == null) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}

		MenuManageVO resultVO = menuManageService.selectMenuManage(selectMenuId);
		model.addAttribute("menuManageVO", resultVO);
		model.addAttribute("searchVO", searchVO);

		return "sys/menu/mlm/MenuDetailSelectUpdt";
	}

	/**
	 * 메뉴정보를 등록화면으로 이동 및 등록 한다.
	 * @param menuManageVO    MenuManageVO
	 * @param commandMap      Map
	 * @return 출력페이지정보 등록화면 호출시 "sym/mnu/mpm/EgovMenuRegist",
	 *         출력페이지정보 등록처리시 "forward:/sym/mnu/mpm/EgovMenuManage.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/mlm/MenuRegistInsertView.do")
	public String insertMenuManageView(@RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") ComDefaultVO searchVO, @ModelAttribute("menuManageVO") MenuManageVO menuManageVO, BindingResult bindingResult,
			ModelMap model,HttpServletRequest req) throws Exception {
		menuManageVO.setUpperMenuId(Integer.valueOf(req.getParameter("selectMenuId")));
		menuManageVO.setUpperMenuNm(req.getParameter("selectMenuNm"));

		int upperMenuId = Integer.valueOf(req.getParameter("selectMenuId"));
		int maxMenuNum = menuManageService.selectMaxMenuNo(menuManageVO);
		if(upperMenuId==0) {
			maxMenuNum = maxMenuNum+1000000;
		}else if(upperMenuId%1000000==0) {
			maxMenuNum = maxMenuNum+10000;
		}else if(upperMenuId%10000==0) {
			maxMenuNum = maxMenuNum+100;
		}else if(upperMenuId%100==0) {
			maxMenuNum = maxMenuNum+1;
		}
		menuManageVO.setMenuNo(maxMenuNum);

		return "sys/menu/mlm/MenuRegist";
	}
	@RequestMapping(value = "/sys/menu/mlm/MenuRegistInsert.do")
	public String insertMenuManage(@RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") ComDefaultVO searchVO, @ModelAttribute("menuManageVO") MenuManageVO menuManageVO, BindingResult bindingResult,
			ModelMap model,HttpServletRequest req) throws Exception {

		menuManageService.insertMenuManage(menuManageVO);

		return "sys/menu/mlm/MenuRegist";
	}

	/**
	 * 메뉴정보를 수정 한다.
	 * @param menuManageVO  MenuManageVO
	 * @return 출력페이지정보 "forward:/sym/mnu/mpm/EgovMenuManage.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/mlm/MenuDetailSelectUpdt.do")
	public String updateMenuManage(@ModelAttribute("menuManageVO") MenuManageVO menuManageVO, BindingResult bindingResult, ModelMap model,HttpServletRequest req
) throws Exception {
		String sLocationUrl = "redirect:/sys/menu/mlm/MenuManageListDetailSelect.do?selectMenuId="+menuManageVO.getMenuNo();
		String resultMsg = egovMessageSource.getMessage("success.common.update");
		menuManageService.updateMenuManage(menuManageVO);
		model.addAttribute("resultMsg", resultMsg);

		return sLocationUrl;
	}

	/**
	 * 메뉴정보를 삭제 한다.
	 * @param menuManageVO MenuManageVO
	 * @return 출력페이지정보 "forward:/sym/mnu/mpm/EgovMenuManage.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/mlm/MenuManageDelete.do")
	public String deleteMenuManage(@ModelAttribute("menuManageVO") MenuManageVO menuManageVO, ModelMap model,HttpServletRequest req) throws Exception {
		String resultMsg = "";
		menuManageVO.setMenuNo(Integer.valueOf(req.getParameter("selectMenuId")));
		menuManageService.deleteMenuManage(menuManageVO);
		resultMsg = egovMessageSource.getMessage("success.common.delete");
		model.addAttribute("resultMsg", resultMsg);

		return "forward:/sys/menu/mlm/MenuManage.do";
	}
	@RequestMapping(value = "/sys/menu/mlm/updateMenuOrder.do")
	public @ResponseBody Map updateMenuOrder( ModelMap model,HttpServletRequest req,
			 @RequestBody List<MenuManage> menuOrderData
			) throws Exception {
		menuManageService.updateMenuOrder(menuOrderData);
		Map rs = new HashMap<>();
		rs.put("result", "updateSucsses");
		return rs;
	}

	/**
	 * 메뉴목록 멀티 삭제한다.
	 * @param checkedMenuNoForDel  String
	 * @return 출력페이지정보 "forward:/sym/mnu/mpm/EgovMenuManage.do"
	 * @exception Exception
	 */
	@RequestMapping("/sys/menu/mlm/MenuManageListDelete.do")
	public String deleteMenuManageList(@RequestParam("checkedMenuNoForDel") String checkedMenuNoForDel, @ModelAttribute("menuManageVO") MenuManageVO menuManageVO, ModelMap model,HttpServletRequest req
			)throws Exception {
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		if (loginvo.getAuthorCode() == null) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}
		String sLocationUrl = null;
		String resultMsg = "";

		String[] delMenuNo = checkedMenuNoForDel.split(",");
		menuManageVO.setMenuNo(Integer.parseInt(delMenuNo[0]));

		if (menuManageService.selectUpperMenuNoByPk(menuManageVO) != 0) {
			resultMsg = egovMessageSource.getMessage("fail.common.delete.upperMenuExist");
			sLocationUrl = "forward:/sys/menu/mlm/MenuManage.do";
		} else if (delMenuNo == null || (delMenuNo.length == 0)) {
			resultMsg = egovMessageSource.getMessage("fail.common.delete");
			sLocationUrl = "forward:/sys/menu/mlm/MenuManage.do";
		} else {
			menuManageService.deleteMenuManageList(checkedMenuNoForDel);
			resultMsg = egovMessageSource.getMessage("success.common.delete");
			sLocationUrl = "forward:/sys/menu/mlm/MenuManage.do";
		}
		model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
	}
	/**
	 * 콘텐츠명을 조회한다.
	 * @param searchVO ComDefaultVO
	 * @return 출력페이지정보 "sym/prm/EgovFileNmSearch"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/mlm/CntntsListSearch.do")
	public String selectContentsListSearch(@ModelAttribute("searchVO") CntntsMstrVO cntntsMstrVO, ModelMap model,HttpServletRequest req) throws Exception {

		/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(cntntsMstrVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(cntntsMstrVO.getRecordCountPerPage());
		paginationInfo.setPageSize(cntntsMstrVO.getPageSize());

		cntntsMstrVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		cntntsMstrVO.setLastIndex(paginationInfo.getLastRecordIndex());
		cntntsMstrVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> list_cntnts = cntntsMstrService.selectCntntsMstrSearchList(cntntsMstrVO);
		model.addAttribute("list_cntnts", list_cntnts);

		int totCnt = cntntsMstrService.selectCntntsMstrSearchListTotCnt(cntntsMstrVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sys/menu/mlm/CntntsNmSearch.empty";

	}
	/**
	 * 게시판명을 조회한다.
	 * @param searchVO ComDefaultVO
	 * @return 출력페이지정보 "sym/prm/EgovFileNmSearch"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/menu/mlm/BbsListSearch.do")
	public String selectBbsListSearch(@ModelAttribute("searchVO") BbsMstrVO bbsMstrVO, ModelMap model,HttpServletRequest req) throws Exception {

		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(bbsMstrVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(bbsMstrVO.getRecordCountPerPage());
		paginationInfo.setPageSize(bbsMstrVO.getPageSize());

		bbsMstrVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		bbsMstrVO.setLastIndex(paginationInfo.getLastRecordIndex());
		bbsMstrVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> list_bbs = bbsMstrService.selectBbsMstrList(bbsMstrVO);
		model.addAttribute("list_bbs", list_bbs);

		int totCnt = bbsMstrService.selectBbsMstrListTotCnt(bbsMstrVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sys/menu/mlm/BbsNmSearch.empty";

	}
}
