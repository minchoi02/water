package egovframework.appn.sys.cntnts.service;

import egovframework.com.cmm.ComDefaultVO;

public class CntntsMstr extends ComDefaultVO {

	private static final long serialVersionUID = 1L;
	private CntntsMstr bbsMstr;

	private String cntntsId;
	private String restoreId;
	private String cntntsNm;
	private String delAt;
	private String cntntsCn;
	private String frstRegistPnttm;
	private String frstRegisterId;
	private String lastUpdtPnttm;
	private String lastUpdusrId;

	public CntntsMstr getBbsMstr() {
		return bbsMstr;
	}
	public void setBbsMstr(CntntsMstr bbsMstr) {
		this.bbsMstr = bbsMstr;
	}

	public String getRestoreId() {
		return restoreId;
	}
	public void setRestoreId(String restoreId) {
		this.restoreId = restoreId;
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
	public String getCntntsId() {
		return cntntsId;
	}
	public void setCntntsId(String cntntsId) {
		this.cntntsId = cntntsId;
	}
	public String getCntntsNm() {
		return cntntsNm;
	}
	public void setCntntsNm(String cntntsNm) {
		this.cntntsNm = cntntsNm;
	}
	public String getCntntsCn() {
		return cntntsCn;
	}
	public void setCntntsCn(String cntntsCn) {
		this.cntntsCn = cntntsCn;
	}
}