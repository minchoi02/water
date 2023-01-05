package egovframework.appn.asset.meter.service;

import java.util.List;
import egovframework.appn.asset.meter.service.MeterInfoDefaultVO;
import egovframework.appn.asset.meter.service.MeterInfoVO;

/**
 * @Class Name : MeterInfoService.java
 * @Description : MeterInfo Business class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface MeterInfoService {
	
	/**
	 * meter_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MeterInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertMeterInfo(MeterInfoVO vo) throws Exception;
    
    /**
	 * meter_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MeterInfoVO
	 * @return void형
	 * @exception Exception
	 */
    void updateMeterInfo(MeterInfoVO vo) throws Exception;
    
    /**
	 * meter_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MeterInfoVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteMeterInfo(MeterInfoVO vo) throws Exception;
    
    /**
	 * meter_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MeterInfoVO
	 * @return 조회한 meter_info
	 * @exception Exception
	 */
    MeterInfoVO selectMeterInfo(MeterInfoVO vo) throws Exception;
    
    /**
	 * meter_info 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return meter_info 목록
	 * @exception Exception
	 */
    List selectMeterInfoList(MeterInfoDefaultVO searchVO) throws Exception;
    
    /**
	 * meter_info 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return meter_info 총 갯수
	 * @exception
	 */
    int selectMeterInfoListTotCnt(MeterInfoDefaultVO searchVO);
    
}
