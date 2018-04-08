package kh.com.okh.service;

import java.util.List;

import kh.com.okh.model.BbsParam;
import kh.com.okh.model.TechbbsDto;

public interface OSVTechbbsService {
	List<TechbbsDto> getTechBbsPagingList(BbsParam param)throws Exception;
	int getTechBbsCount(BbsParam param)throws Exception; 
}
