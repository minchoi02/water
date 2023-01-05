package egovframework.appn.gis.main.service;

/**
 * proxyServer 대한 Vo 클래스를 정의한다.
 * @since 2022.04.01
 * @version 1.0
 * @see
 */

public class GisProxyVO{
	private String SERVICE;
	private String TYPENAME;
	private String VERSION;
	private String REQUEST;
	private String LAYERS;
	private String BBOX;
	private String WIDTH;
	private String HEIGHT;
	private String SRS;
	private String FORMAT;
	private String TRANSPARENT;
	private String SLD_BODY;
	private String VIEWPARAMS;
	private String OUTPUTFORMAT;
	private String CQL_FILTER;
	
	
	public String getSERVICE() {
		return SERVICE;
	}
	public void setSERVICE(String sERVICE) {
		SERVICE = sERVICE;
	}
	public String getTYPENAME() {
		return TYPENAME;
	}
	public void setTYPENAME(String tYPENAME) {
		TYPENAME = tYPENAME;
	}
	public String getVERSION() {
		return VERSION;
	}
	public void setVERSION(String vERSION) {
		VERSION = vERSION;
	}
	public String getREQUEST() {
		return REQUEST;
	}
	public void setREQUEST(String rEQUEST) {
		REQUEST = rEQUEST;
	}
	public String getLAYERS() {
		return LAYERS;
	}
	public void setLAYERS(String lAYERS) {
		LAYERS = lAYERS;
	}
	public String getBBOX() {
		return BBOX;
	}
	public void setBBOX(String bBOX) {
		BBOX = bBOX;
	}
	public String getWIDTH() {
		return WIDTH;
	}
	public void setWIDTH(String wIDTH) {
		WIDTH = wIDTH;
	}
	public String getHEIGHT() {
		return HEIGHT;
	}
	public void setHEIGHT(String hEIGHT) {
		HEIGHT = hEIGHT;
	}
	public String getSRS() {
		return SRS;
	}
	public void setSRS(String sRS) {
		SRS = sRS;
	}
	public String getFORMAT() {
		return FORMAT;
	}
	public void setFORMAT(String fORMAT) {
		FORMAT = fORMAT;
	}
	public String getTRANSPARENT() {
		return TRANSPARENT;
	}
	public void setTRANSPARENT(String tRANSPARENT) {
		TRANSPARENT = tRANSPARENT;
	}
	public String getSLD_BODY() {
		return SLD_BODY;
	}
	public void setSLD_BODY(String sLD_BODY) {
		SLD_BODY = sLD_BODY;
	}
	public String getVIEWPARAMS() {
		return VIEWPARAMS;
	}
	public void setVIEWPARAMS(String vIEWPARAMS) {
		VIEWPARAMS = vIEWPARAMS;
	}
	public String getOUTPUTFORMAT() {
		return OUTPUTFORMAT;
	}
	public void setOUTPUTFORMAT(String oUTPUTFORMAT) {
		OUTPUTFORMAT = oUTPUTFORMAT;
	}
	public String getCQL_FILTER() {
		return CQL_FILTER;
	}
	public void setCQL_FILTER(String cQL_FILTER) {
		CQL_FILTER = cQL_FILTER;
	}
	
	
}