package egovframework.appn.sys.author.arm.web;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.appn.sys.author.arm.service.AuthorRoleManage;
import egovframework.appn.sys.author.arm.service.AuthorRoleManageService;
import egovframework.appn.sys.author.arm.service.AuthorRoleManageVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 권한별 롤관리에 관한 controller 클래스를 정의한다.
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
public class AuthorRoleController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "authorRoleManageService")
    private AuthorRoleManageService authorRoleManageService;

    /**
	 * 권한 롤 관계 화면 이동
	 * @return "/sec/ram/EgovDeptAuthorList"
	 * @exception Exception
	 */
    @RequestMapping("/sys/author/arm/AuthorRoleListView.do")
    public String selectAuthorRoleListView() throws Exception {

        return "sys/author/arm/AuthorRoleManage";
    }

	/**
	 * 권한별 할당된 롤 목록 조회
	 *
	 * @param authorRoleManageVO AuthorRoleManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/arm/AuthorRoleManage.do")
	public String selectAuthorRoleList(@ModelAttribute("authorRoleManageVO") AuthorRoleManageVO authorRoleManageVO,
			                            ModelMap model) throws Exception {

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(authorRoleManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(authorRoleManageVO.getRecordCountPerPage());
		paginationInfo.setPageSize(authorRoleManageVO.getPageSize());

		authorRoleManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		authorRoleManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		authorRoleManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		authorRoleManageVO.setAuthorRoleList(authorRoleManageService.selectAuthorRoleList(authorRoleManageVO));
        model.addAttribute("authorRoleList", authorRoleManageVO.getAuthorRoleList());

        int totCnt = authorRoleManageService.selectAuthorRoleListTotCnt(authorRoleManageVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "sys/author/arm/AuthorRoleManage";
	}

	/**
	 * 권한정보에 롤을 할당하여 데이터베이스에 등록
	 * @param authorCode String
	 * @param roleCodes String
	 * @param regYns String
	 * @param authorRoleManage AuthorRoleManage
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value="/sys/author/arm/AuthorRoleInsert.do")
	public String insertAuthorRole(@RequestParam("authorCode") String authorCode,
			                       @RequestParam("roleCodes") String roleCodes,
			                       @RequestParam("regYns") String regYns,
			                       @ModelAttribute("authorRoleManage") AuthorRoleManage authorRoleManage,
			                         SessionStatus status,
			                         ModelMap model) throws Exception {

		String [] strRoleCodes = null;

		if(StringUtils.isNotEmpty(roleCodes)){
			strRoleCodes = roleCodes.split(";");
		}

		String [] strRegYns = null;

		if(StringUtils.isNotEmpty(regYns)){
			strRegYns = regYns.split(";");
		}

    	authorRoleManage.setRoleCode(authorCode);
    	if(strRoleCodes!=null) {
	    	for(int i=0; i<strRoleCodes.length;i++) {
	    		authorRoleManage.setRoleCode(strRoleCodes[i]);
	    		authorRoleManage.setRegYn(strRegYns[i]);
	    		if(StringUtils.isNotEmpty(strRegYns[i]) && strRegYns[i].equals("Y"))
	    			authorRoleManageService.insertAuthorRole(authorRoleManage);
	    		else
	    			authorRoleManageService.deleteAuthorRole(authorRoleManage);
	    	}
    	}

        status.setComplete();
        model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
		return "forward:/sys/author/arm/AuthorRoleManage.do";
	}
}