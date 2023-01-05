package egovframework.appn.sys.link.llm.service.impl;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.appn.sys.link.llm.service.LinkVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * 게시물 관리를 위한 데이터 접근 클래스
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009.03.19
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.19  이삼섭          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Repository("LinkListDAO")
public class LinkListManageDAO extends EgovAbstractDAO {

    /**
     * 연계건물에 대하여 상세 내용을 조회 한다.
     *
     * @param LinkVO
     * @return
     * @throws Exception
     */
    public List<?> selectLink(LinkVO linkVO) throws Exception {
    	return list("ListLink.selectLink", linkVO);
    }

    /**
     * 연계관리 총갯수를 조회한다.
     * @param LinkVO 검색조건
     * @return int 업무사용자 총갯수
     */
    public int selectLinkListTotCnt(LinkVO linkVO) {
        return (Integer)select("ListLink.selectLinkListTotCnt", linkVO);
    }
    /**
     * 연계관리 정보를 상세조회한다.
     * @param LinkVO 검색조건
     * @return LinkVO 연계관리 상세정보
     */

    public LinkVO selectLinkListDetail(LinkVO linkVO){
        return (LinkVO) select("ListLink.selectLinkDetail", linkVO);
    }
    /**
     * 연계관리에 대하여 상세 내용을 등록 한다.
     *
     * @param LinkVO
     * @return
     * @throws Exception
     */
    public String insertLinkManage(LinkVO linkVO)  {
    	return (String)insert("ListLink.insertLinkManage", linkVO);
    }

    /**
     * 연계관리에 대하여 정보를  삭제 한다.
     *
     * @param board
     * @throws Exception
     */
    public void deleteLinkList(LinkVO linkVO) throws Exception {
    	delete("ListLink.deleteLinkManage", linkVO);
    }

	public void updateLinkList(LinkVO linkVO) throws Exception {
		update("ListLink.updateLinkManage", linkVO);
	}

}
