package egovframework.appn.asset.customer.service;

import java.util.List;
import egovframework.appn.asset.customer.service.CustomerInfoDefaultVO;
import egovframework.appn.asset.customer.service.CustomerInfoVO;

/**
 * @Class Name : CustomerInfoService.java
 * @Description : CustomerInfo Business class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface CustomerInfoService {
	
	/**
	 * customer_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 CustomerInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertCustomerInfo(CustomerInfoVO vo) throws Exception;
    
    /**
	 * customer_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 CustomerInfoVO
	 * @return void형
	 * @exception Exception
	 */
    void updateCustomerInfo(CustomerInfoVO vo) throws Exception;
    
    /**
	 * customer_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 CustomerInfoVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteCustomerInfo(CustomerInfoVO vo) throws Exception;
    
    /**
	 * customer_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 CustomerInfoVO
	 * @return 조회한 customer_info
	 * @exception Exception
	 */
    CustomerInfoVO selectCustomerInfo(CustomerInfoVO vo) throws Exception;
    
    /**
	 * customer_info 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return customer_info 목록
	 * @exception Exception
	 */
    List selectCustomerInfoList(CustomerInfoDefaultVO searchVO) throws Exception;
    
    /**
	 * customer_info 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return customer_info 총 갯수
	 * @exception
	 */
    int selectCustomerInfoListTotCnt(CustomerInfoDefaultVO searchVO);
    
}
