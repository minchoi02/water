package egovframework.appn.sys.menu.mcm.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.appn.sys.menu.mcm.service.MenuCreatVO;
import egovframework.appn.sys.menu.mcm.service.MenuCreateManageService;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 메뉴목록 관리및 메뉴생성, 사이트맵 생성을 처리하는 비즈니스 구현 클래스
 *
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 * 	 2011.07.29	 서준식          사이트맵 저장경로 수정
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */

@Controller
public class MenuCreateManageController {

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "meunCreateManageService")
	private MenuCreateManageService menuCreateManageService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@RequestMapping(value = "/sys/menu/mcm/MenuCreatManage.do")
	public String selectMenuCreatManagList(@ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model,HttpServletRequest req) throws Exception {
		String resultMsg = "";
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		if (!isAdmin) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}
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

		if (searchVO.getSearchKeyword() != null && !searchVO.getSearchKeyword().equals("")) {
			int IDcnt = menuCreateManageService.selectUsrByPk(searchVO);
			if (IDcnt == 0) {
				resultMsg = egovMessageSource.getMessage("info.nodata.msg");
			} else {
				/* AuthorCode 검색 */
				MenuCreatVO vo = new MenuCreatVO();
				vo = menuCreateManageService.selectAuthorByUsr(searchVO);
				searchVO.setSearchKeyword(vo.getAuthorCode());
			}
		}

		model.addAttribute("list_menumanage", menuCreateManageService.selectMenuCreatManagList(searchVO));

		int totCnt = menuCreateManageService.selectMenuCreatManagTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("resultMsg", resultMsg);
		return "sys/menu/mcm/MenuCreatManage";
	}

	@RequestMapping(value = "/sys/menu/mcm/MenuCreatSelect.do")
	public String selectMenuCreatList(@ModelAttribute("menuCreatVO") MenuCreatVO menuCreatVO, ModelMap model,HttpServletRequest req) throws Exception {
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		if (!isAdmin) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}
		model.addAttribute("list_menulist", menuCreateManageService.selectMenuCreatList(menuCreatVO));
		model.addAttribute("resultVO", menuCreatVO);

		return "sys/menu/mcm/MenuCreat.empty";
	}

	@RequestMapping("/sys/menu/mcm/MenuCreatInsert.do")
	public String insertMenuCreatList(@RequestParam("checkedAuthorForInsert") String checkedAuthorForInsert, @RequestParam("checkedMenuNoForInsert") String checkedMenuNoForInsert,
			@ModelAttribute("menuCreatVO") MenuCreatVO menuCreatVO, ModelMap model,HttpServletRequest req) throws Exception {
		String resultMsg = "";
		// 0. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) req.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);
		if (!isAdmin) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/login/LoginUsr";
		}
		String[] insertMenuNo = checkedMenuNoForInsert.split(",");
		if (insertMenuNo == null || (insertMenuNo.length == 0)) {
			resultMsg = egovMessageSource.getMessage("fail.common.insert");
		} else {
			menuCreateManageService.insertMenuCreatList(checkedAuthorForInsert, checkedMenuNoForInsert);
			resultMsg = egovMessageSource.getMessage("success.common.insert");
		}
		model.addAttribute("resultMsg", resultMsg);
		return "forward:/sys/menu/mcm/MenuCreatSelect.do";
	}

}
