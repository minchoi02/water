package egovframework.appn.asset.meter.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.appn.asset.meter.service.MeterInfoService;
import egovframework.appn.asset.meter.service.MeterInfoDefaultVO;
import egovframework.appn.asset.meter.service.MeterInfoVO;
import egovframework.appn.asset.meter.service.impl.MeterInfoDAO;
/**
 * @Class Name : MeterInfoServiceImpl.java
 * @Description : MeterInfo Business Implement class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */

@Service("meterInfoService")
public class MeterInfoServiceImpl extends EgovAbstractServiceImpl implements
        MeterInfoService {

    private static final Logger LOGGER = LoggerFactory.getLogger(MeterInfoServiceImpl.class);

    @Resource(name="meterInfoDAO")
    private MeterInfoDAO meterInfoDAO;

    //@Resource(name="meterInfoDAO")
    //private MeterInfoDAO meterInfoDAO;

    /** ID Generation */
    //@Resource(name="{egovMeterInfoIdGnrService}")
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * meter_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MeterInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMeterInfo(MeterInfoVO vo) throws Exception {
    	LOGGER.debug(vo.toString());

    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());

    	meterInfoDAO.insertMeterInfo(vo);
    	//TODO 해당 테이블 정보에 맞게 수정
        return null;
    }

    /**
	 * meter_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MeterInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMeterInfo(MeterInfoVO vo) throws Exception {
        meterInfoDAO.updateMeterInfo(vo);
    }

    /**
	 * meter_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MeterInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void deleteMeterInfo(MeterInfoVO vo) throws Exception {
        meterInfoDAO.deleteMeterInfo(vo);
    }

    /**
	 * meter_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MeterInfoVO
	 * @return 조회한 meter_info
	 * @exception Exception
	 */
    public MeterInfoVO selectMeterInfo(MeterInfoVO vo) throws Exception {
        MeterInfoVO resultVO = meterInfoDAO.selectMeterInfo(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * meter_info 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return meter_info 목록
	 * @exception Exception
	 */
    public List<?> selectMeterInfoList(MeterInfoDefaultVO searchVO) throws Exception {
        return meterInfoDAO.selectMeterInfoList(searchVO);
    }

    /**
	 * meter_info 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return meter_info 총 갯수
	 * @exception
	 */
    public int selectMeterInfoListTotCnt(MeterInfoDefaultVO searchVO) {
		return meterInfoDAO.selectMeterInfoListTotCnt(searchVO);
	}

}
