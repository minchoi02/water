package egovframework.appn.sys.bwm.service;

import java.util.List;

/**
 * 개요
 * - 팝업창에 대한 Vo 클래스를 정의한다.
 *
 * 상세내용
 * - 팝업창의 목록 항목을 관리한다.
 * @author 이창원
 * @version 1.0
 * @created 05-8-2009 오후 2:21:04
 */
public class BannerManageVO extends BannerManage {

	private static final long serialVersionUID = -4822974866080666897L;

	List <BannerManageVO> bannerManageList;

	public List<BannerManageVO> getBannerManageList() {
		return bannerManageList;
	}

	public void setBannerManageList(List<BannerManageVO> bannerManageList) {
		this.bannerManageList = bannerManageList;
	}


}