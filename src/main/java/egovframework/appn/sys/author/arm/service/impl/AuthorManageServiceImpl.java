package egovframework.appn.sys.author.arm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.sys.author.arm.service.AuthorManage;
import egovframework.appn.sys.author.arm.service.AuthorManageService;
import egovframework.appn.sys.author.arm.service.AuthorManageVO;
import egovframework.appn.sys.author.arm.service.AuthorRoleManage;
import egovframework.appn.sys.author.uam.service.AuthorGroup;
import egovframework.appn.sys.author.uam.service.impl.AuthorGroupDAO;
import egovframework.appn.sys.menu.mcm.service.MenuCreatVO;
import egovframework.appn.sys.menu.mcm.service.impl.MenuCreateManageDAO;
import egovframework.appn.sys.user.urm.service.UserManageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 권한관리에 관한 ServiceImpl 클래스를 정의한다.
 * @author 공통서비스 개발팀 이문준
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.11  이문준          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */

@Service("authorManageService")
public class AuthorManageServiceImpl extends EgovAbstractServiceImpl implements AuthorManageService {

	@Resource(name="authorManageDAO")
    private AuthorManageDAO authorManageDAO;

	@Resource(name="authorRoleManageDAO")
	private AuthorRoleManageDAO authorRoleManageDAO;


	@Resource(name="menuCreateManageDAO")
	public MenuCreateManageDAO menuCreateManageDAO;

	@Resource(name="authorGroupDAO")
    private AuthorGroupDAO authorGroupDAO;

    /**
	 * 권한 목록을 조회한다.
	 * @param authorManageVO AuthorManageVO
	 * @return List<AuthorManageVO>
	 * @exception Exception
	 */
    public List<AuthorManageVO> selectAuthorList(AuthorManageVO authorManageVO) throws Exception {
        return authorManageDAO.selectAuthorList(authorManageVO);
    }

	/**
	 * 권한을 등록한다.
	 * @param authorManage AuthorManage
	 * @exception Exception
	 */
    public void insertAuthor(List<AuthorManage> authorManageList) throws Exception {

    	String roleCode = authorManageDAO.selectRoleCode();

    	AuthorManage authorManage = authorManageList.get(0);

    	authorManage.setAuthorCode(roleCode);

    	authorManageDAO.insertAuthor(authorManage);

    	MenuCreatVO menuCreatVO = new MenuCreatVO();
    	menuCreatVO.setAuthorCode(roleCode);
    	//menuCreateManageDAO.deleteMenuCreat(menuCreatVO);

    	AuthorRoleManage authorRoleManage = new AuthorRoleManage();
    	authorRoleManage.setAuthorCode(roleCode);
    	//authorRoleManageDAO.deleteAllAuthorRole(authorRoleManage);


	    	for(int i=0;i<authorManageList.size();i++) {

	    		menuCreatVO.setCreatAuthor(authorManageList.get(i).getCreatAuthor());
	    		menuCreatVO.setUpdtAuthor(authorManageList.get(i).getUpdtAuthor());
	    		menuCreatVO.setReadAuthor(authorManageList.get(i).getReadAuthor());
	    		menuCreatVO.setDeleteAuthor(authorManageList.get(i).getDeleteAuthor());
	    		menuCreatVO.setMenuNo(Integer.parseInt(authorManageList.get(i).getMenuId()));
	    		menuCreatVO.setAuthorCode(roleCode);
	    		menuCreateManageDAO.insertMenuCreat(menuCreatVO);

    		//if(!authorManage.get(i).getProgrmFileNm().equals("dir")) {
	    		authorRoleManage.setMenuId(authorManageList.get(i).getMenuId());
	    		authorRoleManageDAO.insertAuthorRole(authorRoleManage);
    		//}
	    	}
    }

    /**
	 * 권한을 수정한다.
	 * @param authorManage AuthorManage
	 * @exception Exception
	 */
    public void updateAuthor(List<AuthorManage> authorManageList) throws Exception {
    	//authorManageDAO.insertAuthor(authorManage.get(0));

    	AuthorManage authorManage = authorManageList.get(0);

    	authorManageDAO.updateAuthor(authorManage);

    	String roleCode = authorManageList.get(0).getAuthorCode();

    	MenuCreatVO menuCreatVO = new MenuCreatVO();
    	menuCreatVO.setAuthorCode(roleCode);
    	menuCreateManageDAO.deleteMenuCreat(menuCreatVO);

    	AuthorRoleManage authorRoleManage = new AuthorRoleManage();
    	authorRoleManage.setAuthorCode(roleCode);
    	authorRoleManageDAO.deleteAllAuthorRole(authorRoleManage);


	    	for(int i=0;i<authorManageList.size();i++) {
	    		menuCreatVO.setCreatAuthor(authorManageList.get(i).getCreatAuthor());
	    		menuCreatVO.setUpdtAuthor(authorManageList.get(i).getUpdtAuthor());
	    		menuCreatVO.setReadAuthor(authorManageList.get(i).getReadAuthor());
	    		menuCreatVO.setDeleteAuthor(authorManageList.get(i).getDeleteAuthor());
	    		menuCreatVO.setMenuNo(Integer.parseInt(authorManageList.get(i).getMenuId()));
	    		menuCreatVO.setAuthorCode(roleCode);
	    		menuCreateManageDAO.insertMenuCreat(menuCreatVO);

	    		//if(!authorManage.get(i).getProgrmFileNm().equals("dir")) {
	    		authorRoleManage.setMenuId(authorManageList.get(i).getMenuId());
	    		authorRoleManageDAO.insertAuthorRole(authorRoleManage);

	    		//}
	    	}
    }

    /**
	 * 권한을 삭제한다.
	 * @param authorManage AuthorManage
	 * @exception Exception
	 */
    public void deleteAuthor(AuthorManageVO authorManageVO) throws Exception {

     	String treeCode = authorManageVO.getTreeCode();

     	String roleCode = authorManageDAO.getAuthorCode(treeCode);

    	MenuCreatVO menuCreatVO = new MenuCreatVO();
    	menuCreatVO.setAuthorCode(roleCode);
    	menuCreateManageDAO.deleteMenuCreat(menuCreatVO);

    	AuthorGroup authorGroup = new AuthorGroup();
    	authorGroup.setAuthorCode(roleCode);
    	authorGroupDAO.deleteAuthorGroup(authorGroup);

    	AuthorRoleManage authorRoleManage = new AuthorRoleManage();
    	authorRoleManage.setAuthorCode(roleCode);
    	authorRoleManageDAO.deleteAllAuthorRole(authorRoleManage);


       	AuthorManage authorManage = new AuthorManage();
    	authorManage.setAuthorCode(roleCode);
    	authorManageDAO.deleteAuthor(authorManage);

    }

    /**
	 * 권한을 조회한다.
	 * @param authorManageVO AuthorManageVO
	 * @return AuthorManageVO
	 * @exception Exception
	 */
    public AuthorManageVO selectAuthor(AuthorManageVO authorManageVO) throws Exception {
    	AuthorManageVO resultVO = authorManageDAO.selectAuthor(authorManageVO);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * 권한 목록 카운트를 조회한다.
	 * @param authorManageVO AuthorManageVO
	 * @return int
	 * @exception Exception
	 */
    public int selectAuthorListTotCnt(AuthorManageVO authorManageVO) throws Exception {
        return authorManageDAO.selectAuthorListTotCnt(authorManageVO);
    }

    /**
	 * 모든 권한목록을 조회한다.
	 * @param authorManageVO AuthorManageVO
	 * @return List<AuthorManageVO>
	 * @exception Exception
	 */
	public List<AuthorManageVO> selectAuthorAllList(AuthorManageVO authorManageVO) throws Exception {
    	return authorManageDAO.selectAuthorAllList(authorManageVO);
    }
	public void updateUserAuthor(UserManageVO userManageVO)throws Exception {
		authorManageDAO.updateUserAuthor(userManageVO);
	}
	public void updateUserAuthor2(UserManageVO userManageVO)throws Exception {
		authorManageDAO.updateUserAuthor2(userManageVO);
	}
}
