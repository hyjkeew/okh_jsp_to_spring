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

import kh.com.okh.model.UserDto;
import kh.com.okh.service.OSVMemberService;

@Controller
public class OSVMemberController {
	private static final Logger logger=LoggerFactory.getLogger(OSVMemberController.class);
	@Autowired
	OSVMemberService oSVMemberService;
/*	@RequestMapping(value="test.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String test(Model model)throws Exception {
		logger.info("OSVMemberController test"+new Date());
		
		List<UserDto> list=oSVMemberService.gettest();
		UserDto dto=list.get(0);
		
		model.addAttribute("login", dto);
		return "test.tiles";
	}*/
	
	@RequestMapping(value="test.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String test(Model model)throws Exception {
		logger.info("OSVMemberController test"+new Date());
		
		model.addAttribute("test", oSVMemberService.test());
		return "test.tiles";
	}
}
