package egovframework.appn.asset.meter.service;

import java.math.BigDecimal;

/**
 * @Class Name : MeterInfoVO.java
 * @Description : MeterInfo VO class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */
public class MeterInfoVO extends MeterInfoDefaultVO{
    private static final long serialVersionUID = 1L;

    /** meter_managenum */
    private String meterManagenum;

    /** customer_code */
    private String customerNum;

    private String customerName;

    /** meter_name */
    private String meterName;

    private String chargerNm;

    private String submeterManagenum;

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

    /** use_yn */
    private String useYn;


    public String getMeterManagenum() {
        return this.meterManagenum;
    }

    public void setMeterManagenum(String meterManagenum) {
        this.meterManagenum = meterManagenum;
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

    public String getMeterName() {
        return this.meterName;
    }

    public void setMeterName(String meterName) {
        this.meterName = meterName;
    }

	public String getChargerNm() {
		return chargerNm;
	}

	public void setChargerNm(String chargerNm) {
		this.chargerNm = chargerNm;
	}

	public String getSubmeterManagenum() {
		return submeterManagenum;
	}

	public void setSubmeterManagenum(String submeterManagenum) {
		this.submeterManagenum = submeterManagenum;
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

    public String getUseYn() {
        return this.useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

}
