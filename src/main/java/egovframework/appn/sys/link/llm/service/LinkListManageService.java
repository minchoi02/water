package egovframework.appn.sys.link.llm.service;

import java.util.List;

/**
 * 게시물 관리를 위한 서비스 인터페이스  클래스
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
public interface LinkListManageService {

	/**
	 * 연계관리 대하여 상세 내용을 조회 한다.
	 * @return
	 * @param LinkVO
	 * @exception Exception Exception
	 */
	public List<?> selectLink(LinkVO linkVO)
	  throws Exception;


	/**
	 * 연계관리 대하여 총 갯수를 확인한다.
	 * @return
	 * @param LinkVO
	 * @exception Exception Exception
	 */
	public int selectLinkListTotCnt(LinkVO linkhVO) throws Exception;

	/**
	 * 연계관리 대하여 상세 내용을 조회 한다.
	 * @return
	 * @param LinkVO
	 * @exception Exception Exception
	 */
	public LinkVO selectLinkListDetail(LinkVO linkhVO) throws Exception;

	/**
	 * 연계관리 대하여 상세 내용을 등록 한다.
	 * @return
	 * @param LinkVO
	 * @exception Exception Exception
	 */
	public String insertLinkManage(LinkVO linkVO) throws Exception;

	/**
	 * 연계관리 대하여 상세 내용을 삭제 한다.
	 * @param LinkVO
	 * @throws Exception
	 */
	public void deleteLinkList(LinkVO linkVO) throws Exception;


	public void updateLinkList(LinkVO linkVO) throws Exception;





}