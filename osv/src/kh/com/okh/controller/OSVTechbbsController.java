package kh.com.okh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.com.okh.service.OSVMemberService;
import kh.com.okh.service.OSVTechbbsService;

@Controller
public class OSVTechbbsController {
	private static final Logger logger=LoggerFactory.getLogger(OSVTechbbsController.class);
	@Autowired
	OSVTechbbsService oSVTechbbsService;
}
