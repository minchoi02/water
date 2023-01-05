package egovframework.appn.asset.terminal.service;

import java.util.List;
import egovframework.appn.asset.terminal.service.TerminalInfoDefaultVO;
import egovframework.appn.asset.terminal.service.TerminalInfoVO;

/**
 * @Class Name : TerminalInfoService.java
 * @Description : TerminalInfo Business class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TerminalInfoService {
	
	/**
	 * terminal_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TerminalInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTerminalInfo(TerminalInfoVO vo) throws Exception;
    
    /**
	 * terminal_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TerminalInfoVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTerminalInfo(TerminalInfoVO vo) throws Exception;
    
    /**
	 * terminal_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TerminalInfoVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTerminalInfo(TerminalInfoVO vo) throws Exception;
    
    /**
	 * terminal_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TerminalInfoVO
	 * @return 조회한 terminal_info
	 * @exception Exception
	 */
    TerminalInfoVO selectTerminalInfo(TerminalInfoVO vo) throws Exception;
    
    /**
	 * terminal_info 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return terminal_info 목록
	 * @exception Exception
	 */
    List selectTerminalInfoList(TerminalInfoDefaultVO searchVO) throws Exception;
    
    /**
	 * terminal_info 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return terminal_info 총 갯수
	 * @exception
	 */
    int selectTerminalInfoListTotCnt(TerminalInfoDefaultVO searchVO);
    
}
