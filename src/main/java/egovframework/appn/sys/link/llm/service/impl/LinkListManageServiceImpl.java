package egovframework.appn.sys.link.llm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.sys.link.llm.service.LinkListManageService;
import egovframework.appn.sys.link.llm.service.LinkVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("linkService")
public class LinkListManageServiceImpl extends EgovAbstractServiceImpl implements LinkListManageService{

    @Resource(name = "LinkListDAO")
    private LinkListManageDAO LinkListDAO;

	/**
     * 연계관리에 대하여 내용을 조회 한다.
     *
     */
    @Override
    public List<?> selectLink(LinkVO linkVO) throws Exception {

		return LinkListDAO.selectLink(linkVO);
    }
	/**
     * 연계관리 총 갯수를 조회한다.
     *
     */
	@Override
	public int selectLinkListTotCnt(LinkVO linkVO) {
		return LinkListDAO.selectLinkListTotCnt(linkVO);
	}
	/**
     * 연계관리 상세내용을 조회한다.
     *
     */
	@Override
	public LinkVO selectLinkListDetail(LinkVO linkVO) {
		return LinkListDAO.selectLinkListDetail(linkVO);
	}
	/**
     * 연계관리 내용을 등록 한다.
     *
     */
    @Override
    public String insertLinkManage(LinkVO linkVO) {
    	return LinkListDAO.insertLinkManage(linkVO);
    }


	/**
	 * 연계관리 대하여 상세 내용을 삭제 한다.
	 * @param LinkVO
	 * @throws Exception
	 */
    @Override
	public void deleteLinkList(LinkVO linkVO) throws Exception {
    	LinkListDAO.deleteLinkList(linkVO);
    }

    @Override
	public void updateLinkList(LinkVO linkVO) throws Exception {
    	LinkListDAO.updateLinkList(linkVO);
    }
}
