
package egovframework.com.cmm.security;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;


@Service
/* 로그인 실패 대응 로직 */
public class AdminLoginFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException exception)
			throws IOException, ServletException {


		if (exception instanceof AuthenticationServiceException) {
			response.sendRedirect("/admin/login/LoginUsr.do?error=noUser");

		} else if(exception instanceof BadCredentialsException) {
			response.sendRedirect("/admin/login/LoginUsr.do?error=failIdPass");

		} else if(exception instanceof LockedException) {
			request.setAttribute("loginFailMsg", "잠긴 계정입니다..");

		} else if(exception instanceof DisabledException) {
			request.setAttribute("loginFailMsg", "비활성화된 계정입니다..");

		} else if(exception instanceof AccountExpiredException) {
			request.setAttribute("loginFailMsg", "만료된 계정입니다..");

		} else if(exception instanceof CredentialsExpiredException) {
			request.setAttribute("loginFailMsg", "비밀번호가 만료되었습니다.");
		}

	}
}