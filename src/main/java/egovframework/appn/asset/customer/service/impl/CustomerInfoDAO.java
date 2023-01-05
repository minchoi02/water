package egovframework.appn.asset.customer.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.appn.asset.customer.service.CustomerInfoVO;
import egovframework.appn.asset.customer.service.CustomerInfoDefaultVO;

/**
 * @Class Name : CustomerInfoDAO.java
 * @Description : CustomerInfo DAO Class
 * @Modification Information
 *
 * @author 차주병
 * @since 2022.04.26
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */

@Repository("customerInfoDAO")
public class CustomerInfoDAO extends EgovAbstractDAO {

	/**
	 * customer_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 CustomerInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertCustomerInfo(CustomerInfoVO vo) throws Exception {
        return (String)insert("customerInfoDAO.insertCustomerInfo", vo);
    }

    /**
	 * customer_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 CustomerInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateCustomerInfo(CustomerInfoVO vo) throws Exception {
        update("customerInfoDAO.updateCustomerInfo", vo);
    }

    /**
	 * customer_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 CustomerInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void deleteCustomerInfo(CustomerInfoVO vo) throws Exception {
        delete("customerInfoDAO.deleteCustomerInfo", vo);
    }

    /**
	 * customer_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 CustomerInfoVO
	 * @return 조회한 customer_info
	 * @exception Exception
	 */
    public CustomerInfoVO selectCustomerInfo(CustomerInfoVO vo) throws Exception {
        return (CustomerInfoVO) select("customerInfoDAO.selectCustomerInfo", vo);
    }

    /**
	 * customer_info 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return customer_info 목록
	 * @exception Exception
	 */
    public List<?> selectCustomerInfoList(CustomerInfoDefaultVO searchVO) throws Exception {
        return list("customerInfoDAO.selectCustomerInfoList", searchVO);
    }

    /**
	 * customer_info 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return customer_info 총 갯수
	 * @exception
	 */
    public int selectCustomerInfoListTotCnt(CustomerInfoDefaultVO searchVO) {
        return (Integer)select("customerInfoDAO.selectCustomerInfoListTotCnt", searchVO);
    }

}
