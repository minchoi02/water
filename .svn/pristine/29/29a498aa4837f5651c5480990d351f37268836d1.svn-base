package egovframework.appn.sys.author.uam.web;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.appn.sys.author.arm.service.AuthorManageService;
import egovframework.appn.sys.author.arm.service.AuthorManageVO;
import egovframework.appn.sys.author.uam.service.AuthorGroup;
import egovframework.appn.sys.author.uam.service.AuthorGroupService;
import egovframework.appn.sys.author.uam.service.AuthorGroupVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 권한그룹에 관한 controller 클래스를 정의한다.
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
public class AuthorGroupController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "authorGroupService")
    private AuthorGroupService authorGroupService;

    @Resource(name = "authorManageService")
    private AuthorManageService authorManageService;

    /**
	 * 권한 목록화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/sys/author/uam/AuthorGroupListView.do")
    public String selectAuthorGroupListView() throws Exception {

        return "sys/author/uam/AuthorGroupManage";
    }

	/**
	 * 그룹별 할당된 권한 목록 조회
	 * @param authorGroupVO AuthorGroupVO
	 * @param authorManageVO AuthorManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/uam/AuthorGroupManage.do")
	public String selectAuthorGroupList(@ModelAttribute("authorGroupVO") AuthorGroupVO authorGroupVO,
			                            @ModelAttribute("authorManageVO") AuthorManageVO authorManageVO,
			                             ModelMap model) throws Exception {

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(authorGroupVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(authorGroupVO.getRecordCountPerPage());
		paginationInfo.setPageSize(authorGroupVO.getPageSize());

		authorGroupVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		authorGroupVO.setLastIndex(paginationInfo.getLastRecordIndex());
		authorGroupVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		authorGroupVO.setAuthorGroupList(authorGroupService.selectAuthorGroupList(authorGroupVO));
        model.addAttribute("authorGroupList", authorGroupVO.getAuthorGroupList());

        int totCnt = authorGroupService.selectAuthorGroupListTotCnt(authorGroupVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

    	authorManageVO.setAuthorManageList(authorManageService.selectAuthorAllList(authorManageVO));
        model.addAttribute("authorManageList", authorManageVO.getAuthorManageList());

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "sys/author/uam/AuthorGroupManage";
	}

	/**
	 * 그룹에 권한정보를 할당하여 데이터베이스에 등록
	 * @param userIds String
	 * @param authorCodes String
	 * @param regYns String
	 * @param authorGroup AuthorGroup
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value="/sys/author/uam/AuthorGroupInsert.do")
	public String insertAuthorGroup(@RequestParam("userIds") String userIds,
			                        @RequestParam("authorCodes") String authorCodes,
			                        @RequestParam("regYns") String regYns,
			                        // @RequestParam("mberTyCodes") String mberTyCode,
			                        @ModelAttribute("authorGroup") AuthorGroup authorGroup,
			                         SessionStatus status,
			                         ModelMap model) throws Exception {

		String [] strUserIds = null;
		if(StringUtils.isNotEmpty(userIds)) {
			strUserIds = userIds.split(";");
		}

		String [] strAuthorCodes = null;
		if(StringUtils.isNotEmpty(authorCodes)) {
			strAuthorCodes = authorCodes.split(";");
		}

		String [] strRegYns = null;
		if(StringUtils.isNotEmpty(regYns)) {
			strRegYns = regYns.split(";");
		}

    	// String [] strMberTyCode = mberTyCode.split(";");
		if(strUserIds!=null) {
	    	for(int i=0; i<strUserIds.length;i++) {
	    		authorGroup.setUniqId(strUserIds[i]);
	    		authorGroup.setAuthorCode(strAuthorCodes[i]);
	    		authorGroup.setMberTyCode("");
	    		if(StringUtils.isNotEmpty(strRegYns[i]) && strRegYns[i].equals("N"))
	    		    authorGroupService.insertAuthorGroup(authorGroup);
	    		else
	    		    authorGroupService.updateAuthorGroup(authorGroup);
	    	}
		}

        status.setComplete();
        model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
		return "forward:/sys/author/uam/AuthorGroupManage.do";
	}

	/**
	 * 그룹별 할당된 시스템 메뉴 접근권한을 삭제
	 * @param userIds String
	 * @param authorGroup AuthorGroup
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value="/sys/author/uam/AuthorGroupDelete.do")
	public String deleteAuthorGroup(@RequestParam("userIds") String userIds,
                                    @ModelAttribute("authorGroup") AuthorGroup authorGroup,
                                     SessionStatus status,
                                     ModelMap model) throws Exception {

		if(StringUtils.isNotEmpty(userIds)) {
			String [] strUserIds = userIds.split(";");
			for(int i=0; i<strUserIds.length;i++) {
				authorGroup.setUniqId(strUserIds[i]);
				authorGroupService.deleteAuthorGroup(authorGroup);
			}
		}

		status.setComplete();
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/sys/author/uam/AuthorGroupManage.do";
	}

}