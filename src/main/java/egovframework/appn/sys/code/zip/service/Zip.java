package egovframework.appn.sys.code.zip.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 우편번호 모델 클래스
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
public class Zip implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	/*
	 * 우편번호일련번호
	 */
	private int    zipSn          = 0;

	/*
	 * 우편번호
	 */
    private String zip            = "";
    
    /*
     * 시도명
     */
	private String ctprvnNm       = "";
	
	/*
	 * 시군구명
	 */
    private String signguNm       = "";
    
    /*
     * 읍면명
     */
    private String emNm          = "";
    
    /*
     * 도로명코드
     */
    private String rnCd          = "";
    
    /*
     * 도로명
     */
    private String rnNm          = "";
    
    /*
     * 건물번호본번
     */
    private String bdnbrMnnm     = "";
    
    /*
     * 건물번호부번
     */
    private String bdnbrSlno     = "";
    
    /*
     * 상세건물명
     */
    private String detailBuldNm  = "";
    
    /*
     * 법정동코드
     */
    private String legaldongCd   = "";
    
    /*
     * 법정동명
     */
    private String legaldongNm   = "";   
    
    /*
     * 읍면동일련번호
     */
    private String emdSn         = "";     
    
    /*
     * 리명
     */
    private String liNm          = "";     
    
    /*
     * 지번본부
     */
    private String lnmMnnm       = "";     
    
    /*
     * 지번부번
     */
    private String lnmSlno       = "";     
    
	public int getZipSn() {
		return zipSn;
	}

	public void setZipSn(int zipSn) {
		this.zipSn = zipSn;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getCtprvnNm() {
		return ctprvnNm;
	}

	public void setCtprvnNm(String ctprvnNm) {
		this.ctprvnNm = ctprvnNm;
	}

	public String getSignguNm() {
		return signguNm;
	}

	public void setSignguNm(String signguNm) {
		this.signguNm = signguNm;
	}

	public String getEmNm() {
		return emNm;
	}

	public void setEmNm(String emNm) {
		this.emNm = emNm;
	}

	public String getRnCd() {
		return rnCd;
	}

	public void setRnCd(String rnCd) {
		this.rnCd = rnCd;
	}

	public String getRnNm() {
		return rnNm;
	}

	public void setRnNm(String rnNm) {
		this.rnNm = rnNm;
	}

	public String getBdnbrMnnm() {
		return bdnbrMnnm;
	}

	public void setBdnbrMnnm(String bdnbrMnnm) {
		this.bdnbrMnnm = bdnbrMnnm;
	}

	public String getBdnbrSlno() {
		return bdnbrSlno;
	}

	public void setBdnbrSlno(String bdnbrSlno) {
		this.bdnbrSlno = bdnbrSlno;
	}

	public String getLegaldongCd() {
		return legaldongCd;
	}

	public void setLegaldongCd(String legaldongCd) {
		this.legaldongCd = legaldongCd;
	}

	public String getLegaldongNm() {
		return legaldongNm;
	}

	public void setLegaldongNm(String legaldongNm) {
		this.legaldongNm = legaldongNm;
	}

	public String getEmdSn() {
		return emdSn;
	}

	public void setEmdSn(String emdSn) {
		this.emdSn = emdSn;
	}

	public String getLiNm() {
		return liNm;
	}

	public void setLiNm(String liNm) {
		this.liNm = liNm;
	}

	public String getLnmMnnm() {
		return lnmMnnm;
	}

	public void setLnmMnnm(String lnmMnnm) {
		this.lnmMnnm = lnmMnnm;
	}

	public String getLnmSlno() {
		return lnmSlno;
	}

	public void setLnmSlno(String lnmSlno) {
		this.lnmSlno = lnmSlno;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getCompleteDoro() {
		String returnString = ctprvnNm + " " + signguNm + " ";
		if(!"".equals(emNm)) returnString += emNm;
		returnString += rnNm + " " + bdnbrMnnm;
		if(!"0".equals(bdnbrSlno)) returnString += "-" + bdnbrSlno;
		if(!"".equals(detailBuldNm)) returnString += "(" + detailBuldNm + ")";
		else if(!"".equals(legaldongNm)) returnString += "(" + legaldongNm + ")";
		return returnString;
	}

	public String getCompleteJibun() {
		String returnString = ctprvnNm + " " + signguNm + " ";
		if(!"".equals(emNm)) returnString += emNm + " ";
		else if(!"".equals(legaldongNm)) returnString += legaldongNm + " ";
		if(!"".equals(liNm)) returnString += liNm + " ";
		returnString += lnmMnnm;
		if(!"0".equals(lnmSlno)) returnString += "-" + lnmSlno;
		return returnString;
	}

	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}
