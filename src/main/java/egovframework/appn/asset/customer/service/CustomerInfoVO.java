package egovframework.appn.asset.customer.service;

import java.math.BigDecimal;

/**
 * @Class Name : CustomerInfoVO.java
 * @Description : CustomerInfo VO class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */
public class CustomerInfoVO extends CustomerInfoDefaultVO{
    private static final long serialVersionUID = 1L;

    /** customer_code */
    private String customerNum;

    /** customer_name */
    private String customerName;

    /** customer_building_name */
    private String customerBuildingName;

    private String manageBizplc;

    /** lat */
    private BigDecimal lat;

    /** lot */
    private BigDecimal lot;

    /** zip */
    private String zip;

    /** road_name_addr */
    private String roadNameAddr;

    /** lot_number_addr */
    private String lotNumberAddr;

    /** detail_addr */
    private String detailAddr;

    /** use_yn */
    private String useYn;

    private String chargerNm;


    public String getcustomerNum() {
        return this.customerNum;
    }

    public void setcustomerNum(String customerNum) {
        this.customerNum = customerNum;
    }

    public String getCustomerName() {
        return this.customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerBuildingName() {
        return this.customerBuildingName;
    }

    public void setCustomerBuildingName(String customerBuildingName) {
        this.customerBuildingName = customerBuildingName;
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

    public String getZip() {
        return this.zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getRoadNameAddr() {
        return this.roadNameAddr;
    }

    public void setRoadNameAddr(String roadNameAddr) {
        this.roadNameAddr = roadNameAddr;
    }

    public String getLotNumberAddr() {
        return this.lotNumberAddr;
    }

    public void setLotNumberAddr(String lotNumberAddr) {
        this.lotNumberAddr = lotNumberAddr;
    }

    public String getDetailAddr() {
        return this.detailAddr;
    }

    public void setDetailAddr(String detailAddr) {
        this.detailAddr = detailAddr;
    }

    public String getUseYn() {
        return this.useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

	public String getChargerNm() {
		return chargerNm;
	}

	public void setChargerNm(String chargerNm) {
		this.chargerNm = chargerNm;
	}

}
