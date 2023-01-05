package egovframework.appn.sys.code.zip.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.appn.sys.code.zip.service.CcmZipManageService;
import egovframework.appn.sys.code.zip.service.ZipVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 *
 * 우편번호에 관한 요청을 받아 서비스 클래스로 요청을 전달하고 서비스클래스에서 처리한 결과를 웹 화면으로 전달을 위한 Controller를 정의한다
 * @author 공통서비스 개발팀 이중호
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Controller
public class CcmZipManageController {

	@Resource(name = "ZipManageService")
	private CcmZipManageService zipManageService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 우편번호 찾기 팝업 메인창을 호출한다.
	 * @param model
	 * @return "/cmm/sym/zip/EgovCcmZipSearchPopup"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/code/zip/CcmZipSearchPopup.do")
	public String callNormalCalPopup(ModelMap model) throws Exception {
		return "cmm/zip/CcmZipSearchPopup";
	}

	/**
	 * 우편번호 찾기 목록을 조회한다.
	 * @param searchVO
	 * @param model
	 * @return "/cmm/sym/zip/EgovCcmZipSearchList"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/code/zip/CcmZipSearchList.do")
	public String selectZipSearchList(@ModelAttribute("searchVO") ZipVO searchVO, ModelMap model) throws Exception {
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

		model.addAttribute("resultList", zipManageService.selectZipList(searchVO));

		int totCnt = zipManageService.selectZipListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "cmm/zip/CcmZipSearchList";
	}
}