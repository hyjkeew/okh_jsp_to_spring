package kh.com.okh.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.okh.model.UserDto;
import kh.com.okh.service.OSVMemberService;

@Controller
public class OSVMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(OSVMemberController.class);
	
	@Autowired
	private OSVMemberService oSVMemberService;
	
	@RequestMapping(value="join.do",method={RequestMethod.POST,RequestMethod.GET})
	public String join(Model model)throws Exception {
		logger.info("OSVMemberController join" + new Date());
		
		return "join.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="getID.do", method={RequestMethod.POST,RequestMethod.GET})
	public String getID(UserDto user)throws Exception {
		logger.info("OSVMemberController getID" + new Date());
		
		System.out.println("user(id) in controller : "+user);
		
		return oSVMemberService.getID(user)+"";
	}
	
	@ResponseBody
	@RequestMapping(value="getEMAIL.do", method={RequestMethod.POST,RequestMethod.GET})
	public String getEMAIL(UserDto user)throws Exception {
		logger.info("OSVMemberController getEMAIL" + new Date());
		
		System.out.println("user(email) in controller : "+user);
		
		return oSVMemberService.getEMAIL(user)+"";
	}
	
	@ResponseBody
	@RequestMapping(value="joincheck.do", method={RequestMethod.POST,RequestMethod.GET})
	public String joincheck(UserDto user)throws Exception {
		logger.info("OSVMemberController joincheck" + new Date());
		
		return null;
	}
	
	@RequestMapping(value="joinAf.do", method={RequestMethod.POST,RequestMethod.GET})
	public String joinAf(UserDto user, Model model)throws Exception {
		logger.info("OSVMemberController joinAf" + new Date());
		
		if(oSVMemberService.addmember(user)) {
			return "login.tiles";
		}else {
			return "join.tiles";
		}
	}
	
	@RequestMapping(value="login.do",method={RequestMethod.POST,RequestMethod.GET})
	public String login(Model model)throws Exception {
		logger.info("OSVMemberController login"+new Date());
		return "login.tiles";
	}
	
	@RequestMapping(value="loginAf.do",method={RequestMethod.POST,RequestMethod.GET})
	public String loginAf(UserDto user, HttpServletRequest req, Model model)throws Exception {
		logger.info("OSVMemberController loginAf" + new Date());
		
		UserDto login=null;
		login=oSVMemberService.login(user);
		
		if (login!=null && !login.getId().equals("")) {
			req.getSession().setAttribute("login", login);			
			return "redirect:/main.do";
		}else {
			req.getSession().invalidate();
			return "login.tiles";
		}
	}
	
	@RequestMapping(value="main.do",method={RequestMethod.POST,RequestMethod.GET})
	public String main(Model model)throws Exception {
		logger.info("OSVMemberController main"+new Date());
		
		return "main.tiles";
	}
	
	@RequestMapping(value="logout.do",method=RequestMethod.GET)
	public String logout(Model model, HttpServletRequest req) {
		logger.info("OSVMemberController logout" + new Date());
		
		req.getSession().invalidate();
		
		return "index.tiles";
	}
	
}
