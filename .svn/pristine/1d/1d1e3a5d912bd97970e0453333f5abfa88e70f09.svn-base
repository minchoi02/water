package egovframework.appn.cmm.adres.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class AdresController {

	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @RequestMapping(value="/cmm/adres/search.do")
    public String selectTcpReqstInfoList(@RequestParam String se,Model model) {

    	model.addAttribute("se",se);
    	// 우편번호 개발키
    	model.addAttribute("getPostKeyDev", propertiesService.getString("Globals.PostKey.Dev"));
    	// 우편번호 운영키
    	model.addAttribute("getPostKeyOpr", propertiesService.getString("Globals.PostKey.Opr"));

    	return "cmm/adres/search";
    }

}
