package com.kream.board;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface IBoardMapper {
	int getCount();

	ArrayList<BoardDTO> getList(@Param("begin")int begin, @Param("end")int end);

	void write(BoardDTO board);

	void updateStep(@Param("ref")int ref, @Param("step")int step);

	int maxNum();

	void updateReadCount(int num);

	BoardDTO getContent(int num);

	BoardDTO getUpdate(int num);

	String getPass(int num);

	void update(BoardDTO board);

	void delete(int num);	
}
