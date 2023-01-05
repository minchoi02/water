package egovframework.appn.asset.terminal.service;

import java.math.BigDecimal;

/**
 * @Class Name : TerminalInfoVO.java
 * @Description : TerminalInfo VO class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */
public class TerminalInfoVO extends TerminalInfoDefaultVO{
    private static final long serialVersionUID = 1L;

    /** terminal_managenum */
    private String terminalManagenum;

    /** customer_code */
    private String customerNum;

    private String customerName;

    /** terminal_name */
    private String terminalName;

    private String chargerNm;

    private String subterminalManagenum;

    private String manageBizplc;

    /** lat */
    private BigDecimal lat;

    /** lot */
    private BigDecimal lot;

    /** location_detail */
    private String locationDetail;

    /** location_photo */
    private String locationPhoto;

    /** purchase_year */
    private String purchaseYear;

    /** standard_code */
    private String standardCode;

    /** spec */
    private String spec;

    /** terminal_mac_addr */
    private String terminalMacAddr;

    /** terminal_fw_info */
    private String terminalFwInfo;

    /** terminal_btry_info */
    private String terminalBtryInfo;

    /** gateway_1 */
    private String gateway1;

    /** gateway_2 */
    private String gateway2;

    /** use_yn */
    private String useYn;

    public String getTerminalManagenum() {
        return this.terminalManagenum;
    }

    public void setTerminalManagenum(String terminalManagenum) {
        this.terminalManagenum = terminalManagenum;
    }

    public String getcustomerNum() {
        return this.customerNum;
    }

    public void setcustomerNum(String customerNum) {
        this.customerNum = customerNum;
    }

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

    public String getTerminalName() {
        return this.terminalName;
    }

    public void setTerminalName(String terminalName) {
        this.terminalName = terminalName;
    }

	public String getChargerNm() {
		return chargerNm;
	}

	public void setChargerNm(String chargerNm) {
		this.chargerNm = chargerNm;
	}

	public String getSubterminalManagenum() {
		return subterminalManagenum;
	}

	public void setSubterminalManagenum(String subterminalManagenum) {
		this.subterminalManagenum = subterminalManagenum;
	}

	public String getManageBizplc() {
		return manageBizplc;
	}

	public void setManageBizplc(String manageBizplc) {
		this.manageBizplc = manageBizplc;
	}

    public BigDecimal getLat() {
        return this.lat;
    }

    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }

    public BigDecimal getLot() {
        return this.lot;
    }

    public void setLot(BigDecimal lot) {
        this.lot = lot;
    }

    public String getLocationDetail() {
        return this.locationDetail;
    }

    public void setLocationDetail(String locationDetail) {
        this.locationDetail = locationDetail;
    }

    public String getLocationPhoto() {
        return this.locationPhoto;
    }

    public void setLocationPhoto(String locationPhoto) {
        this.locationPhoto = locationPhoto;
    }

    public String getPurchaseYear() {
        return this.purchaseYear;
    }

    public void setPurchaseYear(String purchaseYear) {
        this.purchaseYear = purchaseYear;
    }

    public String getStandardCode() {
        return this.standardCode;
    }

    public void setStandardCode(String standardCode) {
        this.standardCode = standardCode;
    }

    public String getSpec() {
        return this.spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public String getTerminalMacAddr() {
        return this.terminalMacAddr;
    }

    public void setTerminalMacAddr(String terminalMacAddr) {
        this.terminalMacAddr = terminalMacAddr;
    }

    public String getTerminalFwInfo() {
        return this.terminalFwInfo;
    }

    public void setTerminalFwInfo(String terminalFwInfo) {
        this.terminalFwInfo = terminalFwInfo;
    }

    public String getTerminalBtryInfo() {
        return this.terminalBtryInfo;
    }

    public void setTerminalBtryInfo(String terminalBtryInfo) {
        this.terminalBtryInfo = terminalBtryInfo;
    }

    public String getGateway1() {
        return this.gateway1;
    }

    public void setGateway1(String gateway1) {
        this.gateway1 = gateway1;
    }

    public String getGateway2() {
        return this.gateway2;
    }

    public void setGateway2(String gateway2) {
        this.gateway2 = gateway2;
    }

    public String getUseYn() {
        return this.useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
}
