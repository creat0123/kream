package com.kream.board;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
=======
import org.springframework.stereotype.Component;
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class BoardService {
	@Autowired private IBoardMapper mapper;
	
	public void getList(String pageNum, Model model) {
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(pageNum);
		} catch (Exception e) {	}
		
		int pageBlock = 7; // 한 페이지에 출력할 게시글 수
		int begin = (currentPage - 1) * pageBlock + 1;
		int end = currentPage * pageBlock;
		
		ArrayList<BoardDTO> list = null;
		int totalCount = mapper.getCount(); //저장된 게시글 총 수 
		if(totalCount > 0)
			list = mapper.getList(begin, end);
		
		/*
		 * number = 5 - (1 - 1) * 5 => 5
		 * number = 7 - (1 - 1) * 5 => 7
		 * number = 7 - (2 - 1) * 5 => 2
		 */
		int number = totalCount - (currentPage - 1) * pageBlock;
		
		String pagePrint = "";
		String url = "list?pageNum=";
		pagePrint = getNavi(currentPage, pageBlock, totalCount, url);
		
		model.addAttribute("count", totalCount);
		model.addAttribute("list", list);
		model.addAttribute("number", number);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("sdf", new SimpleDateFormat("yyyy-MM-dd HH:mm"));
		model.addAttribute("pagePrint", pagePrint);
	}
	
	public String getNavi(int currentPage, int pageBlock, int totalCount, String url) {
		int blockCnt = totalCount / pageBlock;
		
		if(totalCount % pageBlock > 0)
			blockCnt++;
		
		String result = "";
		if(currentPage != 1)
			result+="<a href='"+url+(currentPage-1)+"'> [이전] </a>";
			
		for(int i = 1;i <= blockCnt; i++) {
			if(currentPage == i)
				result+="<b>";
			result+="<a href='"+url+i+"'> "+ i +" </a>";
			if(currentPage == i)
				result+="</b>";
		}
		
		if(currentPage!=blockCnt) 
			result+="<a href='"+url+(currentPage+1)+"'> [다음] </a>";
		return result;
	}

	public void writeProc(BoardDTO board, HttpServletRequest req) {
		board.setRegDate(new Timestamp(System.currentTimeMillis()));
		board.setIp(req.getRemoteAddr());
		
		int step = board.getStep(); 
		int depth = board.getDepth(); 
		int ref = board.getRef(); 
		
		if(board.getNum() != 0) { // 답 글
/*
첫번째 답글
user1 게시글 : num=2, ref=2, step=0, depth=0
user1 게시글 답글 : num=5, ref=2, step=1, depth=1

두번째 답글
user1 게시글 : num=2, ref=2, step=0, depth=0
user1 게시글 답글 : num=5, ref=2, step=2, depth=1 <- step=1->2
user1 게시글 답글 : num=6, ref=2, step=1, depth=1

---
user1 게시글 답답글 : num=7, ref=2, step=1, depth=1 <- num=6의 답답글 작성 요청
user1 게시글 : num=2, ref=2, step=0, depth=0
user1 게시글 답글 : num=6, ref=2, step=1, depth=1 <- 답글에 답답글 작성 
user1 게시글 답글 : num=5, ref=2, step=3, depth=1 <- step=2->3
user1 게시글 답답글 : num=7, ref=2, step=2, depth=2 <- 답글의 step의 값을 증가함(step=step+1)
 */
			mapper.updateStep(ref, step);
			step++;
			depth++;
		}else { // 새 글
			ref = mapper.maxNum();
			step = 0;
			depth = 0;
		}
		
		board.setRef(ref);
		board.setStep(step);
		board.setDepth(depth);
		
		mapper.write(board);
	}
	
	public BoardDTO content(String n) {
		int num = 0;
		try {
			num = Integer.parseInt(n);
		} catch (Exception e) {
			return null;
		}
		
		mapper.updateReadCount(num);
		return mapper.getContent(num);
	}
	
	public BoardDTO getUpdate(String n) {
		int num = 0;
		try {
			num = Integer.parseInt(n);
		} catch (Exception e) {
			return null;
		}
		
		return mapper.getUpdate(num);
	}

	public int update(BoardDTO board) {
		String dbPass = mapper.getPass(board.getNum());	
		
		if(dbPass.equals(board.getPass())) {
			mapper.update(board);
			return 1;
		}
		return 0;
	}
	
	public int delete(String n, String pass) {
		int num = 0;
		try {
			num = Integer.parseInt(n);
		} catch (Exception e) {
			return 0;
		}
		
		String dbPass = mapper.getPass(num);	
		if(dbPass.equals(pass)) {
			mapper.delete(num);
			return 1;
		}
		return 0;
	}
}
