package egovframework.appn.sys.bwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.sys.bwm.service.BannerManageService;
import egovframework.appn.sys.bwm.service.BannerManageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 개요
 * - 배너창에 대한 ServiceImpl을 정의한다.
 *
 * 상세내용
 * - 배너창에 대한 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 배너창의 조회기능은 목록조회, 상세조회로, 사용자화면 보기로 구분된다.
 * @author 이창원
 * @version 1.0
 * @created 05-8-2009 오후 2:19:58
 */

@Service("bannerManageService")
public class BannerManageServiceImpl extends EgovAbstractServiceImpl implements BannerManageService {

	@Resource(name = "bannerManageDAO")
	public BannerManageDAO dao;

	@Resource(name = "egovBannerIdGnrService")
	private EgovIdGnrService egovBannerIdGnrService;

	public BannerManageServiceImpl() {
	}

	/**
	 * 기 등록된 배너창정보를 삭제한다.
	 * @param bannerManage - 배너창 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param bannerManage
	 */
	@Override
	public void deleteBanner(BannerManageVO bannerManageVO) throws Exception {
		dao.deleteBanner(bannerManageVO);
	}

	/**
	 * 배너창정보를 신규로 등록한다.
	 * @param bannerManage - 배너창 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param bannerManage
	 */
	@Override
	public void insertBanner(BannerManageVO bannerManageVO) throws Exception {
		String sMakeId = egovBannerIdGnrService.getNextStringId();
		bannerManageVO.setBannerId(sMakeId);
		dao.insertBanner(bannerManageVO);
	}

	/**
	 * 기 등록된 배너창정보를 수정한다.
	 * @param bannerManage - 배너창 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param bannerManage
	 */
	@Override
	public void updateBanner(BannerManageVO bannerManageVO) throws Exception {
		dao.updateBanner(bannerManageVO);
	}

	/**
	 * 배너창을 사용자 화면에서 볼수 있는 정보들을 조회한다.
	 * @param bannerManageVO - 배너창 Vo
	 * @return bannerManageVO - 배너창 Vo
	 *
	 * @param bannerManageVO
	 */
	@Override
	public BannerManageVO selectBanner(BannerManageVO bannerManageVO) throws Exception {
		return dao.selectBanner(bannerManageVO);
	}

	/**
	 * 배너창의 취약점을 관리하기 위해 등록된 배너창 화이트리스트를 조회한다.
	 * @param bannerManageVO - 배너창 Vo
	 * @return List - 배너창 목록
	 *
	 * @param bannerManageVO
	 */
	@Override
	public List<?> selectBannerWhiteList() throws Exception {
		return dao.selectBannerWhiteList();
	}

	/**
	 * 배너창를 관리하기 위해 등록된 배너창목록을 조회한다.
	 * @param bannerManageVO - 배너창 Vo
	 * @return List - 배너창 목록
	 *
	 * @param bannerManageVO
	 */
	@Override
	public List<BannerManageVO> selectBannerList(BannerManageVO bannerManageVO) throws Exception {
		return dao.selectBannerList(bannerManageVO);
	}

	/**
	 * 배너창를 관리하기 위해 등록된 배너창목록을 조회한다.
	 * @param bannerManageVO - 배너창 Vo
	 * @return List - 배너창 목록
	 *
	 * @param bannerManageVO
	 */
	@Override
	public int selectBannerListCount(BannerManageVO bannerManageVO) throws Exception {
		return dao.selectBannerListCount(bannerManageVO);
	}

	/**
	 * 배너창를 사용하기위해 위해 등록된 배너창목록을 조회한다.
	 * @param bannerManageVO - 배너창 Vo
	 * @return List - 배너창 목록
	 *
	 * @param bannerManageVO
	 */
	@Override
	public List<BannerManageVO> selectBannerMainList(BannerManageVO bannerManageVO) throws Exception {
		return dao.selectBannerMainList(bannerManageVO);
	}

}