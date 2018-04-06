package kh.com.okh.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.okh.dao.OSVTechbbsDao;
@Repository
public class OSVTechbbsDaoImpl implements OSVTechbbsDao {
	@Autowired
	SqlSessionTemplate sqlsession;
	
	private String ns="Techbbs.";
	
}
