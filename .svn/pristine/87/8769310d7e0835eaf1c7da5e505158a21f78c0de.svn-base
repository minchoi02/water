package egovframework.appn.sys.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.sys.bbs.service.BbsMstrService;
import egovframework.appn.sys.bbs.service.BbsMstrVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("bbsMstrService")
public class BbsMstrServiceImpl  extends EgovAbstractServiceImpl implements BbsMstrService {

	@Resource(name="bbsMstrDAO")
    private BbsMstrDAO bbsMstrDAO;

	public List<?> selectBbsMstrList(BbsMstrVO bbsMstrVO) throws Exception {
		return bbsMstrDAO.selectBbsMstrList(bbsMstrVO);
	}

	public int selectBbsMstrListTotCnt(BbsMstrVO bbsMstrVO) throws Exception {
		return bbsMstrDAO.selectBbsMstrListTotCnt(bbsMstrVO);
	}

	public void insertBbsMstr(BbsMstrVO bbsMstrVO) throws Exception {
		bbsMstrDAO.insertBbsMstr(bbsMstrVO);
	}

	public BbsMstrVO selectBbsMstr(BbsMstrVO bbsMstrVO) throws Exception {
		return bbsMstrDAO.selectBbsMstr(bbsMstrVO);
	}

	public void updateBbsMstr(BbsMstrVO bbsMstrVO) throws Exception {
		bbsMstrDAO.updateBbsMstr(bbsMstrVO);
	}

	public void deleteBbsMstr(BbsMstrVO bbsMstrVO) throws Exception {
		bbsMstrDAO.deleteBbsMstr(bbsMstrVO);
	}

}