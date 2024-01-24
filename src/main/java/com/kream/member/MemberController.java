package com.kream.member;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;



@Controller
public class MemberController {
	
	@Autowired private MemberService service;
	@Autowired private HttpSession session;
	@Autowired private KakaoService kakaoService;

	
	@GetMapping("agree")
	public String agree() {
		return "member/agree";
	}
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("loginProc")
	public String loginProc(String id, String pw, Model model, RedirectAttributes ra) {
		String msg = service.loginProc(id, pw);
		if(msg.equals("로그인 성공")) {
			model.addAttribute("msg", msg);
		
			return "forward:alert.jsp";
		}
		model.addAttribute("msg", msg);
		return "redirect:login";
	}
	
	@RequestMapping("logout")
	public String logout(RedirectAttributes ra) {	
		if(session.getAttribute("kakaoid") != null)
			kakaoService.unlink();
		session.invalidate();
		
		ra.addFlashAttribute("msg", "로그 아웃");

		return "redirect:index";
	}

	@RequestMapping("regist")
	public String regist(String allcheck) {
		if(allcheck == null || allcheck.trim().isEmpty())//url로 동의 없이 회원가입 접속 막기 위해 사용.
			return "member/agree";
		return "member/regist";
	}
	
	@PostMapping("registProc")
	public String registProc(MemberDTO member, String postcode, String detailAddress, Model model, RedirectAttributes ra) {
	
		//regist.jsp에서 보낸 data를 저장하기 위해 MemberDTO member를 파라미터에 추가하여 값을 받고, DTO에 없는 postcode,detailAddress는 따로 추가하여 데이터를 받는다.
		if(member.getAddress() != null && member.getAddress().trim().isEmpty() == false)//member.getAddress에 데이터가 있을 때,			
			member.setAddress(postcode+","+member.getAddress()+","+detailAddress);	//memberDTO의 address에 postcode와 detailAddress를 ,를 구분자로 하여 붙여 저장한다.
		String msg = null;
		
			msg = service.registProc(member);
	
		if(msg.equals("회원 등록 완료")) {
			model.addAttribute("msg",msg); //msg를 보내준다.
			return 	"forward:alert.jsp";
		}
		
		model.addAttribute("msg", msg); //회원 등록이 실패했을 경우, model에 msg를 담아서 보내준다.
		return "redirect:regist";

	}	

	@PostMapping("update")
	public String update(MemberDTO member, Model model) {
		
		String id = member.getId();
		System.out.println(id);
		service.userInfo(model, id);
		return "member/update";
	}
	
	@PostMapping("updateProc")
	public String updateProc(MemberDTO member, String postcode, String detailAddress, Model model, RedirectAttributes ra) {
		if(member.getAddress() != null && member.getAddress().trim().isEmpty() == false)		
			member.setAddress(postcode+","+member.getAddress()+","+detailAddress);	
		
		String msg = service.updateProc(member,model);
	
		if(msg.equals("회원 수정 완료")) {
			model.addAttribute("msg", msg);			
			return "forward:alert.jsp";
		}
		model.addAttribute("msg", msg);
		return "redirect:update";
	}
	
	@RequestMapping("userInfo")
	public String userInfo(Model model, RedirectAttributes ra, String id) {
		System.out.println(id);
		
		if(id == null || id.trim().isEmpty()) //아이디 값이 없을 때, 관리자가 수정 한 뒤
			id = (String)session.getAttribute("targetid");
		
		String msg = service.userInfo(model, id);
		if(msg.equals("회원 검색 완료"))
			return "member/userInfo";
		
		ra.addFlashAttribute("msg", msg);
		return "redirect:login";
		
	}
	
	@GetMapping("delete")
	public String delete(String id,Model model) {
		
		model.addAttribute("id",id);
		return "member/delete";
	}
	@PostMapping("deleteProc")
	public String deleteProc(String id,String pw, String confirm, Model model) {
		
		String sessionId = (String)session.getAttribute("id");
		String msg = null;

		
		if(sessionId.equals("admin")) {
			//askBoardService.allBoardDeleteProc(id); //게시판 글 및 댓글 삭제
			msg = service.deleteProc(id, pw, confirm);
		}
		else {
			if(sessionId == null)
				return "redirect:login";
			
			//askBoardService.allBoardDeleteProc(sessionId);
			msg = service.deleteProc(sessionId, pw, confirm);
		}
		if(msg.equals("회원 삭제 완료")) {
			session.invalidate();
			return "redirect:index";
		}
		model.addAttribute("msg", msg);
		return "redirect:delete";
	}	
	
	@RequestMapping("memberInfo")
	public String memberInfo(String select, String search,
			@RequestParam(value="currentPage", required = false) String cp,Model model) {
		
		String sessionId = (String)session.getAttribute("id");
		if(!sessionId.equals("admin")) 
			return "redirect:index";
		
		service.memberInfo(select, search, cp, model);
		
		
		return "member/memberInfo";
	}

	@RequestMapping("kakaoLogin")
	public String kakaoLogin(String code, Model model) {
	    System.out.println("code : " + code);
	    kakaoService.getAccessToken(code);
	    kakaoService.getUserInfo(model);

	    String msg = service.idConfirm();

	    if (msg.equals("추가 사항을 기입해 주세요.")) {
	        return "member/kakaoRegist";
	    }

	    return "redirect:index";
	}

	@PostMapping("kakaoregistProc")
	public String kakaoregistProc(MemberDTO member, String postcode, String detailAddress, Model model, RedirectAttributes ra) {
	    if (member.getAddress() != null && !member.getAddress().trim().isEmpty()) {
	        member.setAddress(postcode + "," + member.getAddress() + "," + detailAddress);
	    }
	    String msg = null;

	    msg = service.kakaoregistProc(member);

	    if (msg.equals("회원 등록 완료")) {
	        ra.addFlashAttribute("msg", msg);
	        return "redirect:index";
	    }

	    model.addAttribute("msg", msg);
	    return "redirect:regist";
	} 

	@RequestMapping("kakaoDeleteProc")
	public String kakaoDeleteProc(String id, Model model) {
	    String sessionId = (String) session.getAttribute("kakaoid"); // 변경된 부분
	    String msg = null;
	    System.out.println(id);

	    if (sessionId == null || session.getAttribute("kakaoid") == null) {
	        return "redirect:login";
	    }

	    msg = service.kakaoDeleteProc(sessionId);

	    if (msg.equals("회원 삭제 완료")) {
	        session.invalidate();
	        return "redirect:index";
	    }
	    model.addAttribute("msg", msg);
	    return "redirect:delete";
	}
}


	

