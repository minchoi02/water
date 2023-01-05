package egovframework.appn.sys.code.zip.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.sys.code.zip.service.CcmZipManageService;
import egovframework.appn.sys.code.zip.service.ZipVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.excel.EgovExcelService;


/**
 *
 * 우편번호에 대한 서비스 구현클래스를 정의한다
 * @author 공통서비스 개발팀 이중호.
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Service("ZipManageService")
public class CcmZipManageServiceImpl extends EgovAbstractServiceImpl implements CcmZipManageService {

    @Resource(name="ZipManageDAO")
    private ZipManageDAO zipManageDAO;

    @Resource(name = "excelZipService")
    private EgovExcelService excelZipService;

	/**
	 * 우편번호 목록을 조회한다.
	 */
	@Override
	public List<?> selectZipList(ZipVO searchVO) throws Exception {
        return zipManageDAO.selectZipList(searchVO);
	}

	/**
	 * 우편번호 총 갯수를 조회한다.
	 */
	@Override
	public int selectZipListTotCnt(ZipVO searchVO) throws Exception {
        return zipManageDAO.selectZipListTotCnt(searchVO);
	}

}
