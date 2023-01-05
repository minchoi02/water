package egovframework.appn.utl.interceptor;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.com.cmm.LoginVO;

/**
 * @author 이희중
 * @version 1.0.0
 * @since 2020-01-22 오전 10:59
 * @param
 * @return
 * <pre>
 * Comments : 권한 인터셉터
 * <pre>
 */
public class AuthenticInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AuthenticInterceptor.class);

	long beforeTime = 0;

	long afterTime = 0;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

    	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");

    	Date time = new Date();

    	String startTime = format1.format(time);

    	System.out.println("인터셉터 권한체크 시작 ===========>"+startTime);

    	beforeTime = System.currentTimeMillis(); // 코드 실행 후에 시간 받아오기

    	Object securityContextObject = request.getSession().getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);

    	LoginVO vo = (LoginVO) request.getSession().getAttribute("LoginVO");


	  	if (securityContextObject!=null) {

	  	  List roleList = (List)request.getSession().getAttribute("RoleList");

	  	  String reqUrl = request.getRequestURI();

	  	  boolean flag = false;

	  	  if(reqUrl.equals("/cop/bbs/selectBoardList.do")||reqUrl.equals("/cop/bbs/selectBoardArticle.do")||reqUrl.equals("/cop/bbs/insertBoardArticle.do")
	  			  ||reqUrl.equals("/cop/bbs/updateBoardArticle.do")||reqUrl.equals("/cop/bbs/forUpdateBoardArticle.do")||reqUrl.equals("/cop/bbs/deleteBoardArticle.do")
	  			  ||reqUrl.equals("/cop/bbs/addBoardArticle.do")) {
	  		  String bbsId = request.getParameter("bbsId");
	  		  reqUrl = reqUrl+"?bbsId="+bbsId;
	  	  }
	  	  for(int i=0;i<roleList.size();i++) {

	  		  String role = (String)roleList.get(i);
	  		  String[] roleArray = role.split("@");
	  		  role = roleArray[0];
	  		  reqUrl = reqUrl.replace("?", "");
	  		  reqUrl = reqUrl.replace(" ", "");

	  		  if(role!=null) {
		  		  role = role.replace("?", "");
		  		  role = role.replace(" ", "");
		  		  System.out.println(reqUrl+"::"+role);

		  		  if(reqUrl.matches(role)){
		  			  flag = true;
		  		  };
	  		  }
	  	  }
	    	  if(flag) {
	    		  return true;
	    	  }else {
	    		  if(vo.getAuthorCode().equals("ROLE_ADMIN")) {
	    			  	return true;
				  }else{
						response.sendRedirect("/cmm/login/LoginUsr.do?error=role");
				  }
	    		  return false;
	    	  }
	  	  }else {


	  		  	String reqUrl = request.getRequestURI();
	  		  	System.out.println(reqUrl);
		  		  if(reqUrl.matches("/cmm/login/UserInsertView.do")||
		  			 reqUrl.matches("/cmm/login/IdPwFindView.do")||
		  			 reqUrl.matches("/cmm/login/UserInsertStep1.do")||
		  			 reqUrl.matches("/cmm/login/IdDplctCnfirm.do")||
		  			 reqUrl.matches("/cmm/login/urm/UserInsert.do")||
		  			 reqUrl.matches("/cmm/login/IdPwFindView.do")||
		  			 reqUrl.matches("/cmm/login/IdFindView.do")||
		  			 reqUrl.matches("/cmm/login/PwFindView.do")||
		  			 reqUrl.matches("/cmm/login/PwFindView2.do")||
		  			 reqUrl.matches("/cmm/login/updatePw.do")||
		  			 reqUrl.matches("/cmm/login/checkNmPhone.do")||
		  			 reqUrl.matches("/cmm/login/checkIdNmPhone.do")||
		  			 reqUrl.matches("/cmm/fms/getImage.do")||
		  			 reqUrl.matches("/gis/main/gisMainPage.do")||
		  			 reqUrl.matches("/gis/proxy.do")
		  			){
		  			  return true;
		  		  };

	  			request.getSession().removeAttribute("LoginVO");
	  			request.getSession().removeAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
				response.sendRedirect("/admin/login/LoginUsr.do?error=login");
				return false;
		  }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modeAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex){

       	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");

    	Date time = new Date();

    	String endTime = format1.format(time);

    	afterTime = System.currentTimeMillis();
    	System.out.println("인터셉터 권한체크 종료 ===========>"+endTime);

    	long secDiffTime = (afterTime - beforeTime)/1000; //두 시간에 차 계산
    	System.out.println(beforeTime);
    	System.out.println(afterTime);
    	System.out.println("실행시간(m) : "+secDiffTime);

    }

}