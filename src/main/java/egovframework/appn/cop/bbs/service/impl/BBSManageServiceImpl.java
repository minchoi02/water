package egovframework.appn.cop.bbs.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.cop.bbs.service.BBSManageService;
import egovframework.appn.cop.bbs.service.Board;
import egovframework.appn.cop.bbs.service.BoardVO;
import egovframework.com.cmm.service.FileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 게시물 관리를 위한 서비스 구현 클래스
 * @author 공통 서비스 개발팀 한성곤
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
@Service("BBSManageService")
public class BBSManageServiceImpl extends EgovAbstractServiceImpl implements BBSManageService {

    @Resource(name = "BBSManageDAO")
    private BBSManageDAO bbsMngDAO;

    @Resource(name = "FileMngService")
    private FileMngService fileService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name="leaveaTrace") LeaveaTrace leaveaTrace;

    /**
     * 게시물 한 건을 삭제 한다.
     *
     * @see egovframework.let.cop.bbs.BBSManageService.service.EgovBBSManageService#deleteBoardArticle(egovframework.let.cop.bbs.brd.service.Board)
     */
    public void deleteBoardArticle(Board board) throws Exception {
		FileVO fvo = new FileVO();

		fvo.setAtchFileId(board.getAtchFileId());

		board.setNttSj("해당 게시물은 삭제되었습니다.");

		if("Y".equals(board.getReplyAt())) {
			bbsMngDAO.deleteAllComment(board);
			bbsMngDAO.updateDeleteBoardArticle(board);
		} else {
			bbsMngDAO.deleteAllComment(board);
			bbsMngDAO.deleteBoardArticle(board);
		}

		if (!"".equals(fvo.getAtchFileId()) || fvo.getAtchFileId() != null) {
		    fileService.deleteAllFileInf(fvo);
		}
    }

    /**
     * 게시판에 게시물 또는 답변 게시물을 등록 한다.
     *
     * @see egovframework.let.cop.bbs.BBSManageService.service.EgovBBSManageService#insertBoardArticle(egovframework.let.cop.bbs.brd.service.Board)
     */
    public void insertBoardArticle(Board board) throws Exception {
	// SORT_ORDR는 부모글의 소트 오더와 같게, NTT_NO는 순서대로 부여

	if ("Y".equals(board.getReplyAt())) {
	    // 답글인 경우 1. Parnts를 세팅, 2.Parnts의 sortOrdr을 현재글의 sortOrdr로 가져오도록, 3.nttNo는 현재 게시판의 순서대로
	    // replyLc는 부모글의 ReplyLc + 1

	    @SuppressWarnings("unused")
	    long tmpNttId = 0L; // 답글 게시물 ID

	    tmpNttId = bbsMngDAO.replyBoardArticle(board);

	} else {
	    // 답글이 아닌경우 Parnts = 0, replyLc는 = 0, sortOrdr = nttNo(Query에서 처리)
	    board.setParnts("0");
	    board.setReplyLc("0");
	    board.setReplyAt("N");

	    bbsMngDAO.insertBoardArticle(board);
	}
    }

	/**
     * 게시물 대하여 상세 내용을 조회 한다.
     *
     * @see egovframework.let.cop.bbs.BBSManageService.service.EgovBBSManageService#selectBoardArticle(egovframework.let.cop.bbs.brd.service.BoardVO)
     */
    public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception {
		if (boardVO.isPlusCount()) {
		    int iniqireCo = bbsMngDAO.selectMaxInqireCo(boardVO);

		    boardVO.setInqireCo(iniqireCo);
		    bbsMngDAO.updateInqireCo(boardVO);
		}

		return bbsMngDAO.selectBoardArticle(boardVO);
    }

	/**
     * 조건에 맞는 게시물 목록을 조회 한다.
     *
     * @see egovframework.let.cop.bbs.BBSManageService.service.EgovBBSManageService#selectBoardArticles(egovframework.let.cop.bbs.brd.service.BoardVO)
     */
    public Map<String, Object> selectBoardArticles(BoardVO boardVO) throws Exception {
		List<BoardVO> list = bbsMngDAO.selectBoardArticleList(boardVO);
		int cnt = bbsMngDAO.selectBoardArticleListCnt(boardVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
    }

    /**
     * 게시물 한 건의 내용을 수정 한다.
     *
     * @see egovframework.let.cop.bbs.BBSManageService.service.EgovBBSManageService#updateBoardArticle(egovframework.let.cop.bbs.brd.service.Board)
     */
    public void updateBoardArticle(Board board) throws Exception {
			bbsMngDAO.updateBoardArticle(board);
    }

    /**
     * 방명록 내용을 삭제 한다.
     *
     * @see egovframework.let.cop.bbs.BBSManageService.service.EgovBBSManageService#deleteGuestList(egovframework.let.cop.bbs.brd.service.BoardVO)
     */
    public void deleteGuestList(BoardVO boardVO) throws Exception {
	bbsMngDAO.deleteGuestList(boardVO);
    }

    /**
     * 방명록에 대한 목록을 조회 한다.
     *
     * @see egovframework.let.cop.bbs.BBSManageService.service.EgovBBSManageService#selectGuestList(egovframework.let.cop.bbs.brd.service.BoardVO)
     */
    public Map<String, Object> selectGuestList(BoardVO boardVO) throws Exception {
	List<BoardVO> result = bbsMngDAO.selectGuestList(boardVO);
	int cnt = bbsMngDAO.selectGuestListCnt(boardVO);

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 방명록에 대한 패스워드를 조회 한다.
     *
     * @param board
     * @return
     * @throws Exception
     */
    public String getPasswordInf(Board board) throws Exception {
	return bbsMngDAO.getPasswordInf(board);
    }


	/**
     * 메인화면용 게시물 목록을 조회 한다.
     *
     * @see egovframework.let.cop.bbs.BBSManageService.service.EgovBBSManageService#selectBoardArticles(egovframework.let.cop.bbs.brd.service.BoardVO)
     */
    public List<BoardVO> selectBoardArticlesForMain(BoardVO boardVO) throws Exception {

		return bbsMngDAO.selectBoardArticleListForMain(boardVO);
    }
    public void deleteAllComment(Board Board) throws Exception {
    	bbsMngDAO.deleteAllComment(Board);
    }


}
