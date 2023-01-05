package egovframework.appn.sys.author.arm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.appn.sys.author.arm.service.AuthorManage;
import egovframework.appn.sys.author.arm.service.AuthorManageService;
import egovframework.appn.sys.author.arm.service.AuthorManageVO;
import egovframework.appn.sys.menu.mcm.service.MenuCreatVO;
import egovframework.appn.sys.menu.mcm.service.MenuCreateManageService;
import egovframework.appn.sys.menu.plm.service.AuthorVO;
import egovframework.appn.sys.menu.plm.service.ProgrmManageService;
import egovframework.appn.sys.user.urm.service.UserDefaultVO;
import egovframework.appn.sys.user.urm.service.UserManageService;
import egovframework.appn.sys.user.urm.service.UserManageVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 권한관리에 관한 controller 클래스를 정의한다.
 * @author 공통서비스 개발팀 이문준
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.11  이문준          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */

@Controller
public class AuthorManageController {

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "authorManageService")
	private AuthorManageService authorManageService;

	@Autowired
	private DefaultBeanValidator beanValidator;

	@Resource(name = "progrmManageService")
	private ProgrmManageService progrmManageService;

	/** userManageService */
	@Resource(name = "userManageService")
	private UserManageService userManageService;

	@Resource(name = "meunCreateManageService")
	private MenuCreateManageService menuCreateManageService;



	/**
	 * 권한 목록을 조회한다
	 * @param authorManageVO AuthorManageVO
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/author/arm/AuthorManage.do")
	public String selectAuthorList(@ModelAttribute("authorManageVO") AuthorManageVO authorManageVO, ModelMap model) throws Exception {

		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(authorManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(authorManageVO.getRecordCountPerPage());
		paginationInfo.setPageSize(authorManageVO.getPageSize());

		authorManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		authorManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		authorManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		authorManageVO.setAuthorManageList(authorManageService.selectAuthorList(authorManageVO));
		model.addAttribute("authorList", authorManageVO.getAuthorManageList());

		int totCnt = authorManageService.selectAuthorListTotCnt(authorManageVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

		return "sys/author/arm/AuthorManage";
	}

	/**
	 * 권한 세부정보를 조회한다.
	 * @param authorCode String
	 * @param authorManageVO AuthorManageVO
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/author/arm/Author.do")
	public String selectAuthor(@RequestParam("authorCode") String authorCode, @ModelAttribute("authorManageVO") AuthorManageVO authorManageVO, ModelMap model) throws Exception {

		authorManageVO.setAuthorCode(authorCode);

		model.addAttribute("authorManage", authorManageService.selectAuthor(authorManageVO));
		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
		return "sys/author/arm/AuthorUpdate";
	}

	/**
	 * 권한 등록화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping("/sys/author/arm/AuthorInsertView.do")
	public String insertAuthorView() throws Exception {
		return "sys/author/arm/AuthorInsert";
	}

	@RequestMapping(value = "/sys/author/arm/AuthorInsert.do")
	public @ResponseBody Map insertAuthor( ModelMap model,HttpServletRequest req,
			 @RequestBody List<AuthorManage> authorManage
			) throws Exception {
		authorManageService.insertAuthor(authorManage);
		Map rs = new HashMap<>();
		rs.put("result", "insertSucsses");
		return rs;
	}

	/**
	 * 권한 세부정보를 삭제한다.
	 * @param authorManage AuthorManage
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/author/arm/AuthorDelete.do")
	public String deleteAuthor(@ModelAttribute("authorManage") AuthorManage authorManage, SessionStatus status, Model model) throws Exception {

		//authorManageService.deleteAuthor(authorManage);
		status.setComplete();
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/sys/author/arm/AuthorManage.do";
	}
	/**
	 * 권한 세부정보를 수정한다.
	 * @param authorManage AuthorManage
	 * @param bindingResult BindingResult
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/author/arm/AuthorUpdate.do")
	public @ResponseBody Map  updateAuthor(ModelMap model,HttpServletRequest req,
			 @RequestBody List<AuthorManage> authorManage) throws Exception {

		authorManageService.updateAuthor(authorManage);
		Map rs = new HashMap<>();
		rs.put("result", "updateSucsses");
		return rs;
	}
	/**
	 * 권한목록을 삭제한다.
	 * @param authorCodes String
	 * @param authorManage AuthorManage
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/author/arm/AuthorListDelete.do")
	public String deleteAuthorList(@RequestParam("authorCodes") String authorCodes, @ModelAttribute("authorManage") AuthorManage authorManage, SessionStatus status, Model model)
			throws Exception {

		if(StringUtils.isNotEmpty(authorCodes)) {
			String[] strAuthorCodes = authorCodes.split(";");
			for (int i = 0; i < strAuthorCodes.length; i++) {
				authorManage.setAuthorCode(strAuthorCodes[i]);
				//authorManageService.deleteAuthor(authorManage);
			}
		}

		status.setComplete();
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/sys/author/arm/AuthorManage.do";
	}

	/**
	 * 권한제한 화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping("/sys/author/arm/accessDenied.do")
	public String accessDenied() throws Exception {
		return "sys/author/accessDenied";
	}

	@RequestMapping(value = "/sys/author/arm/TotAuthorManage.do")
	public String totAuthorManage( ModelMap model,HttpServletRequest req,
			@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO) throws Exception {
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

		AuthorVO authorVO =  new AuthorVO();
		authorVO.setCodeId("COM058");


		model.addAttribute("tree", new ObjectMapper().writeValueAsString(progrmManageService.selectAuthorTreeList(authorVO)));
		model.addAttribute("authorList", new ObjectMapper().writeValueAsString(progrmManageService.selectAuthorList()));
		model.addAttribute("resultList", new ObjectMapper().writeValueAsString(userManageService.selecAuthortUserList(userSearchVO)));

		int totCnt = userManageService.selectUserListTotCnt(userSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sys/author/arm/TotAuthorManage";
	}
	@RequestMapping(value = "/sys/author/arm/UpdateTreeCode.do")
	public @ResponseBody Map updateAuthorTree( ModelMap model,HttpServletRequest req,
			 @RequestBody List<AuthorVO> deptTreeData
			) throws Exception {
		progrmManageService.updateTreeCode(deptTreeData);
		Map rs = new HashMap<>();
		rs.put("result", "insertSucsses");
		return rs;
	}
	@RequestMapping(value = "/sys/author/arm/selectDeptUser.do", produces = "application/json; charset=utf8")
	public @ResponseBody String selectDeptUser( @RequestBody AuthorVO authorVO) throws Exception{
		UserDefaultVO userSearchVO = new UserDefaultVO();
		userSearchVO.setInsttCode(authorVO.getId());
		return new ObjectMapper().writeValueAsString(userManageService.selectUserList(userSearchVO));
	}
	@RequestMapping(value = "/sys/user/urm/searchUserList.do", produces = "application/json; charset=utf8")
	public @ResponseBody String searchUserList( @RequestBody UserDefaultVO userSearchVO) throws Exception {
		userSearchVO.setInsttCode(userSearchVO.getInsttCode());
		return new ObjectMapper().writeValueAsString(userManageService.selectUserList(userSearchVO));
	}
	@RequestMapping(value = "/sys/author/arm/selectAuthorUser.do", produces = "application/json; charset=utf8")
	public @ResponseBody String selectAuthorUser( @RequestBody AuthorVO authorVO) throws Exception{
		UserDefaultVO userSearchVO = new UserDefaultVO();
		userSearchVO.setAuthorCode(authorVO.getId());
		return new ObjectMapper().writeValueAsString(userManageService.selecAuthortUserList(userSearchVO));
	}
	@RequestMapping(value = "/sys/user/urm/searchAuthorUserList.do", produces = "application/json; charset=utf8")
	public @ResponseBody String searchAuthorUserList( @RequestBody UserDefaultVO userSearchVO) throws Exception {
		userSearchVO.setAuthorCode(userSearchVO.getAuthorCode());
		return new ObjectMapper().writeValueAsString(userManageService.selecAuthortUserList(userSearchVO));
	}
	@RequestMapping(value = "/sys/author/arm/TotAuthorInsertView.do")
	public String totAuthorInsertView(@ModelAttribute("menuCreatVO") MenuCreatVO menuCreatVO,ModelMap model,HttpServletRequest req,
			@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO) throws Exception {

		model.addAttribute("list_menulist", new ObjectMapper().writeValueAsString(menuCreateManageService.selectMenuCreatList(menuCreatVO)));
		model.addAttribute("resultVO", menuCreatVO);
		//model.addAttribute("tree", new ObjectMapper().writeValueAsString(progrmManageService.selectTreeCodeList(authorVO)));
		//model.addAttribute("resultList", new ObjectMapper().writeValueAsString(userManageService.selecAuthortUserList(userSearchVO)));

		return "sys/author/arm/TotAuthorInsert";
	}
	@RequestMapping(value = "/sys/author/arm/TotAuthorUpdateView.do")
	public String totAuthorUpdateView(@ModelAttribute("menuCreatVO") MenuCreatVO menuCreatVO,ModelMap model,HttpServletRequest req,
			@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,@ModelAttribute("authorManageVO") AuthorManageVO authorManageVO) throws Exception {



		model.addAttribute("list_menulist", new ObjectMapper().writeValueAsString(menuCreateManageService.selectMenuCreatList(menuCreatVO)));


		model.addAttribute("authorManage", authorManageService.selectAuthor(authorManageVO));

		model.addAttribute("resultVO", menuCreatVO);
		//model.addAttribute("tree", new ObjectMapper().writeValueAsString(progrmManageService.selectTreeCodeList(authorVO)));
		//model.addAttribute("resultList", new ObjectMapper().writeValueAsString(userManageService.selecAuthortUserList(userSearchVO)));

		return "sys/author/arm/TotAuthorUpdate";
	}
	@RequestMapping(value = "/sys/author/arm/TotAuthorDelete.do")
	public String totAuthorDelete(@ModelAttribute("menuCreatVO") MenuCreatVO menuCreatVO,ModelMap model,HttpServletRequest req,
			@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,@ModelAttribute("authorManageVO") AuthorManageVO authorManageVO) throws Exception {

		authorManageService.deleteAuthor(authorManageVO);

		return "forward:/sys/author/arm/TotAuthorManage.do";
	}
	@RequestMapping(value = "/sys/author/arm/UpdateUserAuthor.do")
	public @ResponseBody Map UpdateUserAuthor( ModelMap model,HttpServletRequest req, @RequestBody UserManageVO userManageVO) throws Exception {

		authorManageService.updateUserAuthor2(userManageVO);
		Map rs = new HashMap<>();
		rs.put("result", "updateSucsses");
		return rs;
	}
}
