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
	
/*join.jsp로 이동*/
	@RequestMapping(value="join.do",method={RequestMethod.POST,RequestMethod.GET})
	public String join(Model model)throws Exception {
		logger.info("OSVMemberController join" + new Date());
		
		return "join.tiles";
	}
	
/*[ajax]아이디 중복 확인*/
	@ResponseBody
	@RequestMapping(value="getID.do", method={RequestMethod.POST,RequestMethod.GET})
	public String getID(UserDto user)throws Exception {
		logger.info("OSVMemberController getID" + new Date());
		
		System.out.println("user(id) in controller : "+user);
		
		return oSVMemberService.getID(user)+"";
	}
	
/*[ajax]이메일 중복 확인*/
	@ResponseBody
	@RequestMapping(value="getEMAIL.do", method={RequestMethod.POST,RequestMethod.GET})
	public String getEMAIL(UserDto user)throws Exception {
		logger.info("OSVMemberController getEMAIL" + new Date());
		
		System.out.println("user(email) in controller : "+user);
		
		return oSVMemberService.getEMAIL(user)+"";
	}
	
/*[ajax]회원가입 전 최종확인(빈칸, 아이디, 비밀번호, 이메일)*/
	@ResponseBody
	@RequestMapping(value="joincheck.do", method={RequestMethod.POST,RequestMethod.GET})
	public String joincheck(HttpServletRequest req, UserDto user)throws Exception {
		logger.info("OSVMemberController joincheck" + new Date());
		
		if(user.getId() == null || user.getId().equals("") || user.getPwd() == null || user.getPwd().equals("") || user.getPwd2() == null || user.getPwd2().equals("") ||
				user.getName() == null || user.getName().equals("") || user.getAge() == 0 || user.getEmail() == null || user.getEmail().equals("")){
			return "1";
		}
		if(!user.getPwd().equals(user.getPwd2())) {
			return "2";
		}
		if(oSVMemberService.getID(user) == 1) {
			return "3";
		}
		if(oSVMemberService.getEMAIL(user) == 1) {
			return "4";
		}
		return "5";
	}
	
/*회원가입 처리*/
	@RequestMapping(value="joinAf.do", method={RequestMethod.POST,RequestMethod.GET})
	public String joinAf(UserDto user, Model model)throws Exception {
		logger.info("OSVMemberController joinAf" + new Date());
		
		if(oSVMemberService.addmember(user)) {
			return "login.tiles";
		}else {
			return "join.tiles";
		}
	}
	
/*login.jsp로 이동*/
	@RequestMapping(value="login.do",method={RequestMethod.POST,RequestMethod.GET})
	public String login(Model model)throws Exception {
		logger.info("OSVMemberController login"+new Date());
		return "login.tiles";
	}
	
/*로그인 처리(로그인 세션)*/
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

/*로그인이 필요한 페이지 접근 시*/
	@RequestMapping(value="gotologin.do",method={RequestMethod.POST,RequestMethod.GET})
	public String gotologin(HttpServletRequest req)throws Exception {
		logger.info("OSVMemberController gotologin" + new Date());
		
		req.getSession().setAttribute("messageType", "오류 메시지");
		req.getSession().setAttribute("messageContent", "로그인이 필요한 페이지입니다.");
		
		return "redirect:/login.do";
	}
	
/*main.jsp로 이동*/
	@RequestMapping(value="main.do",method={RequestMethod.POST,RequestMethod.GET})
	public String main(Model model)throws Exception {
		logger.info("OSVMemberController main"+new Date());
		
		return "main.tiles";
	}
	
/*로그아웃 처리*/
	@RequestMapping(value="logout.do",method=RequestMethod.GET)
	public String logout(Model model, HttpServletRequest req) {
		logger.info("OSVMemberController logout" + new Date());
		
		req.getSession().invalidate();
		
		return "index.tiles";
	}
	
}
