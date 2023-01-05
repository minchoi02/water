package egovframework.com.cmm.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.namo.crossuploader.CrossUploaderException;
import com.namo.crossuploader.FileDownload;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.FileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 파일 다운로드를 위한 컨트롤러 클래스
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
 *   2009.3.25  이삼섭          최초 생성
 *
 * Copyright (C) 2009 by MOPAS  All right reserved.
 * </pre>
 */
@Controller
public class EgovFileDownloadController {

	@Resource(name = "FileMngService")
	private FileMngService fileService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovFileDownloadController.class);

	/**
	 * 브라우저 구분 얻기.
	 *
	 * @param request
	 * @return
	 */
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}

	/**
	 * Disposition 지정하기.
	 *
	 * @param filename
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			//throw new RuntimeException("Not supported browser");
			throw new IOException("Not supported browser");
		}

		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}

	/**
	 * 첨부파일로 등록된 파일에 대하여 다운로드를 제공한다.
	 *
	 * @param commandMap
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/cmm/fms/FileDown.do")
	public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String atchFileId = (String) commandMap.get("atchFileId");
		String fileSn = (String) commandMap.get("fileSn");

    	LoginVO loginvo = (LoginVO) request.getSession().getAttribute("LoginVO");

		if (loginvo.getAuthorCode()!=null) {

			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(atchFileId);
			fileVO.setFileSn(fileSn);
			FileVO fvo = fileService.selectFileInf(fileVO);

			File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
			long fSize = uFile.length();

			if (fSize > 0) {
				String mimetype = "application/x-msdownload";

				response.setContentType(mimetype);
				setDisposition(fvo.getOrignlFileNm(), request, response);
				//response.setContentLength(fSize);

				BufferedInputStream in = null;
				BufferedOutputStream out = null;

				try {
					in = new BufferedInputStream(new FileInputStream(uFile));
					out = new BufferedOutputStream(response.getOutputStream());

					FileCopyUtils.copy(in, out);
					out.flush();
				} catch (Exception ex) {
					LOGGER.debug("IGNORED: {}", ex.getMessage());
				} finally {
					if (in != null) {
						try {
							in.close();
						} catch (Exception ignore) {
							LOGGER.debug("IGNORED: {}", ignore.getMessage());
						}
					}
					if (out != null) {
						try {
							out.close();
						} catch (Exception ignore) {
							LOGGER.debug("IGNORED: {}", ignore.getMessage());
						}
					}
				}

			} else {
				response.setContentType("application/x-msdownload");

				PrintWriter printwriter = response.getWriter();
				printwriter.println("<html>");
				printwriter.println("<br><br><br><h2>Could not get file name:<br>" + fvo.getOrignlFileNm() + "</h2>");
				printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
				printwriter.println("<br><br><br>&copy; webAccess");
				printwriter.println("</html>");
				printwriter.flush();
				printwriter.close();
			}
		}
	}
	@RequestMapping("/namo/crossuploader/Download/FileDownloadload.do")
	public @ResponseBody Map BasicFileUpload(HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		FileDownload fileDownload = new FileDownload(req, res);

		String tempZipFilePath = "";

		try {
			String downloadFormData = req.getParameter("CD_DOWNLOAD_FILE_INFO");
			if (downloadFormData == null)
				throw new Exception("다운로드 중 예외가 발생했습니다.");

			JSONParser jsonParser = new JSONParser();
			Object obj = jsonParser.parse(downloadFormData);
			System.out.println("obj : " + obj);

			JSONArray downloadFileInfoArray = (JSONArray)obj;


			// JSONObject jsonObject = (JSONObject)downloadFileInfoArray.get(i);
			// (String)jsonObject.get("fileId");
			// (String)jsonObject.get("fileName"); // 필요할 경우 사용합니다.
			// (String)jsonObject.get("fileSize"); // 필요할 경우 사용합니다.
			// (String)jsonObject.get("fileUrl");  // 각 파일의 URL이 다르거나 SingleFileDownload일 때 사용됩니다

			String streFileNm = "";
			String orignlFileNm = "";
			String fileNameAlias = "";
			String filePath = propertyService.getString("Globals.fileStorePath");
			InputStream is = null;
			long fileMg = 0;
			if(downloadFileInfoArray.size() == 1)
			{
				JSONObject jsonObject = (JSONObject)downloadFileInfoArray.get(0);
				streFileNm = (String)jsonObject.get("streFileNm");
				orignlFileNm = (String)jsonObject.get("fileName");
				fileMg = (long)jsonObject.get("fileSize");
				File file = new File(filePath + streFileNm);
				is = new FileInputStream(file);
			}
			else if(downloadFileInfoArray.size() > 1)
			{
				 List filePathList = GetFilePathList(downloadFileInfoArray, filePath);

				 tempZipFilePath = CompressFiles(filePathList);

	             filePath = tempZipFilePath;
	             fileNameAlias = "download.zip";
			}

			// fileNameAlias는 웹서버 환경에 따라 적절히 인코딩 되어야 합니다.
			fileNameAlias = URLEncoder.encode(fileNameAlias, "UTF-8");

			// attachment 옵션에 따라 파일 종류에 관계 없이 항상 파일 저장 대화상자를 출력할 수 있습니다.
			boolean attachment = true;
			// resumable 옵션에 따라 파일 이어받기가 가능합니다.
			// 클라이언트에서 이어받기 요청이 있어야 하며, 이어받기 요청이 없을 경우 일반 다운로드와 동일하게 동작합니다.
			boolean resumable = true;
			// filePath에 지정된 파일을 fileNameAlias 이름으로 다운로드 합니다.
			//fileDownload.startStreamDownload(fis, arg1, arg2, arg3);
			fileDownload.startStreamDownload(is, orignlFileNm, fileMg, resumable);



			// 다른 유형의 다운로드 함수들
			// startDownload(String filePath);
			// startDownload(String filePath, boolean attachment);
			// startDownload(String filePath, boolean attachment, boolean resumable);
			// startDownload(String filePath, String fileNameAlias);

			 //startDownload(filePath, fileNameAlias, attachment);
			// startStreamDownload(InputStream inputStream, String fileNameAlias, long fileSize, boolean attachment);
		}
		catch(CrossUploaderException ex) {
			System.out.println("다운로드 중 예외 발생 : " + ex.getMessage());
			res.setStatus(res.SC_INTERNAL_SERVER_ERROR);
			System.out.println("다운로드 중 예외 발생 : " + ex.getMessage());
		}
		catch(FileNotFoundException ex) {
			System.out.println("다운로드 중 예외 발생 : " + ex.getMessage());
			res.setStatus(res.SC_INTERNAL_SERVER_ERROR);
			System.out.println("다운로드 중 예외 발생 : " + ex.getMessage());
		}
		catch(IOException ex) {
			System.out.println("다운로드 중 예외 발생 : " + ex.getMessage());
			res.setStatus(res.SC_INTERNAL_SERVER_ERROR);
			System.out.println("다운로드 중 예외 발생 : " + ex.getMessage());
		}
		catch(Exception ex) {
			System.out.println("다운로드 중 예외 발생 : " + ex.getMessage());
			res.setStatus(res.SC_INTERNAL_SERVER_ERROR);
			System.out.println("다운로드 중 예외 발생 : " + ex.getMessage());
		}
		/*나모업로더 설정
    	FileUpload fileUpload = new FileUpload(req, res);
    	fileUpload.setAutoMakeDirs(true);
		String saveDirPath =  propertyService.getString("Globals.fileStorePath");
		saveDirPath += ("UploadDir" + File.separator);
		fileUpload.startUpload(saveDirPath);
		FileItem[] fileItems = fileUpload.getFileItems("CU_FILE");

		String atchFileId ="";
		if (fileItems.length>0) {
			List<FileVO> result = fileUtil.parseFileInf(fileItems,saveDirPath, "BBS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		}
*/
		Map rs = new HashMap<>();
		rs.put("downloadSuccess", "downloadSuccess");


        return rs;

	}
	 private List GetFilePathList(JSONArray downloadFileInfoArray, String filePath) throws Exception
	    {
	        List filePathList = new ArrayList();

	        /**
	        * 다운로드 할 파일 설정
	        * DB 등에 저장된 파일의 정보를 가져옵니다. 샘플에서는 filePath 경로에 아래 파일들이 존재하는 것을 가정합니다.
	        */
	        for (int i = 0; i < downloadFileInfoArray.size(); i++)
	        {
	        	Map fileInfo = new HashMap();
				JSONObject downloadFileInfo = (JSONObject)downloadFileInfoArray.get(i);
				System.out.println("GetFilePathList_downloadFileInfo :" + downloadFileInfo);
				String fileId = (String)downloadFileInfo.get("fileId");
				System.out.println("GetFilePathList_fileId :" + fileId);

				fileInfo.put("streFileNm", downloadFileInfo.get("streFileNm"));
				fileInfo.put("fileName", downloadFileInfo.get("fileName"));
				fileInfo.put("fileSize", downloadFileInfo.get("fileSize"));
				fileInfo.put("filePath", filePath);

	            filePathList.add(fileInfo);

				System.out.println("GetFilePathList_filePathList :" + filePathList);
	        }

	        return filePathList;
	    }

	    private String GetFileNameAlias(String fileId) throws Exception
	    {
	        /**
	        * 다운로드 할 파일 설정
	        * DB 등에 저장된 파일의 정보를 가져옵니다. 샘플에서는 아래 파일들이 존재하는 것을 가정합니다.
	        */
	        String fileNameAlias = "";
			if (fileId.compareTo("FILEID_0001") == 0)
				fileNameAlias = "나모크로스에디터3_제품소개서.pdf.pdf";
			else if (fileId.compareTo("FILEID_0002") == 0)
				fileNameAlias = "ActiveSquare 7_brochure.pdf";
			else if (fileId.compareTo("FILEID_0003") == 0)
				fileNameAlias = "130617_나모_펍트리_브로셔_130702.pdf";
			else
				throw new Exception("다운로드 할 파일이 업습니다.");

	        return fileNameAlias;

	    }

		public String CompressFiles(List filePathList) throws IOException
		{
			final int BUFFER_SIZE = 1024 * 2;
			final int COMPRESSION_LEVEL = 9;
			String tempZipFilePath = "";

			File tempZipFile= File.createTempFile("namo_download_", ".tmp");
			FileOutputStream fos = new FileOutputStream(tempZipFile); // FileOutputStream;
			BufferedOutputStream bos = new BufferedOutputStream(fos); // BufferedStream
			ZipOutputStream zos = new ZipOutputStream(bos); // ZipOutputStream
			zos.setLevel(COMPRESSION_LEVEL); // 압축 레벨 - 최대 압축률은 9, 디폴트 8

			for(int i=0; i<filePathList.size(); i++) {
				String filePath = (String)((Map)filePathList.get(i)).get("filePath");
				String streFileNm = (String)((Map)filePathList.get(i)).get("streFileNm");
				String fileName = (String)((Map)filePathList.get(i)).get("fileName");
				File sourceFile = new File(filePath+streFileNm);
				BufferedInputStream bis = null;
				bis = new BufferedInputStream(new FileInputStream(sourceFile));
				ZipEntry zentry = new ZipEntry(fileName);
				zentry.setTime(sourceFile.lastModified());
				zos.putNextEntry(zentry);

				byte[] buffer = new byte[BUFFER_SIZE];
				int cnt = 0;
				while ((cnt = bis.read(buffer, 0, BUFFER_SIZE)) != -1) {
					zos.write(buffer, 0, cnt);
				}
				zos.closeEntry();
				if (bis != null)
					bis.close();
			}

			if (zos != null) {
				zos.finish();
				zos.close();
			}
			if (bos != null) {
				bos.close();
			}
			if (fos != null) {
				fos.close();
			}

			tempZipFilePath = tempZipFile.getPath();

			return tempZipFilePath;
		 }

}
