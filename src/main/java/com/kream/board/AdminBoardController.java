package com.kream.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminBoardController {

	@Autowired AdminBoardService service;
	@Autowired HttpSession session;
	
	@RequestMapping("notice")
	public String notice(String search,Model model,
			@RequestParam(value="currentPage", required = false)String cp) {
			String select = "select";
			if(search == null || search.trim().isEmpty()) {
				search = ""; select = "all"; 
			}
			service.notice(cp, model, search, select);
		return "board/notice";
	}

	@RequestMapping("adminBoardWrite")
	public String adminBoardWrite() {

		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null || sessionId.trim().isEmpty() || !sessionId.equals("admin"))
			return "board/notice";

		return "board/adminBoardWrite";
	}

	@RequestMapping("adminBoardWriteProc")
	public String adminBoardWriteProc(MultipartHttpServletRequest multi, RedirectAttributes ra) {
		String path = service.adminBoardWriteProc(multi);
		return path;
	}

	@RequestMapping("adminBoardContent")
	public String adminBoardContent(String no, Model model) {

		AdminBoardDTO board = service.adminBoardContent(no);
		if (board == null) {
			return "redirect:notice";
		}

		model.addAttribute("board", board);
		return "board/adminBoardContent";
	}

	@RequestMapping("adminBoardDeleteProc")
	public String adminBoardDeleteProc(String no, RedirectAttributes ra) {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:login";

		String msg = service.adminBoardDeleteProc(no);
		if (msg.equals("관리자만 삭제 할 수 있습니다."))
			return "redirect:adminBoardContent?no=" + no;

		return "redirect:notice";
	}

	@RequestMapping("adminBoardModify")
	public String adminBoardModify(String no, Model model) {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null || !sessionId.equals("admin"))
			return "redirect:login";

		AdminBoardDTO board = service.adminBoardContent(no);
		if (board == null) {
			return "redirect:notice";
		}

		model.addAttribute("board", board);
		return "board/adminBoardModify";
	}

	@RequestMapping("adminBoardModifyProc")
	public String adminBoardModifyProc(MultipartHttpServletRequest multi, String no) {
		System.out.println("컨트롤러 되나");
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null || !sessionId.equals("admin"))
			return "redirect:login";

		String path = service.adminBoardModifyProc(multi, no);
		return path;
	}

}
