package com.kream.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IAdminBoardMapper {

	int totalCount(String select, String search);

	List<AdminBoardDTO> notice(int begin, int end, String select, String search);

	void adminBoardWriteProc(AdminBoardDTO board);

	AdminBoardDTO adminBoardContent(int n);

	void adminBoardDeleteProc(int n);

	void adminBoardModify(AdminBoardDTO board);
	
	
}
