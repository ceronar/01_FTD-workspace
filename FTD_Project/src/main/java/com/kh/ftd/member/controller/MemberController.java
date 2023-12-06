package com.kh.ftd.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ftd.member.model.service.MemberService;
import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.member.model.vo.Subscribe;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		
		return "member/memberLogin";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		System.out.println(m.getMemberId());
		System.out.println(m.getMemberPwd());
		
		Member loginUser = memberService.loginMember(m);
		
		// System.out.println(m);
		// System.out.println(loginUser);
		
		if(loginUser != null && 
				   bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())
				) { // 로그인 성공
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인에 성공했습니다.");
			
			System.out.println("로그인 성공");
			
			mv.setViewName("redirect:/");
			
		} else { // 로그인 실패
			
			mv.addObject("errorMsg", "로그인 실패");
			
			System.out.println("로그인 실패");
			
			mv.setViewName("common/errorPage");
			
		}
		
		return mv;
		
	}
	
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";	
	}
	@RequestMapping("insertForm.me")
	public String insertForm() {
		return "member/memberInsert";
	}
	
	
	@RequestMapping(value = "insert.me", produces = "text/html; charset=UTF-8")
	public String insertMember(Member m, 
							   Model model, 
							   HttpSession session) {
		
		// System.out.println(m.getMemberName());
		
		// bcryptPasswordEncoder.encode("평문") : String (암호문)
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		
		System.out.println(encPwd);
		
		// Member 객체의 userPwd 필드값을 암호문으로 바꾸기
		m.setMemberPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","회원가입 성공");
			
			return "redirect:/";
		
		} else {
			
			model.addAttribute("errorMsg","회원가입 실패");
			
			return "common/errorPage";
			
		}
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		
		return "member/myPage";
	
	}
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			
			Member updateMem = memberService.loginMember(m);
			
			session.setAttribute("loginUser", updateMem);
			
			session.setAttribute("alertMsg", "회원정보 변경");
			
			return "redirect:/myPage.me";
			
			
		} else {
			
			model.addAttribute("errorMsg", "회원정보 변경 실패");
			
			
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		
		int count = memberService.memberIdCheck(checkId);
		
		return (count > 0 ) ? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("delete.me")
	public String deleteMember(String memberId,
							   String memberPwd,
							   HttpSession session,
							   Model model) {
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemberPwd();
		
		System.out.println(memberPwd);
		System.out.println(encPwd);
		
		if(bcryptPasswordEncoder.matches(memberPwd, encPwd)) {
			
			int result = memberService.deleteMember(memberId);
			
			if(result > 0) {
				
				session.removeAttribute("loginUser");
				
				session.setAttribute("alertMsg", "성공적으로 탈퇴완료, 감사했습니다.");
				
				return "redirect:/";
			
			} else {
				
				model.addAttribute("errorMsg", "회원탈퇴실패");
				
				return "common/errorPage";
				
			}	
		
		} else {
			
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력했습니다. 다시 확인해주세요");
			
			return "redirect:/myPage.me";
		}	
	}
	
	@GetMapping("/find-id")
	public String memberId(HttpSession session) {
		if(session.getAttribute("loginUser") != null) { // 로그인상태
			
			session.setAttribute("alertMsg", "이미 로그인 되어있습니다.");
			
			return "redirect:/";
		}
		else {
			return "member/memberIdFind";
		}
	}	
	
	@PostMapping("/found-id")
	public String findIdByEmail(String email, Model model) {
		
		String foundId = memberService.findMemberIdByEmail(email);
		
		if (foundId != null) {
			model.addAttribute("foundId", foundId);
			return "member/found-id";
			
		} else {
			model.addAttribute("error", "님 이거 이메일 못찾음");
			return "member/found-id";
		}
	}
	
	
	@RequestMapping(value = "ajaxSelectSubscribe.se" , produces = "application/json; charset=UTF-8")
	public void ajaxSelectSubscribe(int memberNo, int sellerNo) {
		
		System.out.println(memberNo + "멤버");
		System.out.println(sellerNo + "판매자");
		
		// 회원의 마켓 찜 조회
		Subscribe subscribe = new Subscribe(memberNo, sellerNo);
				
		Subscribe resultSub = memberService.ajaxSelectSubscribe(subscribe);
		
	}
	
}
