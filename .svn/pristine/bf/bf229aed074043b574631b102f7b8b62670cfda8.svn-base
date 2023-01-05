package egovframework.appn.sys.bbs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.appn.sys.bbs.service.BbsMstrVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("bbsMstrDAO")
public class BbsMstrDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<?> selectBbsMstrList(BbsMstrVO bbsMstrVO) throws Exception {
		return (List<BbsMstrVO>) list("bbsMstr.selectBbsMstrList", bbsMstrVO);
	}

	public int selectBbsMstrListTotCnt(BbsMstrVO bbsMstrVO) throws Exception {
        return (Integer)select("bbsMstr.selectBbsMstrListTotCnt", bbsMstrVO);
    }

	public void insertBbsMstr(BbsMstrVO bbsMstrVO) throws Exception {
		insert("bbsMstr.insertBbsMstr", bbsMstrVO);
	}

	public BbsMstrVO selectBbsMstr(BbsMstrVO bbsMstrVO) throws Exception {
		return (BbsMstrVO) select("bbsMstr.selectBbsMstr", bbsMstrVO);
	}

	public void updateBbsMstr(BbsMstrVO bbsMstrVO) throws Exception {
		update("bbsMstr.updateBbsMstr", bbsMstrVO);
	}

	public void deleteBbsMstr(BbsMstrVO bbsMstrVO) throws Exception {
		update("bbsMstr.deleteBbsMstr", bbsMstrVO);
	}
}