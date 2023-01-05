package egovframework.appn.sys.menu.plm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.appn.sys.menu.plm.service.AuthorVO;
import egovframework.appn.sys.menu.plm.service.ProgrmManageDtlVO;
import egovframework.appn.sys.menu.plm.service.ProgrmManageVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * 프로그램 목록관리및 프로그램변경관리에 대한 DAO 클래스를 정의한다.
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */

@Repository("progrmManageDAO")
public class ProgrmManageDAO extends EgovAbstractDAO {

	/**
	 * 프로그램 목록을 조회
	 * @param vo ComDefaultVO
	 * @return List
	 * @exception Exception
	 */
	public List<?> selectProgrmList(ComDefaultVO vo) throws Exception{
		return list("progrmManage.selectProgrmList", vo);
	}

    /**
	 * 프로그램목록 총건수를 조회한다.
	 * @param vo ComDefaultVO
	 * @return int
	 * @exception Exception
	 */
    public int selectProgrmListTotCnt(ComDefaultVO vo) {
        return (Integer)select("progrmManage.selectProgrmListTotCnt_S", vo);
    }

	/**
	 * 프로그램 기본정보를 조회
	 * @param vo ComDefaultVO
	 * @return ProgrmManageVO
	 * @exception Exception
	 */
	public ProgrmManageVO selectProgrm(String progrmNm)throws Exception{
		return (ProgrmManageVO)select("progrmManage.selectProgrm", progrmNm);
	}

	/**
	 * 프로그램 기본정보 및 URL을 등록
	 * @param vo ProgrmManageVO
	 * @exception Exception
	 */
	public void insertProgrm(ProgrmManageVO vo){
		insert("progrmManage.insertProgrm", vo);
	}

	/**
	 * 프로그램 기본정보 및 URL을 수정
	 * @param vo ProgrmManageVO
	 * @exception Exception
	 */
	public void updateProgrm(ProgrmManageVO vo){
		update("progrmManage.updateProgrm", vo);
	}

	/**
	 * 프로그램 기본정보 및 URL을 삭제
	 * @param vo ProgrmManageVO
	 * @exception Exception
	 */
	public void deleteProgrm(ProgrmManageVO vo){
		delete("progrmManage.deleteProgrm", vo);
	}

	/**
	 * 프로그램 파일 존재여부를 조회
	 * @param vo ProgrmManageVO
	 * @return int
	 * @exception Exception
	 */
	public int selectProgrmNMTotCnt(ComDefaultVO vo) throws Exception{
		return (Integer)select("progrmManage.selectProgrmNMTotCnt", vo);
	}


	/**
	 * 프로그램변경요청 목록을 조회
	 * @param vo ComDefaultVO
	 * @return List
	 * @exception Exception
	 */

	public List<?> selectProgrmChangeRequstList(ComDefaultVO vo) throws Exception{
		return list("progrmManage.selectProgrmChangeRequstList", vo);
	}

    /**
	 * 프로그램변경요청 총건수를 조회한다.
	 * @param vo ComDefaultVO
	 * @return  int
	 * @exception Exception
	 */
    public int selectProgrmChangeRequstListTotCnt(ComDefaultVO vo) {
        return (Integer)select("progrmManage.selectProgrmChangeRequstListTotCnt", vo);
    }

	/**
	 * 프로그램변경요청 정보를 조회
	 * @param vo ProgrmManageDtlVO
	 * @return ProgrmManageDtlVO
	 * @exception Exception
	 */
	public ProgrmManageDtlVO selectProgrmChangeRequst(ProgrmManageDtlVO vo)throws Exception{
		return (ProgrmManageDtlVO)select("progrmManage.selectProgrmChangeRequst", vo);
	}

	/**
	 * 프로그램변경요청을 등록
	 * @param vo ProgrmManageDtlVO
	 * @exception Exception
	 */
	public void insertProgrmChangeRequst(ProgrmManageDtlVO vo){
		insert("progrmManage.insertProgrmChangeRequst", vo);
	}

	/**
	 * 프로그램변경요청을 수정
	 * @param vo ProgrmManageDtlVO
	 * @exception Exception
	 */
	public void updateProgrmChangeRequst(ProgrmManageDtlVO vo){
		update("progrmManage.updateProgrmChangeRequst", vo);
	}

	/**
	 * 프로그램변경요청을 삭제
	 * @param vo ProgrmManageDtlVO
	 * @exception Exception
	 */
	public void deleteProgrmChangeRequst(ProgrmManageDtlVO vo){
		delete("progrmManage.deleteProgrmChangeRequst", vo);
	}

	/**
	 * 프로그램변경요청 요청번호MAX 정보를 조회
	 * @param vo ProgrmManageDtlVO
	 * @return ProgrmManageDtlVO
	 * @exception Exception
	 */
	public ProgrmManageDtlVO selectProgrmChangeRequstNo(ProgrmManageDtlVO vo){
		return (ProgrmManageDtlVO)select("progrmManage.selectProgrmChangeRequstNo", vo);
	}

	/**
	 * 프로그램변경요청 목록을 조회
	 * @param vo ComDefaultVO
	 * @return List
	 * @exception Exception
	 */
	public List<?> selectChangeRequstProcessList(ComDefaultVO vo) throws Exception{
		return list("progrmManage.selectChangeRequstProcessList", vo);
	}

    /**
	 * 프로그램변경요청 총건수를 조회한다.
	 * @param vo ComDefaultVO
	 * @return int
	 * @exception Exception
	 */
    public int selectChangeRequstListProcessTotCnt(ComDefaultVO vo) {
        return (Integer)select("progrmManage.selectChangeRequstProcessListTotCnt", vo);
    }

	/**
	 * 프로그램변경요청 처리 수정
	 * @param vo ProgrmManageDtlVO
	 * @exception Exception
	 */
	public void updateProgrmChangeRequstProcess(ProgrmManageDtlVO vo){
		update("progrmManage.updateProgrmChangeRequstProcess", vo);
	}


	/**
	 * 프로그램목록 전체삭제 초기화
	 * @return boolean
	 * @exception Exception
	 */
	public boolean deleteAllProgrm(){
		ProgrmManageVO vo = new ProgrmManageVO();
		update("progrmManage.deleteAllProgrm", vo);
		return true;
	}

	/**
	 * 프로그램변경내역 전체삭제 초기화
	 * @return boolean
	 * @exception Exception
	 */
	public boolean deleteAllProgrmDtls(){
		ProgrmManageDtlVO vo = new ProgrmManageDtlVO();
		update("progrmManage.deleteAllProgrmDtls", vo);
		return true;
	}

    /**
	 * 프로그램목록 데이타 존재여부 조회한다.
	 * @return int
	 * @exception Exception
	 */
    public int selectProgrmListTotCnt() {
    	ProgrmManageVO vo = new ProgrmManageVO();
        return (Integer)select("progrmManage.selectProgrmListTotCnt", vo);
    }

	/**
	 * 프로그램변경요청자 Email 정보를 조회
	 * @param vo ProgrmManageDtlVO
	 * @return ProgrmManageDtlVO
	 * @exception Exception
	 */
	public ProgrmManageDtlVO selectRqesterEmail(ProgrmManageDtlVO vo){
		return (ProgrmManageDtlVO)select("progrmManage.selectRqesterEmail", vo);
	}
	public List<?> selectTreeCodeList(AuthorVO vo) throws Exception{
		return list("progrmManage.selectTreeCodeList",vo);
	}
	public List<?> selectAuthorTreeList(AuthorVO vo) throws Exception{
		return list("progrmManage.selectAuthorTreeList",vo);
	}
	public List<?> selectAuthorList() throws Exception{
		return list("progrmManage.selectAuthorList");
	}

	public void updateTreeCode(AuthorVO vo){
		update("progrmManage.updateDeptTree", vo);
	}
	public void deleteTreeCode(AuthorVO vo){
		delete("progrmManage.deleteTreeCode",vo);
	}
	public void insertTreeCode(AuthorVO vo){
		insert("progrmManage.insertTreeCode",vo);
	}
}