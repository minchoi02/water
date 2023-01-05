package egovframework.appn.sys.cntnts.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.appn.sys.bbs.service.BbsMstrVO;
import egovframework.appn.sys.cntnts.service.CntntsMstrVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("cntntsMstrDAO")
public class CntntsMstrDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<?> selectCntntsMstrList(CntntsMstrVO cntntsMstrVO) throws Exception {
		return (List<CntntsMstrVO>) list("cntntsMstr.selectCntntsMstrList", cntntsMstrVO);
	}

	public int selectCntntsMstrListTotCnt(CntntsMstrVO cntntsMstrVO) throws Exception {
        return (Integer)select("cntntsMstr.selectCntntsMstrListTotCnt", cntntsMstrVO);
    }
	public List<?> selectCntntsMstrSearchList(CntntsMstrVO cntntsMstrVO) throws Exception {
		return (List<CntntsMstrVO>) list("cntntsMstr.selectCntntsMstrSearchList", cntntsMstrVO);
	}

	public int selectCntntsMstrSearchListTotCnt(CntntsMstrVO cntntsMstrVO) throws Exception {
		return (Integer)select("cntntsMstr.selectCntntsMstrSearchListTotCnt", cntntsMstrVO);
	}
	public List<?> selectCntntsMstrLogList(CntntsMstrVO cntntsMstrVO) throws Exception {
		return (List<CntntsMstrVO>) list("cntntsMstr.selectCntntsMstrLogList", cntntsMstrVO);
	}

	public int selectCntntsMstrLogListTotCnt(CntntsMstrVO cntntsMstrVO) throws Exception {
		return (Integer)select("cntntsMstr.selectCntntsMstrLogListTotCnt", cntntsMstrVO);
	}

	public void insertCntntsMstr(CntntsMstrVO cntntsMstrVO) throws Exception {
		insert("cntntsMstr.insertCntntsMstr", cntntsMstrVO);
	}
	public void insertCntntsMstrLog(CntntsMstrVO cntntsMstrVO) throws Exception {
		insert("cntntsMstr.insertCntntsMstrLog", cntntsMstrVO);
	}

	public CntntsMstrVO selectCntntsMstr(CntntsMstrVO cntntsMstrVO) throws Exception {
		return (CntntsMstrVO) select("cntntsMstr.selectCntntsMstr", cntntsMstrVO);
	}
	public CntntsMstrVO selectCntntsMstrLog(CntntsMstrVO cntntsMstrVO) throws Exception {
		return (CntntsMstrVO) select("cntntsMstr.selectCntntsMstrLog", cntntsMstrVO);
	}

	public void updateCntntsMstr(CntntsMstrVO cntntsMstrVO) throws Exception {
		update("cntntsMstr.updateCntntsMstr", cntntsMstrVO);
	}

	public void deleteCntntsMstr(CntntsMstrVO cntntsMstrVO) throws Exception {
		update("cntntsMstr.deleteCntntsMstr", cntntsMstrVO);
	}

	public void deleteCntntsMstrLog(CntntsMstrVO cntntsMstrVO) throws Exception {
		update("cntntsMstr.deleteCntntsMstrLog", cntntsMstrVO);
	}
}