package kh.com.okh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.okh.dao.OSVMemberDao;
import kh.com.okh.dao.OSVTechbbsDao;
import kh.com.okh.model.BbsParam;
import kh.com.okh.model.TechbbsDto;
import kh.com.okh.service.OSVTechbbsService;
@Service
public class OSVTechbbsServiceImpl implements OSVTechbbsService {
	@Autowired
	OSVTechbbsDao oSVTechbbsDao;

	@Override
	public List<TechbbsDto> getTechBbsPagingList(BbsParam param) throws Exception {
		// TODO Auto-generated method stub
		return oSVTechbbsDao.getTechBbsPagingList(param);
	}

	@Override
	public int getTechBbsCount(BbsParam param) throws Exception {
		// TODO Auto-generated method stub
		return oSVTechbbsDao.getTechBbsCount(param);
	}
}
