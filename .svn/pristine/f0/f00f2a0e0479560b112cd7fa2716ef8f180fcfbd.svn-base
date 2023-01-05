package egovframework.appn.asset.customer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.appn.asset.customer.service.CustomerInfoService;
import egovframework.appn.asset.customer.service.CustomerInfoDefaultVO;
import egovframework.appn.asset.customer.service.CustomerInfoVO;
import egovframework.appn.asset.customer.service.impl.CustomerInfoDAO;
/**
 * @Class Name : CustomerInfoServiceImpl.java
 * @Description : CustomerInfo Business Implement class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */

@Service("customerInfoService")
public class CustomerInfoServiceImpl extends EgovAbstractServiceImpl implements
        CustomerInfoService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CustomerInfoServiceImpl.class);

    @Resource(name="customerInfoDAO")
    private CustomerInfoDAO customerInfoDAO;

    //@Resource(name="customerInfoDAO")
    //private CustomerInfoDAO customerInfoDAO;

    /** ID Generation */
    //@Resource(name="{egovCustomerInfoIdGnrService}")
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * customer_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 CustomerInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertCustomerInfo(CustomerInfoVO vo) throws Exception {
    	LOGGER.debug(vo.toString());

    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());

    	customerInfoDAO.insertCustomerInfo(vo);
    	//TODO 해당 테이블 정보에 맞게 수정
        return null;
    }

    /**
	 * customer_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 CustomerInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateCustomerInfo(CustomerInfoVO vo) throws Exception {
        customerInfoDAO.updateCustomerInfo(vo);
    }

    /**
	 * customer_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 CustomerInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void deleteCustomerInfo(CustomerInfoVO vo) throws Exception {
        customerInfoDAO.deleteCustomerInfo(vo);
    }

    /**
	 * customer_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 CustomerInfoVO
	 * @return 조회한 customer_info
	 * @exception Exception
	 */
    public CustomerInfoVO selectCustomerInfo(CustomerInfoVO vo) throws Exception {
        CustomerInfoVO resultVO = customerInfoDAO.selectCustomerInfo(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * customer_info 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return customer_info 목록
	 * @exception Exception
	 */
    public List<?> selectCustomerInfoList(CustomerInfoDefaultVO searchVO) throws Exception {
        return customerInfoDAO.selectCustomerInfoList(searchVO);
    }

    /**
	 * customer_info 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return customer_info 총 갯수
	 * @exception
	 */
    public int selectCustomerInfoListTotCnt(CustomerInfoDefaultVO searchVO) {
		return customerInfoDAO.selectCustomerInfoListTotCnt(searchVO);
	}

}
