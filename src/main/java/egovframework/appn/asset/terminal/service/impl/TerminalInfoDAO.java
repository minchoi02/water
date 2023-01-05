package egovframework.appn.asset.terminal.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.appn.asset.terminal.service.TerminalInfoVO;
import egovframework.appn.asset.terminal.service.TerminalInfoDefaultVO;

/**
 * @Class Name : TerminalInfoDAO.java
 * @Description : TerminalInfo DAO Class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */

@Repository("terminalInfoDAO")
public class TerminalInfoDAO extends EgovAbstractDAO {

	/**
	 * terminal_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TerminalInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTerminalInfo(TerminalInfoVO vo) throws Exception {
        return (String)insert("terminalInfoDAO.insertTerminalInfo", vo);
    }

    /**
	 * terminal_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TerminalInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTerminalInfo(TerminalInfoVO vo) throws Exception {
        update("terminalInfoDAO.updateTerminalInfo", vo);
    }

    /**
	 * terminal_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TerminalInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void deleteTerminalInfo(TerminalInfoVO vo) throws Exception {
        delete("terminalInfoDAO.deleteTerminalInfo", vo);
    }

    /**
	 * terminal_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TerminalInfoVO
	 * @return 조회한 terminal_info
	 * @exception Exception
	 */
    public TerminalInfoVO selectTerminalInfo(TerminalInfoVO vo) throws Exception {
        return (TerminalInfoVO) select("terminalInfoDAO.selectTerminalInfo", vo);
    }

    /**
	 * terminal_info 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return terminal_info 목록
	 * @exception Exception
	 */
    public List<?> selectTerminalInfoList(TerminalInfoDefaultVO searchVO) throws Exception {
        return list("terminalInfoDAO.selectTerminalInfoList", searchVO);
    }

    /**
	 * terminal_info 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return terminal_info 총 갯수
	 * @exception
	 */
    public int selectTerminalInfoListTotCnt(TerminalInfoDefaultVO searchVO) {
        return (Integer)select("terminalInfoDAO.selectTerminalInfoListTotCnt", searchVO);
    }

}
