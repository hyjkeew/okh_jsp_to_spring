package kh.com.okh.service;

import java.util.List;

import kh.com.okh.model.UserDto;
import kh.com.okh.model.dto;

public interface OSVMemberService {
	public List<UserDto> gettest();
	public List<dto> test();
	public boolean addmember(UserDto user) throws Exception;
	public UserDto login(UserDto user) throws Exception;
	public int getID(UserDto user);
	public int getEMAIL(UserDto user);
	public UserDto getPROFILE(UserDto user);
}
