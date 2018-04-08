package kh.com.okh.dao;

import java.util.List;

import kh.com.okh.model.BbsParam;
import kh.com.okh.model.TechbbsDto;

public interface OSVTechbbsDao {
	List<TechbbsDto> getTechBbsPagingList(BbsParam param)throws Exception;
	int getTechBbsCount(BbsParam param)throws Exception; 
}
