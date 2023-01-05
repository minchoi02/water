package egovframework.appn.utl.menu;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import egovframework.appn.sys.menu.mlm.service.MenuManageService;
import egovframework.appn.sys.menu.mlm.service.MenuManageVO;
import egovframework.appn.sys.user.urm.service.UserManageService;
import egovframework.appn.sys.user.urm.service.UserManageVO;
import egovframework.com.cmm.LoginVO;

public class MenuPreparer implements ViewPreparer {

	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private MenuManageService menuManageService;

	/** userManageService */
	@Resource(name = "userManageService")
	private UserManageService userManageService;

	@Override
	public void execute(Request tilesContext, AttributeContext attributeContext) throws PreparerException {

		MenuManageVO menuManageVO =  new MenuManageVO();

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String activeMenuId = request.getParameter("activeMenuId");
		HttpSession session = request.getSession();

		String uri = request.getRequestURI();
		String[] arrayuri = uri.split("/");
		String reqPage =  arrayuri[1];

		LoginVO vo = (LoginVO) session.getAttribute("LoginVO");

		//관리자아이디 한개로 유저화면과 관리자 화면을 모두 보기 위한 조치
		if(vo.getId().equals("admin")) {
			if(reqPage.equals("cmm") || reqPage.equals("cop") ) {
				vo.setUniqId("USRCNFRM_00000000050");
			}else {
				vo.setUniqId("USRCNFRM_00000000000");
			}
		}

		if (activeMenuId != null && !activeMenuId.equals("null")) {
			session.setAttribute("activeMenuId", activeMenuId);
		}


		if(vo!=null) {
			menuManageVO.setTmp_Id(vo.getId());
			menuManageVO.setTmp_Password(vo.getPassword());
			menuManageVO.setTmp_UserSe(vo.getUserSe());
			menuManageVO.setTmp_Name(vo.getName());
			menuManageVO.setTmp_Email(vo.getEmail());
			menuManageVO.setTmp_DeptId(vo.getDeptId());
			menuManageVO.setTmp_UniqId(vo.getUniqId());

			try {
				attributeContext.putAttribute("list_headmenu", new Attribute(menuManageService.selectMainMenuHead(menuManageVO)),true);
				attributeContext.putAttribute("list_menulist", new Attribute(menuManageService.selectMainMenuLeft(menuManageVO)),true);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
