package egovframework.appn.gis.main.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.DefaultUriTemplateHandler;

import egovframework.appn.cop.bbs.service.BBSManageService;
import egovframework.appn.gis.main.service.GisProxyVO;
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
@Controller
public class GisMainController {
	
	Logger logger = LoggerFactory.getLogger(GisMainController.class.getName());


	/**
	 * gis 메인 페이지 조회
	 * @return gis 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/gis/main/gisMainPage.do")
	public String getGisMainPage(HttpServletRequest request, ModelMap model, HttpSession session)
	  throws Exception{

		return "gis/main/gisMain";
	}
	
	/**
	 * gis geoserver proxy 우회
	 * @return geoserver 결과값
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */

	@RequestMapping(value = "/gis/proxy.do")
	public void getGisProxy(@ModelAttribute GisProxyVO gisProxyVo, HttpServletResponse response)
	  throws Exception{
		String GEOSERVER_URL = "http://1.221.187.76:8989/geoserver/gis";
		String service = gisProxyVo.getSERVICE();
		String geoServerUrl = GEOSERVER_URL;
		  
		if(service.equals("WFS")){
			BufferedReader in = null;
			try{
				String geoUrl = geoServerUrl+"/wfs?";
				
				if(gisProxyVo.getSERVICE() != null) 		geoUrl += "service="+gisProxyVo.getSERVICE();
				if(gisProxyVo.getVERSION() != null) 		geoUrl += "&version="+gisProxyVo.getVERSION();
				geoUrl += "&request=GetFeature";
				//if(gisProxyVo.getREQUEST() != null) 		geoUrl += "&request="+gisProxyVo.getREQUEST();
				if(gisProxyVo.getTYPENAME() != null) 		geoUrl += "&typeName="+gisProxyVo.getTYPENAME();
				if(gisProxyVo.getBBOX() != null) 			geoUrl += "&bbox="+gisProxyVo.getBBOX();
				if(gisProxyVo.getSRS() != null) 			geoUrl += "&srsName="+gisProxyVo.getSRS();
				if(gisProxyVo.getOUTPUTFORMAT() != null) 			geoUrl += "&outputFormat="+gisProxyVo.getOUTPUTFORMAT();
				if(gisProxyVo.getCQL_FILTER() != null) 		geoUrl += "&cql_filter="+gisProxyVo.getCQL_FILTER();
				
/*				geoServerUrl += "/wfs?";
				geoServerUrl += "service=WFS";
				geoServerUrl += "&";
				geoServerUrl += "version="+gisProxyVo.getVERSION();
				geoServerUrl += "&";
				geoServerUrl += "request=GetFeature";
				geoServerUrl += "&";
				geoServerUrl += "srsName="+gisProxyVo.getSRS();
				geoServerUrl += "&";
				geoServerUrl += "typeName="+gisProxyVo.getTYPENAME();
				geoServerUrl += "&";
				geoServerUrl += "outputFormat="+gisProxyVo.getOUTPUTFORMAT();
				geoServerUrl += "&";
				geoServerUrl += "cql_filter="+gisProxyVo.getCQL_FILTER();

				String geoUrl = geoServerUrl; */
				
				URL url = new URL(geoUrl); 
		        URLConnection urlConn = url.openConnection();
		        in = new BufferedReader(new InputStreamReader(urlConn.getInputStream(), "UTF-8"));
		        
		        String inputLine;
		        StringBuffer sb = new StringBuffer();
	
		        while ((inputLine = in.readLine()) != null) {
		            sb.append(inputLine);
		        }
		        response.setContentType(gisProxyVo.getOUTPUTFORMAT());
		        response.getOutputStream().write((sb.toString()).getBytes("UTF-8"));
		        response.getOutputStream().close();
		        
			}catch(NullPointerException | IllegalArgumentException e){
				logger.error(e.toString());
			}finally{
				if(in != null)
					in.close();
			}
		
		}else if(service.equals("WMS")){
			String geoUrl = geoServerUrl+"/wms?";
			
			if(gisProxyVo.getSERVICE() != null) 		geoUrl += "service="+URLEncoder.encode(gisProxyVo.getSERVICE(), "UTF-8");
			if(gisProxyVo.getVERSION() != null) 		geoUrl += "&version="+URLEncoder.encode(gisProxyVo.getVERSION(), "UTF-8");
			if(gisProxyVo.getREQUEST() != null) 		geoUrl += "&request="+URLEncoder.encode(gisProxyVo.getREQUEST(), "UTF-8");
			if(gisProxyVo.getLAYERS() != null) 			geoUrl += "&layers="+URLEncoder.encode(gisProxyVo.getLAYERS(), "UTF-8");
			if(gisProxyVo.getBBOX() != null) 			geoUrl += "&bbox="+URLEncoder.encode(gisProxyVo.getBBOX(), "UTF-8");
			if(gisProxyVo.getWIDTH() != null) 			geoUrl += "&width="+URLEncoder.encode(gisProxyVo.getWIDTH(), "UTF-8");
			if(gisProxyVo.getHEIGHT() != null) 			geoUrl += "&height="+URLEncoder.encode(gisProxyVo.getHEIGHT(), "UTF-8");
			if(gisProxyVo.getSRS() != null) 			geoUrl += "&srs="+URLEncoder.encode(gisProxyVo.getSRS(), "UTF-8");
			if(gisProxyVo.getFORMAT() != null) 			geoUrl += "&format="+URLEncoder.encode(gisProxyVo.getFORMAT(), "UTF-8");
			if(gisProxyVo.getTRANSPARENT() != null) 	geoUrl += "&transparent="+URLEncoder.encode(gisProxyVo.getTRANSPARENT(), "UTF-8");
			if(gisProxyVo.getSLD_BODY() != null) 		geoUrl += "&sld_body="+URLEncoder.encode(gisProxyVo.getSLD_BODY(), "UTF-8");
			if(gisProxyVo.getVIEWPARAMS() != null) 		geoUrl += "&viewparams="+URLEncoder.encode(gisProxyVo.getVIEWPARAMS(), "UTF-8");
			if(gisProxyVo.getCQL_FILTER() != null) 		geoUrl += "&cql_filter="+URLEncoder.encode(gisProxyVo.getCQL_FILTER(), "UTF-8");
			//if(gisProxyVo.getCQL_FILTER() != null) geoUrl += "&cql_filter=STATUS%20IN%20(2%2C%203)";
			RestTemplate rt = new RestTemplate();
			
			DefaultUriTemplateHandler uriTemplateHandler = (DefaultUriTemplateHandler) rt.getUriTemplateHandler();
			uriTemplateHandler.setStrictEncoding(true);
			rt.setUriTemplateHandler(uriTemplateHandler);
			
			byte[] result = rt.getForObject(geoUrl, byte[].class);

			response.setContentType("image/png");
			response.getOutputStream().write(result);
			response.getOutputStream().close();
		}
	}


}