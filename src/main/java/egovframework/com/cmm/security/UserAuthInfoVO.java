package egovframework.com.cmm.security;


import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;

public class UserAuthInfoVO implements UserDetails {

	private static final Logger logger
		= LoggerFactory.getLogger(AdminAuthInfoVO.class);

	/**
	 * 직렬화 아이디
	 */
	private static final long serialVersionUID
		= SpringSecurityCoreVersion.SERIAL_VERSION_UID ;


	// 사용자가 추가한 어드민의 추가정보
	/** 아이디 */
	private String id;
	/** 이름 */
	private String username;
	/** 주민등록번호 */
	private String ihidNum;
	/** 이메일주소 */
	private String email;
	/** 비밀번호 */
	private String password;
	/** 비밀번호 힌트 */
	private String passwordHint;
	/** 비밀번호 정답 */
	private String passwordCnsr;
	/** 사용자구분 */
	private String userSe;
	/** 조직(부서)ID */
	private String deptId;
	/** 조직(부서)명 */
	private String deptNm;
	/** 고유아이디 */
	private String uniqId;
	/** 로그인 후 이동할 페이지 */
	private String url;
	/** 사용자 IP정보 */
	private String ip;
	/** GPKI인증 DN */
	private String dn;
	/** 소속기관 코드 */
	private String pstinstCode;
	/** 권한 코드 */
	private String authorCode;
	/** 에러 내용 */
	private String error;
	/** 로그인 구분 */
	private String loginSe;

	private String userType;



	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	/*
	 * 권한 반환
	 */
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		logger.info("Collection 호출");
//		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//        authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
//		return authorities;
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	/**
	 *
	 */
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	/**
	 *
	 */
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	/**
	 *
	 */
	@Override
	public boolean isEnabled() {
		return true;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIhidNum() {
		return ihidNum;
	}

	public void setIhidNum(String ihidNum) {
		this.ihidNum = ihidNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordHint() {
		return passwordHint;
	}

	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}

	public String getPasswordCnsr() {
		return passwordCnsr;
	}

	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}

	public String getUserSe() {
		return userSe;
	}

	public void setUserSe(String userSe) {
		this.userSe = userSe;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDeptNm() {
		return deptNm;
	}

	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}

	public String getUniqId() {
		return uniqId;
	}

	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getDn() {
		return dn;
	}

	public void setDn(String dn) {
		this.dn = dn;
	}

	public String getPstinstCode() {
		return pstinstCode;
	}

	public void setPstinstCode(String pstinstCode) {
		this.pstinstCode = pstinstCode;
	}

	public String getAuthorCode() {
		return authorCode;
	}

	public void setAuthorCode(String authorCode) {
		this.authorCode = authorCode;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getLoginSe() {
		return loginSe;
	}

	public void setLoginSe(String loginSe) {
		this.loginSe = loginSe;
	}


}

