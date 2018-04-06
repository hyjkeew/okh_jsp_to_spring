package kh.com.okh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.okh.dao.OSVMemberDao;
import kh.com.okh.model.UserDto;
import kh.com.okh.model.dto;
import kh.com.okh.service.OSVMemberService;
@Service
public class OSVMemberServiceImpl implements OSVMemberService {
	@Autowired
	OSVMemberDao oSVMemberDao;

	@Override
	public List<UserDto> gettest() {
		// TODO Auto-generated method stub
		return oSVMemberDao.gettest();
	}

	@Override
	public List<dto> test() {
		// TODO Auto-generated method stub
		return oSVMemberDao.test();
	}
	
}
