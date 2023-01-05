package egovframework.appn.sys.code.zip.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.appn.sys.code.zip.service.ZipVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 *
 * 우편번호에 대한 데이터 접근 클래스를 정의한다
 * @author 공통서비스 개발팀 이중호
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
@Repository("ZipManageDAO")
public class ZipManageDAO extends EgovAbstractDAO {

    /**
	 * 우편번호 목록을 조회한다.
     * @param searchVO
     * @return List(우편번호 목록)
     * @throws Exception
     */
	public List<?> selectZipList(ZipVO searchVO) throws Exception {
        return list("ZipManage.selectZipList", searchVO);
    }

    /**
	 * 우편번호 총 갯수를 조회한다.
     * @param searchVO
     * @return int(우편번호 총 갯수)
     */
    public int selectZipListTotCnt(ZipVO searchVO) throws Exception {
        return (Integer)select("ZipManage.selectZipListTotCnt", searchVO);
    }
}
