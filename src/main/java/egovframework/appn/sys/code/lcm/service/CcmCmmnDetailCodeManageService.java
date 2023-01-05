package egovframework.appn.sys.code.lcm.service;

import java.util.List;

import egovframework.com.cmm.service.CmmnDetailCode;


public interface CcmCmmnDetailCodeManageService {

	/**
	 * 공통상세코드를 삭제한다.
	 * @param cmmnDetailCode
	 * @throws Exception
	 */
	void deleteCmmnDetailCode(CmmnDetailCode cmmnDetailCode) throws Exception;

	/**
	 * 공통상세코드를 등록한다.
	 * @param cmmnDetailCode
	 * @throws Exception
	 */
	void insertCmmnDetailCode(CmmnDetailCode cmmnDetailCode) throws Exception;

	/**
	 * 공통상세코드 상세항목을 조회한다.
	 * @param cmmnDetailCode
	 * @return CmmnDetailCode(공통상세코드)
	 * @throws Exception
	 */
	CmmnDetailCode selectCmmnDetailCodeDetail(CmmnDetailCode cmmnDetailCode) throws Exception;

	/**
	 * 공통상세코드 목록을 조회한다.
	 * @param searchVO
	 * @return List(공통상세코드 목록)
	 * @throws Exception
	 */
	List<?> selectCmmnDetailCodeList(CmmnDetailCodeVO searchVO) throws Exception;

    /**
	 * 공통상세코드 총 갯수를 조회한다.
     * @param searchVO
     * @return int(공통상세코드 총 갯수)
     */
    int selectCmmnDetailCodeListTotCnt(CmmnDetailCodeVO searchVO) throws Exception;

	/**
	 * 공통상세코드를 수정한다.
	 * @param cmmnDetailCode
	 * @throws Exception
	 */
	void updateCmmnDetailCode(CmmnDetailCode cmmnDetailCode) throws Exception;

}
