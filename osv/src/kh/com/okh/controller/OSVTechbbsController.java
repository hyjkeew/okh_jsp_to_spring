package kh.com.okh.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.okh.model.BbsParam;
import kh.com.okh.model.TechbbsDto;
import kh.com.okh.service.OSVMemberService;
import kh.com.okh.service.OSVTechbbsService;

@Controller
public class OSVTechbbsController {
	
	private static final Logger logger=LoggerFactory.getLogger(OSVTechbbsController.class);
	
	@Autowired
	private OSVTechbbsService oSVTechbbsService;
	 
	@RequestMapping(value="techlist.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String techbbslist(Model model,BbsParam param)throws Exception {
		logger.info("OSVTechbbsController techbbslist " + new Date());		
		
		System.out.println(param.toString());
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		int totalRecordCount = oSVTechbbsService.getTechBbsCount(param);
		List<TechbbsDto> techlist = oSVTechbbsService.getTechBbsPagingList(param);
		model.addAttribute("techlist", techlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "techlist.tiles";		
	}
	@RequestMapping(value="sorthe.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String techbbssortinglist(Model model,BbsParam param)throws Exception {
		logger.info("OSVTechbbsController sorthe " + new Date());		
		
		System.out.println(param.toString());
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		int totalRecordCount = oSVTechbbsService.getTechBbsCount(param);
		List<TechbbsDto> techlist = oSVTechbbsService.getTechBbsSortingList(param);
		model.addAttribute("techlist", techlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "techlist.tiles";		
	}
	
}
