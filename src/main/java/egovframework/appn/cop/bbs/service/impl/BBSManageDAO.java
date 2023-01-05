package egovframework.appn.cop.bbs.service.impl;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.appn.cop.bbs.service.Board;
import egovframework.appn.cop.bbs.service.BoardVO;
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
@Repository("BBSManageDAO")
public class BBSManageDAO extends EgovAbstractDAO {

    /**
     * 게시판에 게시물을 등록 한다.
     *
     * @param board
     * @throws Exception
     */
    public void insertBoardArticle(Board board) throws Exception {
	long nttId = (Long)select("BBSManage.selectMaxNttId");
	board.setNttId(nttId);

	insert("BBSManage.insertBoardArticle", board);
    }

    /**
     * 게시판에 답변 게시물을 등록 한다.
     *
     * @param board
     * @throws Exception
     */
    public long replyBoardArticle(Board board) throws Exception {
		long nttId = (Long)select("BBSManage.selectMaxNttId");
		board.setNttId(nttId);

		insert("BBSManage.replyBoardArticle", board);

		//----------------------------------------------------------
		// 현재 글 이후 게시물에 대한 NTT_NO를 증가 (정렬을 추가하기 위해)
		//----------------------------------------------------------
		//String parentId = board.getParnts();
		long nttNo = (Long)select("BBSManage.getParentNttNo", board);

		board.setNttNo(nttNo);
		update("BBSManage.updateOtherNttNo", board);

		board.setNttNo(nttNo + 1);
		update("BBSManage.updateNttNo", board);

	return nttId;
    }

    /**
     * 게시물 한 건에 대하여 상세 내용을 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception {
    	return (BoardVO)select("BBSManage.selectBoardArticle", boardVO);
    }

    /**
     * 조건에 맞는 게시물 목록을 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectBoardArticleList(BoardVO boardVO) throws Exception {
    	return (List<BoardVO>) list("BBSManage.selectBoardArticleList", boardVO);
    }

    /**
     * 조건에 맞는 게시물 목록에 대한 전체 건수를 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectBoardArticleListCnt(BoardVO boardVO) throws Exception {
    	return (Integer)select("BBSManage.selectBoardArticleListCnt", boardVO);
    }

    /**
     * 게시물 한 건의 내용을 수정 한다.
     *
     * @param board
     * @throws Exception
     */
    public void updateBoardArticle(Board board) throws Exception {
    	update("BBSManage.updateBoardArticle", board);
    }

    /**
     * 게시물 한 건을 삭제 한다.
     *
     * @param board
     * @throws Exception
     */
    public void updateDeleteBoardArticle(Board board) throws Exception {
    	update("BBSManage.updateDeleteBoardArticle", board);
    }

    /**
     * 게시물 한 건을 삭제 한다.
     *
     * @param board
     * @throws Exception
     */
    public void deleteBoardArticle(Board board) throws Exception {
    	delete("BBSManage.deleteBoardArticle", board);
    }

    /**
     * 게시물에 대한 조회 건수를 수정 한다.
     *
     * @param board
     * @throws Exception
     */
    public void updateInqireCo(BoardVO boardVO) throws Exception {
    	update("BBSManage.updateInqireCo", boardVO);
    }

    /**
     * 게시물에 대한 현재 조회 건수를 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectMaxInqireCo(BoardVO boardVO) throws Exception {
    	return (Integer)select("BBSManage.selectMaxInqireCo", boardVO);
    }

    /**
     * 게시판에 대한 목록을 정렬 순서로 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectNoticeListForSort(Board board) throws Exception {
	return (List<BoardVO>) list("BBSManage.selectNoticeListForSort", board);
    }

    /**
     * 게사판에 대한 정렬 순서를 수정 한다.
     *
     * @param sortList
     * @throws Exception
     */
    public void updateSortOrder(List<BoardVO> sortList) throws Exception {
	BoardVO vo;
	Iterator<BoardVO> iter = sortList.iterator();
	while (iter.hasNext()) {
	    vo = (BoardVO)iter.next();
	    update("BBSManage.updateSortOrder", vo);
	}
    }

    /**
     * 게시판에 대한 현재 게시물 번호의 최대값을 구한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public long selectNoticeItemForSort(Board board) throws Exception {
	return (Long)select("BBSManage.selectNoticeItemForSort", board);
    }

    /**
     * 방명록에 대한 목록을 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectGuestList(BoardVO boardVO) throws Exception {
	return (List<BoardVO>) list("BBSManage.selectGuestList", boardVO);
    }

    /**
     * 방명록에 대한 목록 건수를 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectGuestListCnt(BoardVO boardVO) throws Exception {
	return (Integer)select("BBSManage.selectGuestListCnt", boardVO);
    }

    /**
     * 방명록 내용을 삭제 한다.
     *
     * @param boardVO
     * @throws Exception
     */
    public void deleteGuestList(BoardVO boardVO) throws Exception {
	update("BBSManage.deleteGuestList", boardVO);
    }

    /**
     * 방명록에 대한 패스워드를 조회 한다.
     *
     * @param board
     * @return
     * @throws Exception
     */
    public String getPasswordInf(Board board) throws Exception {
	return (String)select("BBSManage.getPasswordInf", board);
    }


    /**
     * 메인화면용 게시물 목록을 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectBoardArticleListForMain(BoardVO boardVO) throws Exception {
    	return (List<BoardVO>) list("BBSManage.selectBoardArticleListForMain", boardVO);
    }
    public void deleteAllComment(Board board) throws Exception {
	update("BBSManage.deleteAllComment", board);
    }
}
