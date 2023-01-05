package egovframework.appn.sys.bbs.service;

import egovframework.com.cmm.ComDefaultVO;

public class BbsMstr extends ComDefaultVO {

	private static final long serialVersionUID = 1L;
	private BbsMstr bbsMstr;

	private String bbsId;
	private String bbsNm;
	private String adminLimitAt;
	private String fileAtchAt;
	private String fileAtchCnt;
	private String replyAt;
	private String cmtAt;
	private String bbsTy;
	private String bbsDc;
	private String delAt;
	private String frstRegistPnttm;
	private String frstRegisterId;
	private String lastUpdtPnttm;
	private String lastUpdusrId;


	public String getBbsTy() {
		return bbsTy;
	}
	public void setBbsTy(String bbsTy) {
		this.bbsTy = bbsTy;
	}
	public String getCmtAt() {
		return cmtAt;
	}
	public void setCmtAt(String cmtAt) {
		this.cmtAt = cmtAt;
	}
	public BbsMstr getBbsMstr() {
		return bbsMstr;
	}
	public void setBbsMstr(BbsMstr bbsMstr) {
		this.bbsMstr = bbsMstr;
	}
	public String getBbsId() {
		return bbsId;
	}
	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}
	public String getBbsNm() {
		return bbsNm;
	}
	public void setBbsNm(String bbsNm) {
		this.bbsNm = bbsNm;
	}
	public String getAdminLimitAt() {
		return adminLimitAt;
	}
	public void setAdminLimitAt(String adminLimitAt) {
		this.adminLimitAt = adminLimitAt;
	}
	public String getFileAtchAt() {
		return fileAtchAt;
	}
	public void setFileAtchAt(String fileAtchAt) {
		this.fileAtchAt = fileAtchAt;
	}
	public String getFileAtchCnt() {
		return fileAtchCnt;
	}
	public void setFileAtchCnt(String fileAtchCnt) {
		this.fileAtchCnt = fileAtchCnt;
	}
	public String getReplyAt() {
		return replyAt;
	}
	public void setReplyAt(String replyAt) {
		this.replyAt = replyAt;
	}
	public String getBbsDc() {
		return bbsDc;
	}
	public void setBbsDc(String bbsDc) {
		this.bbsDc = bbsDc;
	}
	public String getDelAt() {
		return delAt;
	}
	public void setDelAt(String delAt) {
		this.delAt = delAt;
	}
	public String getFrstRegistPnttm() {
		return frstRegistPnttm;
	}
	public void setFrstRegistPnttm(String frstRegistPnttm) {
		this.frstRegistPnttm = frstRegistPnttm;
	}
	public String getFrstRegisterId() {
		return frstRegisterId;
	}
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}
	public String getLastUpdtPnttm() {
		return lastUpdtPnttm;
	}
	public void setLastUpdtPnttm(String lastUpdtPnttm) {
		this.lastUpdtPnttm = lastUpdtPnttm;
	}
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}
}