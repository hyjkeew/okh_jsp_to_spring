package kh.com.okh.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.okh.dao.OSVMemberDao;
import kh.com.okh.model.UserDto;
import kh.com.okh.model.dto;
@Repository
public class OSVMemberDaoImpl implements OSVMemberDao {
	@Autowired
	SqlSessionTemplate sqlsession;
	
	private String ns="Member.";
	
	@Override
	public List<UserDto> gettest() {
		return sqlsession.selectList(ns+"testall");
	}

	@Override
	public List<dto> test() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(ns+"test");
	}

	@Override
	public boolean addmember(UserDto user) throws Exception {
		int n=sqlsession.insert(ns+"addmember", user);
		return n>0?true:false;
	}

	@Override
	public UserDto login(UserDto user) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(ns+"loginaf", user);
	}

	@Override
	public int getID(UserDto user) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(ns+"getID", user);
	}

	

}
