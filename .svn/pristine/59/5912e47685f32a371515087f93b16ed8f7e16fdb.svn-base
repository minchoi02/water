package egovframework.com.cmm.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.namo.crossuploader.FileItem;
import com.namo.crossuploader.FileUpload;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.FileMngService;
import egovframework.com.cmm.service.FileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 파일 조회, 삭제, 다운로드 처리를 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.25  이삼섭          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Controller
public class EgovFileMngController {

	@Resource(name = "FileMngService")
	private FileMngService fileService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "FileMngUtil")
	private FileMngUtil fileUtil;

	@Resource(name = "FileMngService")
	private FileMngService fileMngService;

	/**
	 * 첨부파일에 대한 목록을 조회한다.
	 *
	 * @param fileVO
	 * @param atchFileId
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cmm/fms/selectFileInfs.do")
	public String selectFileInfs(@ModelAttribute("searchVO") FileVO fileVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {
		String atchFileId = (String) commandMap.get("param_atchFileId");

		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileService.selectFileInfs(fileVO);

		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "N");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);

		return "cmm/fms/EgovFileList.empty";
	}

	/**
	 * 첨부파일 변경을 위한 수정페이지로 이동한다.
	 *
	 * @param fileVO
	 * @param atchFileId
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cmm/fms/selectFileInfsForUpdate.do")
	public String selectFileInfsForUpdate(@ModelAttribute("searchVO") FileVO fileVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

		String atchFileId = (String) commandMap.get("param_atchFileId");

		fileVO.setAtchFileId(atchFileId);

		List<FileVO> result = fileService.selectFileInfs(fileVO);

		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "Y");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);

		return "cmm/fms/EgovFileList.empty";
	}

	/**
	 * 첨부파일에 대한 삭제를 처리한다.
	 *
	 * @param fileVO
	 * @param returnUrl
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cmm/fms/deleteFileInfs.do")
	public String deleteFileInf(@ModelAttribute("searchVO") FileVO fileVO, @RequestParam("returnUrl") String returnUrl, HttpServletRequest request, ModelMap model)
			throws Exception {

		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) request.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);

		if (loginvo.getAuthorCode()!=null) {
			fileService.deleteFileInf(fileVO);
		}

		//--------------------------------------------
		// contextRoot가 있는 경우 제외 시켜야 함
		//--------------------------------------------
		////return "forward:/cmm/fms/selectFileInfs.do";
		//return "forward:" + returnUrl;

		if ("".equals(request.getContextPath()) || "/".equals(request.getContextPath())) {
			return "forward:" + returnUrl;
		}

		if (returnUrl.startsWith(request.getContextPath())) {
			return "forward:" + returnUrl.substring(returnUrl.indexOf("/", 1));
		} else {
			return "forward:" + returnUrl;
		}
		////------------------------------------------
	}


	/**
	 * 이미지 첨부파일에 대한 목록을 조회한다.
	 *
	 * @param fileVO
	 * @param atchFileId
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cmm/fms/selectImageFileInfs.do")
	public String selectImageFileInfs(@ModelAttribute("searchVO") FileVO fileVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

		String atchFileId = (String) commandMap.get("atchFileId");

		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileService.selectImageFileList(fileVO);

		model.addAttribute("fileList", result);

		return "cmm/fms/EgovImgFileList";
	}
    /**
	 * 첨부파일에 대한 삭제(Ajax)를 처리한다.
	 *
	 * @param fileVO
	 * @param returnUrl
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cmm/fms/deleteFileInfAjax.do")
	public @ResponseBody Map deletefileInfAjax(@ModelAttribute("searchVO") FileVO fileVO, HttpServletRequest request, ModelMap model)
			throws Exception {

		Boolean isAdmin = false;
    	LoginVO loginvo = (LoginVO) request.getSession().getAttribute("LoginVO");
    	isAdmin = loginvo.getAuthorCode().equals(("ROLE_ADMIN"));
    	model.addAttribute("isAdmin", isAdmin);

		if (loginvo.getAuthorCode()!=null) {
			fileService.deleteFileInf(fileVO);
		}

        fileVO.setAtchFileId(fileVO.getAtchFileId());

        List<FileVO> fileList = fileService.selectFileInfs(fileVO);

        Map rsMap = new HashMap<>();

        rsMap.put("fileList", fileList);

        return rsMap;

	}
	@RequestMapping("/namo/crossuploader/Upload/FileUpload.do")
	public @ResponseBody List<FileVO>  BasicFileUpload(HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		Set<String> keySet = req.getParameterMap().keySet();
		for(String key: keySet) {
			System.out.println(key + ": " + req.getParameter(key));
		}

		/*나모업로더 설정*/
    	FileUpload fileUpload = new FileUpload(req, res);
    	fileUpload.setAutoMakeDirs(true);
		String saveDirPath =  propertyService.getString("Globals.fileStorePath");
		saveDirPath += (File.separator);
		fileUpload.startUpload(saveDirPath);
		FileItem[] fileItems = fileUpload.getFileItems("CU_FILE");

		List<FileVO> result = null;
		if (fileItems.length>0) {
			result = fileUtil.parseFileInf(fileItems,saveDirPath, "BBS_", 0,  "");
			//atchFileId = fileMngService.insertFileInfs(result);
		}


        return result;

	}
}
