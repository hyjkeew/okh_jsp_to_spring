package kh.com.okh.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.okh.dao.OSVMemberDao;
import kh.com.okh.model.UserDto;
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
	public boolean addmember(UserDto user) throws Exception {
		int n=sqlsession.insert(ns+"addmember", user);
		return n > 0;
	}

	@Override
	public UserDto login(UserDto user) throws Exception {
		return sqlsession.selectOne(ns+"loginaf", user);
	}

	@Override
	public int getID(UserDto user) {
		return sqlsession.selectOne(ns+"getID", user);
	}

	@Override
	public int getEMAIL(UserDto user) {
		return sqlsession.selectOne(ns+"getEMAIL", user);
	}

	@Override
	public UserDto getPROFILE(UserDto user) {
		return sqlsession.selectOne(ns+"getPROFILE", user);
	}

}
