package egovframework.appn.sys.menu.mlm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.appn.sys.menu.mlm.service.MenuManage;
import egovframework.appn.sys.menu.mlm.service.MenuManageVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
/**
 * 메뉴관리, 메뉴생성, 사이트맵 생성에 대한 DAO 클래스를 정의한다.
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 *   2011.07.01  서준식			자기 메뉴 정보를 상위메뉴 정보로 참조하는 메뉴정보가 있는지 조회하는
 *   							selectUpperMenuNoByPk() 메서드 추가
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */

@Repository("menuManageDAO")
public class MenuManageDAO extends EgovAbstractDAO{

	/**
	 * 메뉴목록을 조회
	 * @param vo ComDefaultVO
	 * @return List
	 * @exception Exception
	 */
	public List<?> selectMenuManageList(ComDefaultVO vo) throws Exception{
		return list("menuManage.selectMenuManageList", vo);
	}
	public List<?> selectMenuManageListExcel(ComDefaultVO vo) throws Exception{
		return list("menuManage.selectMenuManageListExcel", vo);
	}

    /**
	 * 메뉴목록관리 총건수를 조회한다.
	 * @param vo ComDefaultVO
	 * @return int
	 * @exception Exception
	 */
    public int selectMenuManageListTotCnt(ComDefaultVO vo) {
        return (Integer)select("menuManage.selectMenuManageListTotCnt", vo);
    }

	/**
	 * 메뉴목록관리 기본정보를 조회
	 * @param vo ComDefaultVO
	 * @return MenuManageVO
	 * @exception Exception
	 */
	public MenuManageVO selectMenuManage(String menuNo)throws Exception{
		return (MenuManageVO)select("menuManage.selectMenuManage", Integer.parseInt(menuNo));
	}

	/**
	 * 메뉴목록 기본정보를 등록
	 * @param vo MenuManageVO
	 * @exception Exception
	 */
	public void insertMenuManage(MenuManageVO vo){
		insert("menuManage.insertMenuManage", vo);
	}

	/**
	 * 메뉴목록 기본정보를 수정
	 * @param vo MenuManageVO
	 * @exception Exception
	 */
	public void updateMenuManage(MenuManageVO vo){
		update("menuManage.updateMenuManage", vo);
	}

	/**
	 * 메뉴목록 기본정보를 삭제
	 * @param vo MenuManageVO
	 * @exception Exception
	 */
	public void deleteMenuManage(MenuManageVO vo){
		delete("menuManage.deleteMenuManage", vo);
	}

	/**
	 * 메뉴 전체목록을 조회
	 * @return list
	 * @exception Exception
	 */
	public List<?> selectMenuList() throws Exception{
		ComDefaultVO vo  = new ComDefaultVO();
		return list("menuManage.selectMenuListT", vo);
	}


	/**
	 * 메뉴번호 존재여부를 조회
	 * @param vo MenuManageVO
	 * @return int
	 * @exception Exception
	 */
	public int selectMenuNoByPk(MenuManageVO vo) throws Exception{
		return (Integer)select("menuManage.selectMenuNoByPk", vo);
	}



	/**
	 * 메뉴번호를 상위메뉴로 참조하고 있는 메뉴 존재여부를 조회
	 * @param vo MenuManageVO
	 * @return int
	 * @exception Exception
	 */
	public int selectUpperMenuNoByPk(MenuManageVO vo) throws Exception{
		return (Integer)select("menuManage.selectUpperMenuNoByPk", vo);
	}

	/**
	 * 메뉴정보 전체삭제 초기화
	 * @return boolean
	 * @exception Exception
	 */
	public boolean deleteAllMenuList(){
		MenuManageVO vo = new MenuManageVO();
		insert("menuManage.deleteAllMenuList", vo);
		return true;
	}

    /**
	 * 메뉴정보 존재여부 조회한다.
	 * @return int
	 * @exception Exception
	 */
    public int selectMenuListTotCnt() {
    	MenuManageVO vo = new MenuManageVO();
        return (Integer)select("menuManage.selectMenuListTotCnt", vo);
    }


	/*### 메뉴관련 프로세스 ###*/
	/**
	 * MainMenu Head Menu 조회
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	public List<?> selectMainMenuHead(MenuManageVO vo) throws Exception{
		return list("menuManage.selectMainMenuHead", vo);
	}

	/**
	 * MainMenu Left Menu 조회
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	public List<?> selectMainMenuLeft(MenuManageVO vo) throws Exception{
		return list("menuManage.selectMainMenuLeft", vo);
	}

	/**
	 * MainMenu Head MenuURL 조회
	 * @param vo MenuManageVO
	 * @return  String
	 * @exception Exception
	 */
	public String selectLastMenuURL(MenuManageVO vo) throws Exception{
		return (String)select("menuManage.selectLastMenuURL", vo);
	}

	/**
	 * MainMenu Left Menu 조회
	 * @param vo MenuManageVO
	 * @return int
	 * @exception Exception
	 */
	public int selectLastMenuNo(MenuManageVO vo) throws Exception{
		return (Integer)select("menuManage.selectLastMenuNo", vo);
	}

	/**
	 * MainMenu Left Menu 조회
	 * @param vo MenuManageVO
	 * @return int
	 * @exception Exception
	 */
	public int selectLastMenuNoCnt(MenuManageVO vo) throws Exception{
		return (Integer)select("menuManage.selectLastMenuNoCnt", vo);
	}

	/**
	 * 페이지뷰 정보 저장
	 * @param vo
	 */
	public void insertPageView(MenuManageVO vo) {
		insert("menuManage.insertPageView", vo);
	}
	public int selectMaxMenuNo(MenuManageVO menuManageVO) {
		return (Integer)select("menuManage.selectMaxMenuNo", menuManageVO);
	}
	public void updateMenuOrder(MenuManage menuManage) {

		update("menuManage.updateMenuOrder",menuManage);
	}

}