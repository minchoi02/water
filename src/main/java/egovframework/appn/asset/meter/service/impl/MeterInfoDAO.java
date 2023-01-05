package egovframework.appn.asset.meter.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.appn.asset.meter.service.MeterInfoVO;
import egovframework.appn.asset.meter.service.MeterInfoDefaultVO;

/**
 * @Class Name : MeterInfoDAO.java
 * @Description : MeterInfo DAO Class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */

@Repository("meterInfoDAO")
public class MeterInfoDAO extends EgovAbstractDAO {

	/**
	 * meter_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MeterInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMeterInfo(MeterInfoVO vo) throws Exception {
        return (String)insert("meterInfoDAO.insertMeterInfo", vo);
    }

    /**
	 * meter_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MeterInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMeterInfo(MeterInfoVO vo) throws Exception {
        update("meterInfoDAO.updateMeterInfo", vo);
    }

    /**
	 * meter_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MeterInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void deleteMeterInfo(MeterInfoVO vo) throws Exception {
        delete("meterInfoDAO.deleteMeterInfo", vo);
    }

    /**
	 * meter_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MeterInfoVO
	 * @return 조회한 meter_info
	 * @exception Exception
	 */
    public MeterInfoVO selectMeterInfo(MeterInfoVO vo) throws Exception {
        return (MeterInfoVO) select("meterInfoDAO.selectMeterInfo", vo);
    }

    /**
	 * meter_info 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return meter_info 목록
	 * @exception Exception
	 */
    public List<?> selectMeterInfoList(MeterInfoDefaultVO searchVO) throws Exception {
        return list("meterInfoDAO.selectMeterInfoList", searchVO);
    }

    /**
	 * meter_info 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return meter_info 총 갯수
	 * @exception
	 */
    public int selectMeterInfoListTotCnt(MeterInfoDefaultVO searchVO) {
        return (Integer)select("meterInfoDAO.selectMeterInfoListTotCnt", searchVO);
    }

}
