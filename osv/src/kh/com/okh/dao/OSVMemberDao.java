package kh.com.okh.dao;

import java.util.List;

import kh.com.okh.model.UserDto;

public interface OSVMemberDao {
	public List<UserDto> gettest();
	boolean addmember(UserDto user) throws Exception;
	public UserDto login(UserDto user) throws Exception;
	int getID(UserDto user);
	int getEMAIL(UserDto user);
	UserDto getPROFILE(UserDto user);
}
