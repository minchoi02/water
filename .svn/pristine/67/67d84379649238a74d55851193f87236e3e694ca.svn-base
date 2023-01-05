package egovframework.appn.cmm.login.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.appn.cmm.login.service.LoginService;
import egovframework.appn.sys.author.arm.service.AuthorRoleManageService;
import egovframework.appn.sys.author.arm.service.AuthorRoleManageVO;
import egovframework.appn.sys.user.urm.service.UserManageService;
import egovframework.appn.sys.user.urm.service.UserManageVO;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.security.AdminAuthInfoVO;
import egovframework.com.cmm.service.CmmUseService;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class LoginController {

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "loginService")
	private LoginService loginService;

	/** TRACE */
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;

	/** userManageService */
	@Resource(name = "userManageService")
	private UserManageService userManageService;

	/** cmmUseService */
	@Resource(name = "CmmUseService")
	private CmmUseService cmmUseService;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Resource(name = "authorRoleManageService")
	private AuthorRoleManageService authorRoleManageService;

	/**
	 * 로그인 화면으로 들어간다
	 *
	 * @param vo
	 *            - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/cmm/login/LoginUsr.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		// logger.info("auth 정보:{}" , auth.toString());
		// logger.info("auth getAuthorities 정보:{}" , auth.getAuthorities());
		// logger.info("auth getPrincipal 정보:{}" , auth.getPrincipal());

		// 생성된 인증정보에 맞게 화면 이동
		// Collection<? extends GrantedAuthority> auths = auth.getAuthorities();
		// if ( auths.stream().filter(o ->
		// o.getAuthority().equals("ROLE_USER")).findAny().isPresent() )
		// {
		// logger.info("메인화면으로 이동");
		// return "redirect:/cmm/main/mainPage.do";
		// } else {
		// logger.info("로그인화면으로 이동");
		return "cmm/login/LoginUsr";
		// }
	}

	/**
	 * 로그인 화면으로 들어간다
	 *
	 * @param vo
	 *            - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/login/LoginUsr.do")
	public String adminLoginUsrView(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		// logger.info("auth 정보:{}" , auth.toString());
		// logger.info("auth getAuthorities 정보:{}" , auth.getAuthorities());
		// logger.info("auth getPrincipal 정보:{}" , auth.getPrincipal());

		// 생성된 인증정보에 맞게 화면 이동
		// Collection<? extends GrantedAuthority> auths = auth.getAuthorities();
		// if ( auths.stream().filter(o ->
		// o.getAuthority().equals("ROLE_ADMIN")).findAny().isPresent() )
		// {
		// logger.info("메인화면으로 이동");
		// return "redirect:/admin/main/mainPage.do";
		// } else {
		// logger.info("로그인화면으로 이동");
		return "admin/login/LoginUsr";
		// }
	}

	@RequestMapping(value = "/admin/login/loginSuccess.do")
	public String adminLoginSuccess(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request,
			HttpServletResponse response, ModelMap model, HttpSession session) throws Exception {
		// logger.info("인증후 보내는 default-target-url 진입");

		// 세션 확인용
		// logger.info("인증후 생성된 세션 확인");
		Enumeration<?> session_attributes = session.getAttributeNames();
		while (session_attributes.hasMoreElements()) {
			String session_name = session_attributes.nextElement().toString();
			String session_value = session.getAttribute(session_name).toString();
			// logger.info("세션키:{}",session_name);
			// logger.info("세션값:{}",session_value);
		}

		// 인증된 정보
		// logger.info("SecurityContextHolder 에 등록된 정보 확인");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		/*
		 * if ( auth != null) {
		 *
		 * logger.info("Authentication getAuthorities:{}" ,
		 * auth.getAuthorities().toString());
		 * logger.info("Authentication getPrincipal:{}" , auth.getPrincipal());
		 * logger.info("Authentication getName:{}" , auth.getName());
		 * logger.info("Authentication getCredentials:{}" , auth.getCredentials());
		 * logger.info("Authentication getDetails:{}" , auth.getDetails());
		 * logger.info("Authentication isAuthenticated:{}" , auth.isAuthenticated()); }
		 */

		// 인증시 추가한 사용자의 정보를 가져와 봅니다
		AdminAuthInfoVO authVO = (AdminAuthInfoVO) SecurityContextHolder.getContext().getAuthentication().getDetails();

		if (authVO.getAuthorCode().equals("ROLE_USER")) {
			return "redirect:/admin/login/LoginUsr.do?error=user";
		}

		LoginVO resultVO = new LoginVO();

		resultVO.setId(authVO.getId());
		resultVO.setPassword(authVO.getPassword());
		resultVO.setName(authVO.getUsername());
		resultVO.setIhidNum(authVO.getIhidNum());
		resultVO.setEmail(authVO.getEmail());
		resultVO.setPasswordHint(authVO.getPasswordHint());
		resultVO.setPasswordCnsr(authVO.getPasswordCnsr());
		resultVO.setUserSe(authVO.getUserSe());
		resultVO.setDeptId(authVO.getDeptId());
		resultVO.setDeptNm(authVO.getDeptNm());
		resultVO.setUniqId(authVO.getUniqId());
		resultVO.setUrl(authVO.getUrl());
		resultVO.setIp(authVO.getIp());
		resultVO.setDn(authVO.getDn());
		resultVO.setPstinstCode(authVO.getPstinstCode());
		resultVO.setAuthorCode(authVO.getAuthorCode());
		resultVO.setLoginSe(authVO.getLoginSe());
		resultVO.setMoblphonNo(authVO.getMoblphonNo());
		resultVO.setCodeNm(authVO.getCodeNm());

		AuthorRoleManageVO authorRoleManageVO = new AuthorRoleManageVO();
		authorRoleManageVO.setSearchKeyword(resultVO.getAuthorCode());
		authorRoleManageVO.setRecordCountPerPage(99);

		List<AuthorRoleManageVO> rs = null;
		try {
			rs = authorRoleManageService.selectAuthorRoleList(authorRoleManageVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		List roleList = new ArrayList();

		for (int i = 0; i < rs.size(); i++) {

			AuthorRoleManageVO authorRoleManageVO2 = rs.get(i);

			if (authorRoleManageVO2.getRegYn().equals("Y")) {

				String ptn = authorRoleManageVO2.getRolePtn();

				if (ptn != null) {
					System.out.println(authorRoleManageVO2.getMenuType());
					if (authorRoleManageVO2.getMenuType().equals("4")) {

						String bbsId = ptn.substring(ptn.indexOf("bbsId="), ptn.length());

						if (authorRoleManageVO2.getCreatAuthor().equals("1")) {
							roleList.add("/cop/bbs/insertBoardArticle.do?" + bbsId);
						}
						if (authorRoleManageVO2.getReadAuthor().equals("1")) {
							roleList.add("/cop/bbs/selectBoardList.do?" + bbsId);
							roleList.add("/cop/bbs/selectBoardArticle.do?" + bbsId);
						}
						if (authorRoleManageVO2.getUpdtAuthor().equals("1")) {
							roleList.add("/cop/bbs/updateBoardArticle.do?" + bbsId);
							roleList.add("/cop/bbs/forUpdateBoardArticle.do?" + bbsId);
						}
						if (authorRoleManageVO2.getDeleteAuthor().equals("1")) {
							roleList.add("/cop/bbs/deleteBoardArticle.do?" + bbsId);
						}

					} else {
						if (ptn.contains("/cop/bbs/selectBoardList.do")) {
							roleList.add(ptn);
						} else {
							roleList.add(ptn.substring(0, ptn.lastIndexOf("/") + 1) + ".*.do");
						}
					}
				}
			}
		}
		Set<String> set = new HashSet<String>(roleList);

		roleList = new ArrayList<String>(set);

		// 꼭필요한 URL
		roleList.add("/namo/crossuploader/Upload/FileUpload.do");
		roleList.add("/cmm/login/UserInsertStep1.do");
		roleList.add("/cmm/login/IdDplctCnfirm.do");
		roleList.add("/cmm/login/urm/UserInsert.do");
		roleList.add("/cmm/login/UserInsertView.do");
		roleList.add("/cmm/login/IdPwFindView.do");
		roleList.add("/cmm/fms/getImage.do");
		roleList.add("/cmm/main/UserUpdtView.do");
		roleList.add("/cmm/main/UserUpdt.do");
		roleList.add("/cmm/login/IdFindView.do");
		roleList.add("/cmm/login/PwFindView.do");
		roleList.add("/cmm/login/PwFindView2.do");
		roleList.add("/cmm/login/updatePw.do");
		roleList.add("/cmm/login/checkNmPhone.do");
		roleList.add("/cmm/login/checkIdNmPhone.do");
		roleList.add("/WEB-INF/jsp/_tiles/subLayout.jsp");

		session.setAttribute("RoleList", roleList);

		// 2. spring security 연동
		session.setAttribute("LoginVO", resultVO);

		// 일반적인 세션관리를 위해 별도로 등록해 봅니다.
		// index.jsp 에서 등록된 세션을 확인해 봅니다. String sessionEmail =
		// (String)session.getAttribute("loginEmail");
		// session.setAttribute("loginEmail", vo.getAdminEmail() + " 추가태그");

		return "redirect:/admin/main/mainPage.do";
	}

	@RequestMapping(value = "/cmm/login/loginSuccess.do")
	public String userLoginSuccess(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request,
			HttpServletResponse response, ModelMap model, HttpSession session) throws Exception {
		// logger.info("인증후 보내는 default-target-url 진입");

		// 세션 확인용
		// logger.info("인증후 생성된 세션 확인");
		Enumeration<?> session_attributes = session.getAttributeNames();
		while (session_attributes.hasMoreElements()) {
			String session_name = session_attributes.nextElement().toString();
			String session_value = session.getAttribute(session_name).toString();
		}

		// 인증된 정보
		// logger.info("SecurityContextHolder 에 등록된 정보 확인");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		// 인증시 추가한 사용자의 정보를 가져와 봅니다
		AdminAuthInfoVO authVO = (AdminAuthInfoVO) SecurityContextHolder.getContext().getAuthentication().getDetails();

		if (authVO.getAuthorCode().equals("ROLE_ADMIN")) {
			return "redirect:/cmm/login/LoginUsr.do?error=admin";
		}

		LoginVO resultVO = new LoginVO();

		resultVO.setId(authVO.getId());
		resultVO.setPassword(authVO.getPassword());
		resultVO.setName(authVO.getUsername());
		resultVO.setIhidNum(authVO.getIhidNum());
		resultVO.setEmail(authVO.getEmail());
		resultVO.setPasswordHint(authVO.getPasswordHint());
		resultVO.setPasswordCnsr(authVO.getPasswordCnsr());
		resultVO.setUserSe(authVO.getUserSe());
		resultVO.setDeptId(authVO.getDeptId());
		resultVO.setDeptNm(authVO.getDeptNm());
		resultVO.setUniqId(authVO.getUniqId());
		resultVO.setUrl(authVO.getUrl());
		resultVO.setIp(authVO.getIp());
		resultVO.setDn(authVO.getDn());
		resultVO.setPstinstCode(authVO.getPstinstCode());
		resultVO.setAuthorCode(authVO.getAuthorCode());
		resultVO.setLoginSe(authVO.getLoginSe());
		resultVO.setMoblphonNo(authVO.getMoblphonNo());
		resultVO.setCodeNm(authVO.getCodeNm());

		AuthorRoleManageVO authorRoleManageVO = new AuthorRoleManageVO();
		authorRoleManageVO.setSearchKeyword(resultVO.getAuthorCode());
		authorRoleManageVO.setRecordCountPerPage(99);

		List<AuthorRoleManageVO> rs = null;
		try {
			rs = authorRoleManageService.selectAuthorRoleList(authorRoleManageVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		List roleList = new ArrayList();

		for (int i = 0; i < rs.size(); i++) {

			AuthorRoleManageVO authorRoleManageVO2 = rs.get(i);

			if (authorRoleManageVO2.getRegYn().equals("Y")) {

				String ptn = authorRoleManageVO2.getRolePtn();

				if (ptn != null) {
					System.out.println(ptn + ":::" + authorRoleManageVO2.getMenuType());
					if (authorRoleManageVO2.getMenuType().equals("4")) {

						String bbsId = ptn.substring(ptn.indexOf("bbsId="), ptn.length());

						if (authorRoleManageVO2.getCreatAuthor().equals("1")) {
							roleList.add("/cop/bbs/addBoardArticle.do?" + bbsId);
							roleList.add("/cop/bbs/insertBoardArticle.do?" + bbsId);
						}
						if (authorRoleManageVO2.getReadAuthor().equals("1")) {
							roleList.add("/cop/bbs/selectBoardList.do?" + bbsId);
							roleList.add("/cop/bbs/selectBoardArticle.do?" + bbsId);
						}
						if (authorRoleManageVO2.getUpdtAuthor().equals("1")) {
							roleList.add("/cop/bbs/updateBoardArticle.do?" + bbsId);
							roleList.add("/cop/bbs/forUpdateBoardArticle.do?" + bbsId);
						}
						if (authorRoleManageVO2.getDeleteAuthor().equals("1")) {
							roleList.add("/cop/bbs/deleteBoardArticle.do?" + bbsId);
						}

					} else {
						if (ptn.contains("/cop/bbs/selectBoardList.do")) {
							roleList.add(ptn);
						} else {
							roleList.add(ptn.substring(0, ptn.lastIndexOf("/") + 1) + ".*.do");
						}
					}
				}
			}
		}
		Set<String> set = new HashSet<String>(roleList);

		roleList = new ArrayList<String>(set);

		// 꼭필요한 URL
		roleList.add("/namo/crossuploader/Upload/FileUpload.do");
		roleList.add("/cmm/login/UserInsertStep1.do");
		roleList.add("/cmm/login/IdDplctCnfirm.do");
		roleList.add("/cmm/login/urm/UserInsert.do");
		roleList.add("/cmm/login/UserInsertView.do");
		roleList.add("/cmm/login/IdPwFindView.do");
		roleList.add("/cmm/fms/getImage.do");
		roleList.add("/cmm/main/UserUpdtView.do");
		roleList.add("/cmm/main/UserUpdt.do");
		roleList.add("/cmm/login/IdFindView.do");
		roleList.add("/cmm/login/PwFindView.do");
		roleList.add("/cmm/login/PwFindView2.do");
		roleList.add("/cmm/login/updatePw.do");
		roleList.add("/cmm/login/checkNmPhone.do");
		roleList.add("/cmm/login/checkIdNmPhone.do");
		roleList.add("/WEB-INF/jsp/_tiles/subLayout.jsp");

		session.setAttribute("RoleList", roleList);

		// 2. spring security 연동
		session.setAttribute("LoginVO", resultVO);

		// 일반적인 세션관리를 위해 별도로 등록해 봅니다.
		// index.jsp 에서 등록된 세션을 확인해 봅니다. String sessionEmail =
		// (String)session.getAttribute("loginEmail");
		// session.setAttribute("loginEmail", vo.getAdminEmail() + " 추가태그");

		return "redirect:/cmm/main/mainPage.do";
	}

	/**
	 * 로그인 후 메인화면으로 들어간다
	 *
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/cmm/login/actionMain.do")
	public String actionMain(HttpServletResponse response, HttpServletRequest request, ModelMap model)
			throws Exception {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logger.info("auth 정보:{}", auth.toString());
		logger.info("auth getAuthorities 정보:{}", auth.getAuthorities());
		logger.info("auth getPrincipal 정보:{}", auth.getPrincipal());

		// 생성된 인증정보에 맞게 화면 이동
		Collection<? extends GrantedAuthority> auths = auth.getAuthorities();
		if (auths.stream().filter(o -> o.getAuthority().equals("ROLE_ADMIN")).findAny().isPresent()) {
			logger.info("메인화면으로 이동");
			return "forward:/cmm/main/mainPage.do";
		} else {
			logger.info("로그인화면으로 이동");
			return "admin/login/LoginUsr";
		}
		// 2. 메인 페이지 이동

	}

	/**
	 * 로그인 후 메인화면으로 들어간다
	 *
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/login/actionMain.do")
	public String actionAdminMain(HttpServletResponse response, HttpServletRequest request, ModelMap model)
			throws Exception {

		// 1. Spring Security 사용자권한 처리
		Boolean isAdmin = false;
		LoginVO loginvo = (LoginVO) request.getSession().getAttribute("LoginVO");
		isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
		model.addAttribute("isAdmin", isAdmin);
		if (!isAdmin) {
			// model.addAttribute("message",
			// egovMessageSource.getMessage("fail.common.login"));
			return "admin/login/LoginUsr";
		}

		// 2. 메인 페이지 이동
		return "/sys/user/urm/UserManage.do";
	}

	/**
	 * 로그인 후 메인화면으로 들어간다
	 *
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/cmm/login/UserInsertView.do")
	public String userInsertView(HttpServletResponse response, HttpServletRequest request, ModelMap model)
			throws Exception {
		// 소속기관을 코드정보로부터 조회
		// 사용자상태코드를 코드정보로부터 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM003");
		model.addAttribute("pstInstCode_result", cmmUseService.selectCmmCodeDetail(vo));
		// vo.setCodeId("COM002");
		// model.addAttribute("region_result", cmmUseService.selectCmmCodeDetail(vo));
		vo.setCodeId("COM015");
		model.addAttribute("com015", cmmUseService.selectCmmCodeDetail(vo));
		model.addAttribute("userTy", request.getParameter("userTy"));
		return "cmm/login/UserInsertView";
	}

	@RequestMapping(value = "/cmm/login/UserInsertStep1.do")
	public String userInsertStep1(HttpServletResponse response, HttpServletRequest request, ModelMap model)
			throws Exception {

		return "cmm/login/UserInsertStep1";
	}

	@RequestMapping(value = "/cmm/login/IdDplctCnfirm.do")
	public @ResponseBody Map idDplctCnfirm(HttpServletResponse response, HttpServletRequest request, ModelMap model,
			@RequestBody String id) throws Exception {
		int usedCnt = userManageService.checkIdDplct(id);
		Map rs = new HashMap();
		rs.put("usedCnt", usedCnt);

		return rs;
	}

	@RequestMapping(value = "/cmm/login/urm/UserInsert.do")
	public String userInsert(HttpServletResponse response, HttpServletRequest request, ModelMap model,
			@ModelAttribute("userManageVO") UserManageVO userManageVO) throws Exception {
		userManageService.insertUser(userManageVO);
		return "redirect:/cmm/login/LoginUsr.do?error=insertUser";
	}

	/**
	 * 로그아웃한다.
	 *
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cmm/login/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {
		request.getSession().setAttribute("LoginVO", null);

		return "redirect:/egov_security_logout";
	}

	@RequestMapping(value = "/admin/login/actionLogout.do")
	public String actionAdminLogout(HttpServletRequest request, ModelMap model) throws Exception {
		request.getSession().setAttribute("LoginVO", null);

		return "redirect:/egov_security_logout";
	}

	/**
	 * 아이디/패스워드 찾기로 이동한다.
	 *
	 * @param model
	 *            화면모델
	 * @return /cmm/login/IdPwFindView
	 * @throws Exception
	 */
	@RequestMapping(value = "/cmm/login/IdPwFindView.do")
	public String findIdPw(ModelMap model, HttpServletRequest request) throws Exception {

		model.addAttribute("isAction", "N");
		model.addAttribute("pwFind", request.getParameter("pwFind"));

		return "cmm/login/IdPwFind";
	}

	/**
	 * 아이디 찾기로 이동한다.
	 *
	 * @param model
	 *            화면모델
	 * @return /cmm/login/IdFindView
	 * @throws Exception
	 */
	@RequestMapping(value = "/cmm/login/IdFindView.do")
	public String findIdView(ModelMap model, HttpServletRequest request) throws Exception {
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		// 전화번호 앞자리 공통코드
		vo.setCodeId("COM015");
		model.addAttribute("com015", cmmUseService.selectCmmCodeDetail(vo));
		return "cmm/login/IdFind";
	}

	/**
	 * 패스워드 찾기로 이동한다.
	 *
	 * @param model
	 *            화면모델
	 * @return /cmm/login/PwFindView
	 * @throws Exception
	 */
	@RequestMapping(value = "/cmm/login/PwFindView.do")
	public String findPwView(ModelMap model, HttpServletRequest request) throws Exception {
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		// 전화번호 앞자리 공통코드
		vo.setCodeId("COM015");
		model.addAttribute("com015", cmmUseService.selectCmmCodeDetail(vo));
		return "cmm/login/PwFind";
	}

	@RequestMapping(value = "/cmm/login/PwFindView2.do")
	public String findPwView2(ModelMap model, HttpServletRequest request, @ModelAttribute("emplyrId") String emplyrId,
			@ModelAttribute("esntlId") String esntlId) throws Exception {
		model.addAttribute("emplyrId", emplyrId);
		model.addAttribute("esntlId", esntlId);
		return "cmm/login/PwFind2";
	}

	@RequestMapping(value = "/cmm/login/checkNmPhone.do")
	public @ResponseBody Map checkNmPhone(HttpServletResponse response, HttpServletRequest request, ModelMap model,
			@RequestBody String checkNmPhone) throws Exception {

		String[] param = checkNmPhone.split(",");

		UserManageVO userManageVO = new UserManageVO();
		userManageVO.setEmplyrNm(param[0]);
		userManageVO.setMoblphonNo(param[1]);

		String userId = userManageService.selectId(userManageVO);
		Map rs = new HashMap();
		rs.put("userId", userId);

		return rs;
	}

	@RequestMapping(value = "/cmm/login/checkIdNmPhone.do")
	public @ResponseBody Map checkIdNmPhone(HttpServletResponse response, HttpServletRequest request, ModelMap model,
			@RequestBody String checkNmPhone) throws Exception {
		String[] param = checkNmPhone.split(",");

		UserManageVO userManageVO = new UserManageVO();
		userManageVO.setEmplyrId(param[0]);
		userManageVO.setEmplyrNm(param[1]);
		userManageVO.setMoblphonNo(param[2]);

		String userId = userManageService.selectIdByPwFind(userManageVO);
		Map rs = new HashMap();
		rs.put("userId", userId);

		return rs;
	}

	@RequestMapping(value = "/cmm/login/updatePw.do")
	public @ResponseBody Map updatePw(HttpServletResponse response, HttpServletRequest request, ModelMap model,
			@RequestBody String reqParam) throws Exception {

		String[] arrParam = reqParam.split(",");

		UserManageVO userManageVO = new UserManageVO();
		userManageVO.setEmplyrId(arrParam[0]);
		userManageVO.setPassword(arrParam[1]);

		userManageService.updatePassword(userManageVO);
		Map rs = new HashMap();
		rs.put("updatePwSuccess", "updatePwSuccess");

		return rs;
	}

}

class RequestWrapperForSecurity extends HttpServletRequestWrapper {
	private String username = null;
	private String password = null;

	public RequestWrapperForSecurity(HttpServletRequest request, String username, String password) {
		super(request);

		this.username = username;
		this.password = password;
	}

	@Override
	public String getServletPath() {
		return ((HttpServletRequest) super.getRequest()).getContextPath() + "/security_login";
	}

	@Override
	public String getRequestURI() {
		return ((HttpServletRequest) super.getRequest()).getContextPath() + "/security_login";
	}

	@Override
	public String getParameter(String name) {
		if (name.equals("security_username")) {
			return username;
		}

		if (name.equals("security_password")) {
			return password;
		}

		return super.getParameter(name);
	}
}