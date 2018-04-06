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

import kh.com.okh.model.UserDto;
import kh.com.okh.service.OSVMemberService;

@Controller
public class OSVMemberController {
	private static final Logger logger=LoggerFactory.getLogger(OSVMemberController.class);
	@Autowired
	OSVMemberService oSVMemberService;
	@RequestMapping(value="join.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String join(Model model)throws Exception {
		logger.info("OSVMemberController join"+new Date());
		return "join.tiles";
	}
	@RequestMapping(value="joinAf.do",method= {RequestMethod.POST,RequestMethod.GET})		//regi.do에서와서 regi.jsp로가게한다
	public String joinAf(UserDto user,Model model)throws Exception {	//추가가능한것 http도같이쓰수있는데 사용처는 로그인후세션저장할때
		logger.info("OSVMemberController joinAf" + new Date());
		boolean	b=oSVMemberService.addmember(user);
			if (b) {
				return "login.tiles";
			}else {
				return "join.tiles";
			}
	}
	@RequestMapping(value="login.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String login(Model model)throws Exception {
		logger.info("OSVMemberController login"+new Date());
		return "login.tiles";
	}
	@RequestMapping(value="loginAf.do",method= {RequestMethod.POST,RequestMethod.GET})		//regi.do에서와서 regi.jsp로가게한다
	public String loginAf(UserDto user,HttpServletRequest req,Model model)throws Exception {	//추가가능한것 http도같이쓰수있는데 사용처는 로그인후세션저장할때
		logger.info("OSVMemberController loginAf" + new Date());
		UserDto login=null;
		login=oSVMemberService.login(user);
		
		if (login!=null && !login.getId().equals("")) {//로그인성공
			req.getSession().setAttribute("login", login);			
			return "redirect:/main.do";
		}else {
			req.getSession().invalidate();
			return "login.tiles";		//컨트롤러에서컨트롤러로갈때 짐안들고가려면 redirect:/로보내면된다
		}
	}
	@RequestMapping(value="main.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String main(Model model)throws Exception {
		logger.info("OSVMemberController main"+new Date());
		
		return "main.tiles";
	}
	@RequestMapping(value="logout.do",method=RequestMethod.GET)
	public String logout(Model model,HttpServletRequest req) {
		logger.info("OSVMemberController logout" + new Date());
		req.getSession().invalidate();
		return "index.tiles";
	}
}
