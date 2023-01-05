package egovframework.appn.cmm.sample;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.appn.sys.user.urm.service.UserDefaultVO;
import egovframework.appn.sys.user.urm.service.UserManageService;
import egovframework.com.cmm.service.CmmUseService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class sampleController {

	/** userManageService */
	@Resource(name = "userManageService")
	private UserManageService userManageService;

	/** cmmUseService */
	@Resource(name = "CmmUseService")
	private CmmUseService cmmUseService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@RequestMapping(value = "/cmm/sample/basicGrid.do")
	public String basicGrid(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, ModelMap model) throws Exception {
		/** EgovPropertyService */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userSearchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userSearchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(userSearchVO.getPageSize());

		userSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		userSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("resultList", new ObjectMapper().writeValueAsString(userManageService.selectUserList(userSearchVO)));

		int totCnt = userManageService.selectUserListTotCnt(userSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);


		return "cmm/sample/basicGrid";
	}
}
