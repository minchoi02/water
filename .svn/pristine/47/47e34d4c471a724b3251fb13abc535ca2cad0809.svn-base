package egovframework.appn.asset.terminal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.appn.asset.terminal.service.TerminalInfoService;
import egovframework.appn.asset.terminal.service.TerminalInfoDefaultVO;
import egovframework.appn.asset.terminal.service.TerminalInfoVO;
import egovframework.appn.asset.terminal.service.impl.TerminalInfoDAO;
/**
 * @Class Name : TerminalInfoServiceImpl.java
 * @Description : TerminalInfo Business Implement class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */

@Service("terminalInfoService")
public class TerminalInfoServiceImpl extends EgovAbstractServiceImpl implements
        TerminalInfoService {

    private static final Logger LOGGER = LoggerFactory.getLogger(TerminalInfoServiceImpl.class);

    @Resource(name="terminalInfoDAO")
    private TerminalInfoDAO terminalInfoDAO;

    //@Resource(name="terminalInfoDAO")
    //private TerminalInfoDAO terminalInfoDAO;

    /** ID Generation */
    //@Resource(name="{egovTerminalInfoIdGnrService}")
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * terminal_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TerminalInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTerminalInfo(TerminalInfoVO vo) throws Exception {
    	LOGGER.debug(vo.toString());

    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());

    	terminalInfoDAO.insertTerminalInfo(vo);
    	//TODO 해당 테이블 정보에 맞게 수정
        return null;
    }

    /**
	 * terminal_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TerminalInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTerminalInfo(TerminalInfoVO vo) throws Exception {
        terminalInfoDAO.updateTerminalInfo(vo);
    }

    /**
	 * terminal_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TerminalInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void deleteTerminalInfo(TerminalInfoVO vo) throws Exception {
        terminalInfoDAO.deleteTerminalInfo(vo);
    }

    /**
	 * terminal_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TerminalInfoVO
	 * @return 조회한 terminal_info
	 * @exception Exception
	 */
    public TerminalInfoVO selectTerminalInfo(TerminalInfoVO vo) throws Exception {
        TerminalInfoVO resultVO = terminalInfoDAO.selectTerminalInfo(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * terminal_info 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return terminal_info 목록
	 * @exception Exception
	 */
    public List<?> selectTerminalInfoList(TerminalInfoDefaultVO searchVO) throws Exception {
        return terminalInfoDAO.selectTerminalInfoList(searchVO);
    }

    /**
	 * terminal_info 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return terminal_info 총 갯수
	 * @exception
	 */
    public int selectTerminalInfoListTotCnt(TerminalInfoDefaultVO searchVO) {
		return terminalInfoDAO.selectTerminalInfoListTotCnt(searchVO);
	}

}
