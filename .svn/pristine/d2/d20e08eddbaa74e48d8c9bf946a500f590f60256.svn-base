package egovframework.com.cmm.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import egovframework.appn.cmm.login.service.LoginService;
import egovframework.appn.sys.author.arm.service.AuthorRoleManageService;
import egovframework.com.cmm.LoginVO;

public class UserAuthService implements AuthenticationProvider {

	private static final Logger logger = LoggerFactory.getLogger(AdminAuthService.class);

	/**
	 * 로그인 사용자 인증 서비스 구현 메서드
	 * 성공하면 default-target-url 에 설정된 화면으로 이동한다.
	 */


	@Resource(name = "loginService")
	private LoginService loginService;

    @Resource(name = "authorRoleManageService")
    private AuthorRoleManageService authorRoleManageService;


	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {

		logger.info("AuthenticationProvider > authenticate 호출");

		// 로그인 화면에서 입력한 정보를 가져옵니다.
		String user_id = (String)authentication.getPrincipal();
		String user_pw = (String)authentication.getCredentials();

		logger.info("넘어온 정보: id:{} , pwd:{}", user_id , user_pw);

		LoginVO loginVO = new LoginVO();

		loginVO.setId(user_id);
		loginVO.setPassword(user_pw);
		loginVO.setUserSe("USR");


		LoginVO resultVO = null;
		try {
			resultVO = loginService.actionLogin(loginVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 정보가 없으면 나간다.
		if (resultVO.getAuthorCode() == null ) {
			throw new BadCredentialsException("아이디가 없거나 패스워드가 다릅니다." );
		}


		// 로그인한 사용자의 부가정보를 담아준다.
		AdminAuthInfoVO user_info = new AdminAuthInfoVO();
		user_info.setUserType("ROLE_USER");
		user_info.setId(user_id);
		user_info.setPassword(user_pw);
		user_info.setUsername(resultVO.getName());
		user_info.setIhidNum(resultVO.getIhidNum());
		user_info.setEmail(resultVO.getEmail());
		user_info.setPasswordHint(resultVO.getPasswordHint());
		user_info.setPasswordCnsr(resultVO.getPasswordCnsr());
		user_info.setUserSe(resultVO.getUserSe());
		user_info.setDeptId(resultVO.getDeptId());
		user_info.setDeptNm(resultVO.getDeptNm());
		user_info.setUniqId(resultVO.getUniqId());
		user_info.setUrl(resultVO.getUrl());
		user_info.setIp(resultVO.getIp());
		user_info.setDn(resultVO.getDn());
		user_info.setPstinstCode(resultVO.getPstinstCode());
		user_info.setAuthorCode(resultVO.getAuthorCode());
		user_info.setLoginSe(resultVO.getLoginSe());
		user_info.setMoblphonNo(resultVO.getMoblphonNo());
		user_info.setCodeNm(resultVO.getCodeNm());

		// 로그인 사용자의 권한
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		if ( user_info.getAuthorCode().equals("ROLE_USER")||user_info.getAuthorCode().equals("ROLE_ADMIN") ) {
			roles.add(new SimpleGrantedAuthority("ROLE_USER")); //유저 권한 , USER 하면 컨트롤어에서 권한 없다고 한다.
		} else {
			roles.add(new SimpleGrantedAuthority("IS_AUTHENTICATED_ANONYMOUSLY")); // 일반 사용자이다 .
		}



        // 반환할 값을 만든다.
        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(user_id, user_pw, roles);

        // 로그인한 사용자의 정보를 detail 에 넣어준다.
        result.setDetails(user_info);

        logger.info("return: {}" + result.toString());

		return result;

	}

	@Override
	public boolean supports(Class<?> authentication) {
		logger.info("AuthenticationProvider > supports 호출");
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}