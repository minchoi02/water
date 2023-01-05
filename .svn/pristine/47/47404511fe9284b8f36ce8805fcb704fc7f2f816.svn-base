package egovframework.appn.sys.author.gpm.web;

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

import egovframework.appn.sys.author.gpm.service.GroupManage;
import egovframework.appn.sys.author.gpm.service.GroupManageService;
import egovframework.appn.sys.author.gpm.service.GroupManageVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 그룹관리에 관한 controller 클래스를 정의한다.
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
public class GroupManageController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "groupManageService")
    private GroupManageService groupManageService;

    /** Message ID Generation */
    @Resource(name="egovGroupIdGnrService")
    private EgovIdGnrService egovGroupIdGnrService;

    @Autowired
	private DefaultBeanValidator beanValidator;

	/**
	 * 시스템사용 목적별 그룹 목록 조회
	 * @param groupManageVO GroupManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/gpm/GroupManage.do")
	public String selectGroupList(@ModelAttribute("groupManageVO") GroupManageVO groupManageVO,
                                   ModelMap model) throws Exception {
    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(groupManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(groupManageVO.getRecordCountPerPage());
		paginationInfo.setPageSize(groupManageVO.getPageSize());

		groupManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		groupManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		groupManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		groupManageVO.setGroupManageList(groupManageService.selectGroupList(groupManageVO));
        model.addAttribute("groupList", groupManageVO.getGroupManageList());

        int totCnt = groupManageService.selectGroupListTotCnt(groupManageVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "sys/author/gpm/GroupManage";
	}

	/**
	 * 검색조건에 따른 그룹정보를 조회
	 * @param groupManageVO GroupManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/gpm/Group.do")
	public String selectGroup(@ModelAttribute("groupManageVO") GroupManageVO groupManageVO,
	    		               ModelMap model) throws Exception {

	    model.addAttribute("groupManage", groupManageService.selectGroup(groupManageVO));
	    return "sys/author/gpm/GroupUpdate";
	}

    /**
	 * 그룹 등록화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/gpm/GroupInsertView.do")
    public String insertGroupView()
            throws Exception {
        return "sys/author/gpm/GroupInsert";
    }

	/**
	 * 그룹 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	 * @param groupManage GroupManage
	 * @param groupManageVO GroupManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/gpm/GroupInsert.do")
	public String insertGroup(@ModelAttribute("groupManage") GroupManage groupManage,
			                  @ModelAttribute("groupManageVO") GroupManageVO groupManageVO,
			                   BindingResult bindingResult,
			                   SessionStatus status,
			                   ModelMap model) throws Exception {

    	beanValidator.validate(groupManage, bindingResult); //validation 수행

    	if (bindingResult.hasErrors()) {
			return "sys/author/gpm/GroupInsert";
		} else {
	    	groupManage.setGroupId(egovGroupIdGnrService.getNextStringId());
	        groupManageVO.setGroupId(groupManage.getGroupId());

	        status.setComplete();
	        model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
	        model.addAttribute("groupManage", groupManageService.insertGroup(groupManage, groupManageVO));
	        return "sys/author/gpm/GroupUpdate";
		}
	}

	/**
	 * 화면에 조회된 그룹의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param groupManage GroupManage
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/gpm/GroupUpdate.do")
	public String updateGroup(@ModelAttribute("groupManage") GroupManage groupManage,
			                   BindingResult bindingResult,
                               SessionStatus status,
                               Model model) throws Exception {

    	beanValidator.validate(groupManage, bindingResult); //validation 수행

    	if (bindingResult.hasErrors()) {
			return "sys/author/gpm/GroupUpdate";
		} else {
    	    groupManageService.updateGroup(groupManage);
            status.setComplete();
            model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
    	    return "forward:/sys/author/gpm/Group.do";
		}
	}

	/**
	 * 불필요한 그룹정보를 화면에 조회하여 데이터베이스에서 삭제
	 * @param groupManage GroupManage
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value="/sys/author/gpm/GroupDelete.do")
	public String deleteGroup(@ModelAttribute("groupManage") GroupManage groupManage,
                             SessionStatus status,
                             Model model) throws Exception {
		groupManageService.deleteGroup(groupManage);
		status.setComplete();
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/sys/author/gpm/GroupManage.do";
	}

	/**
	 * 불필요한 그룹정보 목록을 화면에 조회하여 데이터베이스에서 삭제
	 * @param groupIds String
	 * @param groupManage GroupManage
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value="/sys/author/gpm/GroupListDelete.do")
	public String deleteGroupList(@RequestParam("groupIds") String groupIds,
			                      @ModelAttribute("groupManage") GroupManage groupManage,
	                               SessionStatus status,
	                               Model model) throws Exception {
		if(StringUtils.isNotEmpty(groupIds)) {
			String [] strGroupIds = groupIds.split(";");
	    	for(int i=0; i<strGroupIds.length;i++) {
	    		groupManage.setGroupId(strGroupIds[i]);
	    		groupManageService.deleteGroup(groupManage);
	    	}
		}
		status.setComplete();
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/sys/author/gpm/GroupManage.do";
	}

    /**
	 * 그룹팝업 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/sys/author/gpm/GroupSearchView.do")
    public String selectGroupSearchView()
            throws Exception {
        return "sys/author/gpm/GroupSearch";
    }

	/**
	 * 시스템사용 목적별 그룹 목록 조회
	 * @param groupManageVO GroupManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sys/author/gpm/GroupSearchList.do")
	public String selectGroupSearchList(@ModelAttribute("groupManageVO") GroupManageVO groupManageVO,
                                   ModelMap model) throws Exception {
    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(groupManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(groupManageVO.getRecordCountPerPage());
		paginationInfo.setPageSize(groupManageVO.getPageSize());

		groupManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		groupManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		groupManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		groupManageVO.setGroupManageList(groupManageService.selectGroupList(groupManageVO));
        model.addAttribute("groupList", groupManageVO.getGroupManageList());

        int totCnt = groupManageService.selectGroupListTotCnt(groupManageVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "sys/author/gpm/GroupSearch";
	}
}