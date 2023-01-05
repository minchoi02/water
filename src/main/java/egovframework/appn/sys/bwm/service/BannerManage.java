package egovframework.appn.sys.bwm.service;

import egovframework.com.cmm.ComDefaultVO;

/**
 * 개요
 * - 배너창에 대한 model 클래스를 정의한다.
 *
 * 상세내용
 * - 배너창의 배너창아이디, 배너창 타이틀명, 실파일 URL, 파업창이 화면에 보여지는 위치정보, 배너창의 사이즈, 게시시작일, 게시종료일,
 * 그만보기 설정 여부, 게시여부 항목을 관리한다.
 * @author 이창원
 * @version 1.0
 * @created 05-8-2009 오후 2:21:03
 */
public class BannerManage extends ComDefaultVO {

	private static final long serialVersionUID = -9172690166674188881L;
	/**
	 * 배너창아이디
	 */
	private String bannerId;
	/**
	 * 배너창 타이틀명
	 */
	private String bannerTitleNm;
	/**
	 * 실파일 URL
	 */
	private String fileUrl;
	/**
	 * 배너창이 화면에 보여지는 가로 위치정보
	 */
	private String bannerWlc;

        /**
         * 배너창이 화면에 보여지는 세로 위치정보
         */
        private String bannerHlc;

	/**
	 * 배너창의 높이
	 */
	private String bannerHSize;

        /**
         * 배너창의 넚이
         */
        private String bannerWSize;

	/**
	 * 게시시작일
	 */
	private String ntceBgnde;
	/**
	 * 게시종료일
	 */
	private String ntceEndde;

	/** 게시시작일(시간) */
        private String ntceBgndeHH;

        /** 게시시작일(분) */
        private String ntceBgndeMM;

        /** 게시종료일(시간) */
        private String ntceEnddeHH;

        /** 게시종료일(분) */
        private String ntceEnddeMM;

	/**
	 * 그만보기 설정 여부
	 */
	private String stopVewAt;
	/**
	 * 게시여부
	 */
	private String ntceAt;

	/** 최초등록시점 */
	private String frstRegisterPnttm;

	/** 최초등록아이디 */
	private String frstRegisterId;

	/** 최종수정일 */
	private String lastUpdusrPnttm;

	/** 최종수정자 아이디 */
	private String lastUpdusrId;

	private String atchFileId;

	private String fileSn;

	private String bannerDc;




	public String getBannerDc() {
		return bannerDc;
	}

	public void setBannerDc(String bannerDc) {
		this.bannerDc = bannerDc;
	}

	public String getFileSn() {
		return fileSn;
	}

	public void setFileSn(String fileSn) {
		this.fileSn = fileSn;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public BannerManage(){}

    /**
     * bannerId 리턴
     *
     * @return the bannerId
     */
    public String getBannerId() {
        return bannerId;
    }

    /**
     * bannerId 설정
     *
     * @param bannerId the bannerId to set
     */
    public void setBannerId(String bannerId) {
        this.bannerId = bannerId;
    }

    /**
     * bannerTitleNm 리턴
     *
     * @return the bannerTitleNm
     */
    public String getBannerTitleNm() {
        return bannerTitleNm;
    }

    /**
     * bannerTitleNm 설정
     *
     * @param bannerTitleNm the bannerTitleNm to set
     */
    public void setBannerTitleNm(String bannerTitleNm) {
        this.bannerTitleNm = bannerTitleNm;
    }

    /**
     * fileUrl 리턴
     *
     * @return the fileUrl
     */
    public String getFileUrl() {
        return fileUrl;
    }

    /**
     * fileUrl 설정
     *
     * @param fileUrl the fileUrl to set
     */
    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    /**
     * bannerWlc 리턴
     *
     * @return the bannerWlc
     */
    public String getBannerWlc() {
        return bannerWlc;
    }

    /**
     * bannerWlc 설정
     *
     * @param bannerWlc the bannerWlc to set
     */
    public void setBannerWlc(String bannerWlc) {
        this.bannerWlc = bannerWlc;
    }

    /**
     * bannerHlc 리턴
     *
     * @return the bannerHlc
     */
    public String getBannerHlc() {
        return bannerHlc;
    }

    /**
     * bannerHlc 설정
     *
     * @param bannerHlc the bannerHlc to set
     */
    public void setBannerHlc(String bannerHlc) {
        this.bannerHlc = bannerHlc;
    }

    /**
     * bannerHSize 리턴
     *
     * @return the bannerHSize
     */
    public String getBannerHSize() {
        return bannerHSize;
    }

    /**
     * bannerHSize 설정
     *
     * @param bannerHSize the bannerHSize to set
     */
    public void setBannerHSize(String bannerHSize) {
        this.bannerHSize = bannerHSize;
    }

    /**
     * bannerWSize 리턴
     *
     * @return the bannerWSize
     */
    public String getBannerWSize() {
        return bannerWSize;
    }

    /**
     * bannerWSize 설정
     *
     * @param bannerWSize the bannerWSize to set
     */
    public void setBannerWSize(String bannerWSize) {
        this.bannerWSize = bannerWSize;
    }

    /**
     * ntceBgnde 리턴
     *
     * @return the ntceBgnde
     */
    public String getNtceBgnde() {
        return ntceBgnde;
    }

    /**
     * ntceBgnde 설정
     *
     * @param ntceBgnde the ntceBgnde to set
     */
    public void setNtceBgnde(String ntceBgnde) {
        this.ntceBgnde = ntceBgnde;
    }

    /**
     * ntceEndde 리턴
     *
     * @return the ntceEndde
     */
    public String getNtceEndde() {
        return ntceEndde;
    }

    /**
     * ntceEndde 설정
     *
     * @param ntceEndde the ntceEndde to set
     */
    public void setNtceEndde(String ntceEndde) {
        this.ntceEndde = ntceEndde;
    }

    /**
     * ntceBgndeHH 리턴
     *
     * @return the ntceBgndeHH
     */
    public String getNtceBgndeHH() {
        return ntceBgndeHH;
    }

    /**
     * ntceBgndeHH 설정
     *
     * @param ntceBgndeHH the ntceBgndeHH to set
     */
    public void setNtceBgndeHH(String ntceBgndeHH) {
        this.ntceBgndeHH = ntceBgndeHH;
    }

    /**
     * ntceBgndeMM 리턴
     *
     * @return the ntceBgndeMM
     */
    public String getNtceBgndeMM() {
        return ntceBgndeMM;
    }

    /**
     * ntceBgndeMM 설정
     *
     * @param ntceBgndeMM the ntceBgndeMM to set
     */
    public void setNtceBgndeMM(String ntceBgndeMM) {
        this.ntceBgndeMM = ntceBgndeMM;
    }

    /**
     * ntceEnddeHH 리턴
     *
     * @return the ntceEnddeHH
     */
    public String getNtceEnddeHH() {
        return ntceEnddeHH;
    }

    /**
     * ntceEnddeHH 설정
     *
     * @param ntceEnddeHH the ntceEnddeHH to set
     */
    public void setNtceEnddeHH(String ntceEnddeHH) {
        this.ntceEnddeHH = ntceEnddeHH;
    }

    /**
     * ntceEnddeMM 리턴
     *
     * @return the ntceEnddeMM
     */
    public String getNtceEnddeMM() {
        return ntceEnddeMM;
    }

    /**
     * ntceEnddeMM 설정
     *
     * @param ntceEnddeMM the ntceEnddeMM to set
     */
    public void setNtceEnddeMM(String ntceEnddeMM) {
        this.ntceEnddeMM = ntceEnddeMM;
    }

    /**
     * stopVewAt 리턴
     *
     * @return the stopVewAt
     */
    public String getStopVewAt() {
        return stopVewAt;
    }

    /**
     * stopVewAt 설정
     *
     * @param stopVewAt the stopVewAt to set
     */
    public void setStopVewAt(String stopVewAt) {
        this.stopVewAt = stopVewAt;
    }

    /**
     * ntceAt 리턴
     *
     * @return the ntceAt
     */
    public String getNtceAt() {
        return ntceAt;
    }

    /**
     * ntceAt 설정
     *
     * @param ntceAt the ntceAt to set
     */
    public void setNtceAt(String ntceAt) {
        this.ntceAt = ntceAt;
    }

    /**
     * frstRegisterPnttm 리턴
     *
     * @return the frstRegisterPnttm
     */
    public String getFrstRegisterPnttm() {
        return frstRegisterPnttm;
    }

    /**
     * frstRegisterPnttm 설정
     *
     * @param frstRegisterPnttm the frstRegisterPnttm to set
     */
    public void setFrstRegisterPnttm(String frstRegisterPnttm) {
        this.frstRegisterPnttm = frstRegisterPnttm;
    }

    /**
     * frstRegisterId 리턴
     *
     * @return the frstRegisterId
     */
    public String getFrstRegisterId() {
        return frstRegisterId;
    }

    /**
     * frstRegisterId 설정
     *
     * @param frstRegisterId the frstRegisterId to set
     */
    public void setFrstRegisterId(String frstRegisterId) {
        this.frstRegisterId = frstRegisterId;
    }

    /**
     * lastUpdusrPnttm 리턴
     *
     * @return the lastUpdusrPnttm
     */
    public String getLastUpdusrPnttm() {
        return lastUpdusrPnttm;
    }

    /**
     * lastUpdusrPnttm 설정
     *
     * @param lastUpdusrPnttm the lastUpdusrPnttm to set
     */
    public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
        this.lastUpdusrPnttm = lastUpdusrPnttm;
    }

    /**
     * lastUpdusrId 리턴
     *
     * @return the lastUpdusrId
     */
    public String getLastUpdusrId() {
        return lastUpdusrId;
    }

    /**
     * lastUpdusrId 설정
     *
     * @param lastUpdusrId the lastUpdusrId to set
     */
    public void setLastUpdusrId(String lastUpdusrId) {
        this.lastUpdusrId = lastUpdusrId;
    }




}