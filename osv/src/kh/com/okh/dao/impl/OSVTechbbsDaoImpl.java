package kh.com.okh.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.okh.dao.OSVTechbbsDao;
import kh.com.okh.model.BbsParam;
import kh.com.okh.model.TechbbsDto;
@Repository
public class OSVTechbbsDaoImpl implements OSVTechbbsDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private String ns="Techbbs.";

	@Override
	public List<TechbbsDto> getTechBbsPagingList(BbsParam param) throws Exception {
		List<TechbbsDto> list=sqlsession.selectList(ns+"getTechBbsPagingList", param);
		return list;
	}

	@Override
	public int getTechBbsCount(BbsParam param) throws Exception {
		int num=0;
		num=sqlsession.selectOne(ns+"getTechBbsCount", param);
		return num;
	}

	@Override
	public List<TechbbsDto> getTechBbsSortingList(BbsParam param) throws Exception {
		List<TechbbsDto> list=sqlsession.selectList(ns+"getTechBbsSortingList", param);
		return list;
	}
	
}
