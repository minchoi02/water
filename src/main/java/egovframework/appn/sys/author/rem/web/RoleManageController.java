package egovframework.appn.sys.author.rem.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.appn.sys.author.arm.service.AuthorManageService;
import egovframework.appn.sys.author.arm.service.AuthorManageVO;
import egovframework.appn.sys.author.rem.service.RoleManage;
import egovframework.appn.sys.author.rem.service.RoleManageService;
import egovframework.appn.sys.author.rem.service.RoleManageVO;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.CmmUseService;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 롤관리에 관한 controller 클래스를 정의한다.
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
public class RoleManageController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "roleManageService")
    private RoleManageService roleManageService;

    @Resource(name = "CmmUseService")
    CmmUseService cmmUseService;

    @Resource(name = "authorManageService")
    private AuthorManageService authorManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Message ID Generation */
    @Resource(name="egovRoleIdGnrService")
    private EgovIdGnrService egovRoleIdGnrService;

    @Autowired
	private DefaultBeanValidator beanValidator;

	/**
	 * 등록된 롤 정보 목록 조회
	 * @param roleManageVO RoleManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/rem/RoleManage.do")
	public String selectRoleList(@ModelAttribute("roleManageVO") RoleManageVO roleManageVO,
			                      ModelMap model) throws Exception {

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(roleManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(roleManageVO.getRecordCountPerPage());
		paginationInfo.setPageSize(roleManageVO.getPageSize());

		roleManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		roleManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		roleManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		roleManageVO.setRoleManageList(roleManageService.selectRoleList(roleManageVO));
        model.addAttribute("roleList", roleManageVO.getRoleManageList());

        int totCnt = roleManageService.selectRoleListTotCnt(roleManageVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "sys/author/rem/RoleManage";
	}

	/**
	 * 등록된 롤 정보 조회
	 * @param roleCode String
	 * @param roleManageVO RoleManageVO
	 * @param authorManageVO AuthorManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/rem/Role.do")
	public String selectRole(@RequestParam("roleCode") String roleCode,
	                         @ModelAttribute("roleManageVO") RoleManageVO roleManageVO,
	                         @ModelAttribute("authorManageVO") AuthorManageVO authorManageVO,
		                      ModelMap model) throws Exception {

    	roleManageVO.setRoleCode(roleCode);

    	authorManageVO.setAuthorManageList(authorManageService.selectAuthorAllList(authorManageVO));

    	model.addAttribute("roleManage", roleManageService.selectRole(roleManageVO));
        model.addAttribute("authorManageList", authorManageVO.getAuthorManageList());
        model.addAttribute("cmmCodeDetailList", getCmmCodeDetailList(new ComDefaultCodeVO(),"COM029"));

        return "sys/author/rem/RoleUpdate";
	}

    /**
	 * 롤 등록화면 이동
	 * @param authorManageVO AuthorManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/sys/author/rem/RoleInsertView.do")
    public String insertRoleView(@ModelAttribute("authorManageVO") AuthorManageVO authorManageVO,
    		                      ModelMap model) throws Exception {

    	authorManageVO.setAuthorManageList(authorManageService.selectAuthorAllList(authorManageVO));
        model.addAttribute("authorManageList", authorManageVO.getAuthorManageList());
        model.addAttribute("cmmCodeDetailList", getCmmCodeDetailList(new ComDefaultCodeVO(),"COM029"));

        return "sys/author/rem/RoleInsert";
    }

	/**
	 * 시스템 메뉴에 따른 접근권한, 데이터 입력, 수정, 삭제의 권한 롤을 등록
	 * @param roleManage RoleManage
	 * @param roleManageVO RoleManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/rem/RoleInsert.do")
	public String insertRole(@ModelAttribute("roleManage") RoleManage roleManage,
			                 @ModelAttribute("roleManageVO") RoleManageVO roleManageVO,
			                  BindingResult bindingResult,
			                  SessionStatus status,
                              ModelMap model) throws Exception {

    	beanValidator.validate(roleManage, bindingResult); //validation 수행

    	if (bindingResult.hasErrors()) {
			return "sys/author/rem/RoleInsert";
		} else {
    	    String roleTyp = "ROLE";

	    	roleManage.setRoleCode(roleTyp.concat("_").concat(egovRoleIdGnrService.getNextStringId()));
	    	roleManageVO.setRoleCode(roleManage.getRoleCode());

	    	status.setComplete();
	        model.addAttribute("cmmCodeDetailList", getCmmCodeDetailList(new ComDefaultCodeVO(),"COM029"));
	    	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
	        model.addAttribute("roleManage", roleManageService.insertRole(roleManage, roleManageVO));

	        return "sys/author/rem/RoleUpdate";
		}
	}

	/**
	 * 시스템 메뉴에 따른 접근권한, 데이터 입력, 수정, 삭제의 권한 롤을 수정
	 * @param roleManage RoleManage
	 * @param bindingResult BindingResult
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/rem/RoleUpdate.do")
	public String updateRole(@ModelAttribute("roleManage") RoleManage roleManage,
			BindingResult bindingResult,
			SessionStatus status,
            ModelMap model) throws Exception {

    	beanValidator.validate(roleManage, bindingResult); //validation 수행
    	if (bindingResult.hasErrors()) {
			return "sys/author/rem/RoleUpdate";
		} else {
    	roleManageService.updateRole(roleManage);
    	status.setComplete();
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
    	return "forward:/sys/author/rem/Role.do";
		}
	}

	/**
	 * 불필요한 롤정보를 화면에 조회하여 데이터베이스에서 삭제
	 * @param roleManage RoleManage
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/rem/RoleDelete.do")
	public String deleteRole(@ModelAttribute("roleManage") RoleManage roleManage,
            SessionStatus status,
            ModelMap model) throws Exception {

    	roleManageService.deleteRole(roleManage);
    	status.setComplete();
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
    	return "forward:/sys/author/rem/RoleManage.do";

	}

	/**
	 * 불필요한 그룹정보 목록을 화면에 조회하여 데이터베이스에서 삭제
	 * @param roleCodes String
	 * @param roleManage RoleManage
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value="/sys/author/rem/RoleListDelete.do")
	public String deleteRoleList(@RequestParam("roleCodes") String roleCodes,
			                     @ModelAttribute("roleManage") RoleManage roleManage,
	                              SessionStatus status,
	                              Model model) throws Exception {
		if(StringUtils.isNotEmpty(roleCodes)) {
			String [] strRoleCodes = roleCodes.split(";");
			for(int i=0; i<strRoleCodes.length;i++) {
				roleManage.setRoleCode(strRoleCodes[i]);
				roleManageService.deleteRole(roleManage);
			}
		}
		status.setComplete();
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/sys/author/rem/RoleManage.do";
	}

    /**
	 * 공통코드 호출
	 * @param comDefaultCodeVO ComDefaultCodeVO
	 * @param codeId String
	 * @return List
	 * @exception Exception
	 */
	public List<?> getCmmCodeDetailList(ComDefaultCodeVO comDefaultCodeVO, String codeId)  throws Exception {
    	comDefaultCodeVO.setCodeId(codeId);
    	return cmmUseService.selectCmmCodeDetail(comDefaultCodeVO);
    }


}