package egovframework.appn.sys.cntnts.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.sys.bbs.service.BbsMstrVO;
import egovframework.appn.sys.cntnts.service.CntntsMstrService;
import egovframework.appn.sys.cntnts.service.CntntsMstrVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("cntntsMstrService")
public class CntntsMstrServiceImpl  extends EgovAbstractServiceImpl implements CntntsMstrService {

	@Resource(name="cntntsMstrDAO")
    private CntntsMstrDAO cntntsMstrDAO;

	public List<?> selectCntntsMstrList(CntntsMstrVO cntntsMstrVO) throws Exception {
		return cntntsMstrDAO.selectCntntsMstrList(cntntsMstrVO);
	}

	public int selectCntntsMstrListTotCnt(CntntsMstrVO cntntsMstrVO) throws Exception {
		return cntntsMstrDAO.selectCntntsMstrListTotCnt(cntntsMstrVO);
	}

	public List<?> selectCntntsMstrSearchList(CntntsMstrVO cntntsMstrVO) throws Exception {
		return cntntsMstrDAO.selectCntntsMstrSearchList(cntntsMstrVO);
	}

	public int selectCntntsMstrSearchListTotCnt(CntntsMstrVO cntntsMstrVO) throws Exception {
		return cntntsMstrDAO.selectCntntsMstrSearchListTotCnt(cntntsMstrVO);
	}

	public List<?> selectCntntsMstrLogList(CntntsMstrVO cntntsMstrVO) throws Exception {
		return cntntsMstrDAO.selectCntntsMstrLogList(cntntsMstrVO);
	}

	public int selectCntntsMstrLogListTotCnt(CntntsMstrVO cntntsMstrVO) throws Exception {
		return cntntsMstrDAO.selectCntntsMstrLogListTotCnt(cntntsMstrVO);
	}

	public void insertCntntsMstr(CntntsMstrVO cntntsMstrVO) throws Exception {
		cntntsMstrDAO.insertCntntsMstr(cntntsMstrVO);
	}

	public CntntsMstrVO selectCntntsMstr(CntntsMstrVO cntntsMstrVO) throws Exception {
		return cntntsMstrDAO.selectCntntsMstr(cntntsMstrVO);
	}

	public void updateCntntsMstr(CntntsMstrVO cntntsMstrVO) throws Exception {

		//로그생성 및 업데이트
		CntntsMstrVO cntntsMstrLogVO = cntntsMstrDAO.selectCntntsMstr(cntntsMstrVO);
		cntntsMstrDAO.insertCntntsMstrLog(cntntsMstrLogVO);
		cntntsMstrDAO.updateCntntsMstr(cntntsMstrVO);
	}
	public void restoreCntntsMstr(CntntsMstrVO cntntsMstrVO) throws Exception {

		//로그생성 및 업데이트
		CntntsMstrVO cntntsMstrLogVO = cntntsMstrDAO.selectCntntsMstrLog(cntntsMstrVO);
		cntntsMstrDAO.insertCntntsMstrLog(cntntsMstrVO);
		cntntsMstrDAO.updateCntntsMstr(cntntsMstrLogVO);
	}

	public void deleteCntntsMstr(CntntsMstrVO cntntsMstrVO) throws Exception {
		cntntsMstrDAO.deleteCntntsMstr(cntntsMstrVO);
	}
	public void deleteCntntsMstrLog(CntntsMstrVO cntntsMstrVO) throws Exception {
		cntntsMstrDAO.deleteCntntsMstrLog(cntntsMstrVO);
	}

}