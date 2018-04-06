package kh.com.okh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.okh.dao.OSVMemberDao;
import kh.com.okh.dao.OSVTechbbsDao;
import kh.com.okh.service.OSVTechbbsService;
@Service
public class OSVTechbbsServiceImpl implements OSVTechbbsService {
	@Autowired
	OSVTechbbsDao oSVTechbbsDao;
}
