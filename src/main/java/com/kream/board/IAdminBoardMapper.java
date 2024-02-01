package com.kream.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface IAdminBoardMapper {

	int totalCount(String select, String search);

	List<AdminBoardDTO> notice(int begin, int end, String select, String search);

	int adminBoardWriteProc(AdminBoardDTO board);

	AdminBoardDTO adminBoardContent(int n);

	void adminBoardDeleteProc(int n);

	int adminBoardModify(AdminBoardDTO board);

	AdminBoardDTO imgName(int n);
	
	
}
