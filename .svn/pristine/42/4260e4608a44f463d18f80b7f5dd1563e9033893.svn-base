package egovframework.appn.cmm.main.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.appn.cop.bbs.service.BBSManageService;
import egovframework.appn.sys.bwm.service.BannerManageService;
import egovframework.appn.sys.bwm.service.BannerManageVO;
import egovframework.appn.sys.menu.mlm.service.MenuManageService;
import egovframework.appn.sys.menu.plm.service.ProgrmManageService;
import egovframework.appn.sys.pwm.service.PopupManageService;
import egovframework.appn.sys.pwm.service.PopupManageVO;
import egovframework.appn.sys.user.urm.service.UserDefaultVO;
import egovframework.appn.sys.user.urm.service.UserManageService;
import egovframework.appn.sys.user.urm.service.UserManageVO;
import egovframework.appn.utl.sim.service.FileScrty;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.CmmUseService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 템플릿 메인 페이지 컨트롤러 클래스(Sample 소스)
 * @author 실행환경 개발팀 JJY
 * @since 2011.08.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.08.31  JJY            최초 생성
 *   2021.07.20  김대찬           메인업무 목록 표출
 *
 * </pre>
 */
@Controller@SessionAttributes(types = ComDefaultVO.class)
public class MainController {

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "BBSManageService")
    private BBSManageService bbsMngService;

	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private MenuManageService menuManageService;

	@Resource(name = "userManageService")
	private UserManageService userManageService;

	/** cmmUseService */
	@Resource(name = "CmmUseService")
	private CmmUseService cmmUseService;

	/** popupManageService */
	@Resource(name = "popupManageService")
	private PopupManageService popupManageService;
	/** bannerManageService */
	@Resource(name = "bannerManageService")
	private BannerManageService bannerManageService;

	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	@Resource(name = "progrmManageService")
	private ProgrmManageService progrmManageService;


	/**
	 * 메인 페이지에서 각 업무 화면으로 연계하는 기능을 제공한다.
	 *
	 * @param request
	 * @param commandMap
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/forwardPage.do")
	public String forwardPageWithMenuNo(HttpServletRequest request, @RequestParam Map<String, Object> commandMap)
	  throws Exception{
		return "";
	}

	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/main/mainPage.do")
	public String getMgtMainPage(PopupManageVO popupManageVO,BannerManageVO bannerManageVO, HttpServletRequest request, ModelMap model, HttpSession session)
	  throws Exception{

		List<PopupManageVO> popupList = popupManageService.selectPopupMainList(popupManageVO);
		model.addAttribute("popupList", popupList);
		List<BannerManageVO> bannerList = bannerManageService.selectBannerMainList(bannerManageVO);
		model.addAttribute("bannerList", bannerList);
		session.setAttribute("baseMenuNo","");

		return "cmm/main/MainView";
	}
	@RequestMapping(value = "/admin/main/mainPage.do")
	public String getMgtAdminMainPage(PopupManageVO popupManageVO,BannerManageVO bannerManageVO, HttpServletRequest request, ModelMap model, HttpSession session)
			throws Exception{

		List<PopupManageVO> popupList = popupManageService.selectPopupMainList(popupManageVO);
		model.addAttribute("popupList", popupList);
		List<BannerManageVO> bannerList = bannerManageService.selectBannerMainList(bannerManageVO);
		model.addAttribute("bannerList", bannerList);
		session.setAttribute("baseMenuNo","9000000");
		session.setAttribute("activeMenuId","activeMenuId");

		return "redirect:/sys/user/urm/UserManage.do";
	}

    @RequestMapping(value="/sample.do")
    public String sample(@RequestParam("id") String id, ModelMap model) throws Exception {
    	String returnUrl = "";

    	if("1".equals(id)) returnUrl = "sample/sample1";
    	else if("2".equals(id)) returnUrl = "sample/sample2";
    	else returnUrl = "sample/sample3";

    	ComDefaultCodeVO vo = new ComDefaultCodeVO();
    	vo.setCodeId("CCL000000");
    	model.addAttribute("lev1", cmmUseService.selectCmmCodeDetail(vo));

    	List<ComDefaultCodeVO> voList = new ArrayList<ComDefaultCodeVO>();
    	voList.add(new ComDefaultCodeVO("CCL010000"));
    	voList.add(new ComDefaultCodeVO("CCL020000"));
    	voList.add(new ComDefaultCodeVO("CCL030000"));
    	model.addAttribute("lev2", cmmUseService.selectCmmCodeDetailIn(voList));

    	voList.clear();
    	voList.add(new ComDefaultCodeVO("CCL010100"));
    	voList.add(new ComDefaultCodeVO("CCL010200"));
    	voList.add(new ComDefaultCodeVO("CCL010300"));
    	voList.add(new ComDefaultCodeVO("CCL010400"));
    	voList.add(new ComDefaultCodeVO("CCL010500"));
    	voList.add(new ComDefaultCodeVO("CCL010600"));
    	voList.add(new ComDefaultCodeVO("CCL010700"));
    	voList.add(new ComDefaultCodeVO("CCL010800"));
    	voList.add(new ComDefaultCodeVO("CCL010900"));
    	voList.add(new ComDefaultCodeVO("CCL011000"));
    	voList.add(new ComDefaultCodeVO("CCL011100"));
    	voList.add(new ComDefaultCodeVO("CCL011200"));
    	voList.add(new ComDefaultCodeVO("CCL011300"));
    	voList.add(new ComDefaultCodeVO("CCL020100"));
    	voList.add(new ComDefaultCodeVO("CCL020300"));
    	voList.add(new ComDefaultCodeVO("CCL030100"));
    	model.addAttribute("lev3", cmmUseService.selectCmmCodeDetailIn(voList));

    	/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(1);
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		model.addAttribute("paginationInfo", paginationInfo);

    	return returnUrl;
    }
	/**
	 * 사용자정보 수정을 위해 사용자정보를 상세조회한다.
	 * @param uniqId 상세조회대상 사용자아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovUserSelectUpdt
	 * @throws Exception
	 */
	@RequestMapping("/cmm/main/UserUpdtView.do")
	public String updateUserView(@RequestParam(value="reqFlag", required=false) String reqFlag, @RequestParam("selectedId") String uniqId, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model, HttpSession session) throws Exception {


		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//사용자상태코드를 코드정보로부터 조회
		vo.setCodeId("COM001");
		model.addAttribute("emplyrSttusCode_result", cmmUseService.selectCmmCodeDetail(vo));

		//패스워드힌트목록을 코드정보로부터 조회
		vo.setCodeId("COM002");
		model.addAttribute("passwordHint_result", cmmUseService.selectCmmCodeDetail(vo));

		//소속기관코드를 코드정보로부터 조회
		vo.setCodeId("COM003");
		model.addAttribute("insttCode_result", cmmUseService.selectCmmCodeDetail(vo));

     	//전화번호 앞자리 공통코드
     	vo.setCodeId("COM015");
     	model.addAttribute("com015", cmmUseService.selectCmmCodeDetail(vo));

		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("Z_AUTHOR_GROUP_INFO");
		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

		model.addAttribute("authorList", progrmManageService.selectAuthorList());

		UserManageVO userManageVO = new UserManageVO();
		userManageVO = userManageService.selectUser(uniqId);
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("userManageVO", userManageVO);
		model.addAttribute("reqFlag", reqFlag);
		session.setAttribute("baseMenuNo","");

		return "cmm/main/UserUpdt";
	}

	/**
	 * 사용자정보 수정후 메인 화면으로 이동한다.
	 * @param userManageVO 사용자수정정보
	 * @param bindingResult 입력값검증용 bindingResult
	 * @param model 화면모델
	 * @return forward:/uss/umt/user/EgovUserManage.do
	 * @throws Exception
	 */
	@RequestMapping("/cmm/main/UserUpdt.do")
	public String updateUser(@ModelAttribute("userManageVO") UserManageVO userManageVO, BindingResult bindingResult, Model model, HttpServletRequest req) throws Exception {

		String resultMsg;

		if (false) {
			resultMsg = "fail.common.msg";
		} else {
			resultMsg = "success.common.update";
		}

		userManageService.updateUser(userManageVO);

		model.addAttribute("resultMsg", resultMsg);

		return "forward:/cmm/main/UserUpdtView.do?selectedId="+userManageVO.getUniqId();
	}

	/**
	 * 사용자 암호 수정  화면 이동
	 * @param model 화면모델
	 * @param commandMap 파라메터전달용 commandMap
	 * @param userSearchVO 검색조건
	 * @param userManageVO 사용자수정정보(비밀번호)
	 * @return cmm/uss/umt/EgovUserPasswordUpdt
	 * @throws Exception
	 */
	@RequestMapping(value = "/cmm/main/UserPasswordUpdtView.do")
	public String updatePasswordView(@RequestParam(value="reqFlag", required=false) String reqFlag, ModelMap model, @RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
			@ModelAttribute("userManageVO") UserManageVO userManageVO) throws Exception {


		String userTyForPassword = (String) commandMap.get("userTyForPassword");
		userManageVO.setUserTy(userTyForPassword);

		model.addAttribute("userManageVO", userManageVO);
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("reqFlag", reqFlag);
		return "cmm/main/UserPasswordUpdt";
	}

	/**
	 * 업무사용자 암호 수정처리 후 화면 이동
	 * @param model 화면모델
	 * @param commandMap 파라메터전달용 commandMap
	 * @param userSearchVO 검색조 건
	 * @param userManageVO 사용자수정정보(비밀번호)
	 * @return cmm/uss/umt/EgovUserPasswordUpdt
	 * @throws Exception
	 */
	@RequestMapping(value = "/cmm/main/UserPasswordUpdt.do")
	public String updatePassword(ModelMap model, @RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
			@ModelAttribute("userManageVO") UserManageVO userManageVO) throws Exception {


		String oldPassword = (String) commandMap.get("oldPassword");
		String newPassword = (String) commandMap.get("newPassword");
		String newPassword2 = (String) commandMap.get("newPassword2");
		String uniqId = (String) commandMap.get("uniqId");

		boolean isCorrectPassword = false;
		UserManageVO resultVO = new UserManageVO();
		userManageVO.setPassword(newPassword);
		userManageVO.setOldPassword(oldPassword);
		userManageVO.setUniqId(uniqId);

		String resultMsg = "";
		resultVO = userManageService.selectPassword(userManageVO);
		//패스워드 암호화
		String encryptPass = FileScrty.encryptPassword(oldPassword, userManageVO.getEmplyrId());
		if (encryptPass.equals(resultVO.getPassword())) {
			if (newPassword.equals(newPassword2)) {
				isCorrectPassword = true;
			} else {
				isCorrectPassword = false;
				resultMsg = "fail.user.passwordUpdate2";
			}
		} else {
			isCorrectPassword = false;
			resultMsg = "fail.user.passwordUpdate1";
		}

		if (isCorrectPassword) {
			userManageVO.setPassword(FileScrty.encryptPassword(newPassword, userManageVO.getEmplyrId()));
			userManageService.updatePassword(userManageVO);
			model.addAttribute("userManageVO", userManageVO);
			resultMsg = "success.common.update";
		} else {
			model.addAttribute("userManageVO", userManageVO);
		}
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("resultMsg", resultMsg);

		return "cmm/main/UserPasswordUpdt";
	}



}