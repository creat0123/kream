package com.kream.board;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class BoardController {
	// 문의사항
	@RequestMapping("faq")
	public String faq() {
		return "board/faq";
	}

	// 운영정책
	@RequestMapping("policy")
	public String policy() {
		return "board/policy";
	}

<<<<<<< HEAD
	// 공지사항
	@RequestMapping("notice")
	public String notice() {
		return "board/notice";
	}

=======
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
	@Autowired
	private BoardService service;

	@RequestMapping("list")
	public String getList(String pageNum, Model model) {
		service.getList(pageNum, model);
		return "board/list";
	}

	@GetMapping("writeForm")
	public String writeForm(@RequestParam(value = "num", required = false, defaultValue = "0") String num,
			@RequestParam(value = "ref", required = false, defaultValue = "1") String ref,
			@RequestParam(value = "step", required = false, defaultValue = "0") String step,
			@RequestParam(value = "depth", required = false, defaultValue = "0") String depth, Model model) {

		// num : 게시글 번호
		// ref : 게시글 및 댓글 그룹 번호
		// step : 같은 계층의 댓글의 순서 번호
		// depth : 댓글 대댓글 대대댓글 구분 번호
		model.addAttribute("num", num);
		model.addAttribute("ref", ref);
		model.addAttribute("step", step);
		model.addAttribute("depth", depth);

		return "board/writeForm";
	}

	@PostMapping("writeProc")
	public String writeProc(BoardDTO board, HttpServletRequest req, Model model,
			RedirectAttributes redirectAttributes) {
		String msg = null;
		msg = "모든 항목을 입력해주세요!";

		if (isNullOrEmpty(board.getWriter()) || isNullOrEmpty(board.getEmail()) || isNullOrEmpty(board.getSubject())
				|| isNullOrEmpty(board.getContent()) || isNullOrEmpty(board.getPass())) {
			// 필수 입력 필드 중 하나라도 비어 있을 때 알림을 추가합니다.
			model.addAttribute("msg", msg);
			model.addAttribute("url", "writeForm");
			return "board/alert";
		}
		// 필수 입력 필드가 모두 작성된 경우 처리를 계속합니다
		String msgS = null;
		msgS = "게시글 등록 완료!";
		service.writeProc(board, req);
		model.addAttribute("msg", msgS);
		model.addAttribute("url", "list");
		return "board/alert";
	}

	// 문자열이 비어 있는지 확인하는 유틸리티 메서드
	private boolean isNullOrEmpty(String str) {
		return str == null || str.trim().isEmpty();
	}

	@GetMapping("content")
	public String content(@RequestParam(value = "num", required = false) String n, String pageNum, Model model) {

		BoardDTO board = service.content(n);
		if (board == null)
			return "redirect:list?pageNum=" + pageNum;

		model.addAttribute("sdf", new SimpleDateFormat("yyyy-MM-dd HH:mm"));
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);

		return "board/content";
	}

	@GetMapping("boardUpdateForm")
	public String boardUpdateForm(@RequestParam(value = "num", required = false) String n, String pageNum,
			Model model) {
		BoardDTO board = service.getUpdate(n);
		if (board == null)
			return "redirect:list?pageNum=" + pageNum;
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "board/boardUpdateForm";
	}

	@PostMapping("boardUpdateProc")
	public String boardupdateProc(String pageNum, BoardDTO board, Model model, RedirectAttributes redirectAttributes) {
		String msg = null;
		msg = "게시글 수정 완료!";
		int check = service.update(board);
		if (check == 1) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "list");
			return "board/alert";
		} else {
			return "redirect:boardUpdateForm?num=" + board.getNum() + "&pageNum=" + pageNum;
		}
	}

	@GetMapping("boardDeleteForm")
	public String deleteForm(String num, String pageNum, Model model) {
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		return "board/boardDeleteForm";
	}

	@RequestMapping("boardDeleteProc")
	public String boardDeleteProc(@RequestParam(value = "num", required = false) String n, String pageNum, String pass,
			Model model) {

		String msg = null;
		msg = "게시글 삭제 완료!";
		int check = service.delete(n, pass);
		if (check == 1) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "list");
			return "board/alert";
		} else {
			msg = "비밀번호가 일치하지 않습니다!";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "boardDeleteForm?num=" + n + "&pageNum=" + pageNum);
			return "board/alert";
		}
	}
}
