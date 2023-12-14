package com.kh.ftd.member.controller;

import java.util.ArrayList;

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

import com.kh.ftd.goods.model.service.GoodsService;
import com.kh.ftd.goods.model.vo.Goods;
import com.kh.ftd.member.model.service.MemberService;
import com.kh.ftd.member.model.vo.Like;
import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.member.model.vo.Subscribe;
import com.kh.ftd.seller.model.service.SellerService;
import com.kh.ftd.seller.model.vo.Seller;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	// 로그인 폼
	@RequestMapping("loginForm.me")
	public String loginForm() {
		
		return "member/memberLogin";
	}
	
	// 로그인
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		
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
	
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";	
	}
	
	
	@RequestMapping("insertForm.me")
	public String insertForm() {
		return "member/memberInsert";
	}
	
	
	// 비밀번호 암호화
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
	
	// 비밀번호 변경
	@PostMapping(value="updatePwd.me")
	public String updatePwd(Member m, Model model, HttpSession session, String memberPwd, String updatePwd) {
		if(bcryptPasswordEncoder.matches(memberPwd, ((Member)(session.getAttribute("loginUser"))).getMemberPwd())) {
			String encPwd = bcryptPasswordEncoder.encode(updatePwd);
			
			m.setMemberPwd(encPwd);
			
			int result = memberService.updatePwd(m);
			
			if(result > 0) {
				// 이게 맞을 경우
				session.setAttribute("alertMsg","성공적으로 비밀번호가 수정되었습니다.");
				
				return "redirect:/";
				
			} else {
				
				model.addAttribute("errorMsg","로직 에러 발생");
				
				return "common/errorPage";
			}
		}
		
		else {
			
			model.addAttribute("errorMsg","비밀번호가 일치하지 않습니다.");
			
			return "common/errorPage";
		}
		
	}
	
	
	
	
	
	// 마이페이지
	@RequestMapping("myPage.me")
	public String myPage() {
		
		return "member/myPage";
	
	}
	
	// 회원정보 수정
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
	
	
	

	// 중복확인
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		
		int count = memberService.memberIdCheck(checkId);
		
		return (count > 0 ) ? "NNNNN" : "NNNNY";
	}
	
	// 회원탈퇴
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
	
	
	
	// 아이디 찾기
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
	
	// 2023-12-07 천재영
	// 회원의 마켓 찜 조회
	@RequestMapping(value = "ajaxSelectSubscribe.se" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectSubscribe(Subscribe subscribeNo) {
		
		System.out.println(subscribeNo);
		
		// 회원의 마켓 찜 조회		
		Subscribe checkSubscribe = memberService.ajaxSelectSubscribe(subscribeNo);
		
		System.out.println(checkSubscribe);
		
		// 결과 담을 변수 셋팅
		String subscribeColor = "";
		
		// 회원의 마켓 찜 조회 후 조건문
		if(checkSubscribe != null) { // 조회 결과가 있을 경우
			
			subscribeColor = "btn btn-secondary";
			
		} else { // 조회 결과가 없을 경우
			
			subscribeColor = "btn btn-primary";
		}
		
		System.out.println(checkSubscribe);
		
		return subscribeColor;
	}
	
	// 회원의 마켓 찜 클릭 ( 조회 후 삭제 및 추가)
	@ResponseBody
	@RequestMapping(value = "ajaxClickSubscribe.se" , produces = "application/json; charset=UTF-8")
	public String ajaxClickSubscribe(Subscribe subscribeNo, Model model) {
		
		System.out.println("멤버 : " + subscribeNo.getMemberNo());
		System.out.println("판매자 : " + subscribeNo.getSellerNo());
		
		// 회원의 마켓 찜 조회		
		Subscribe checkSubscribe = memberService.ajaxSelectSubscribe(subscribeNo);
		
		System.out.println(checkSubscribe);
		
		String subscribeColor = "";
				
		// 회원의 마켓 찜 조회 후 조건문
		if(checkSubscribe != null) { // 조회 결과가 있을 경우
			
			// 회원의 마켓 찜 삭제
			int deleteSubscribe = memberService.ajaxDeleteSubscribe(checkSubscribe);
			
			if(deleteSubscribe > 0) { // 삭제 성공
				
				subscribeColor = "btn btn-primary";
								
			} else { // 삭제 실패
				
				model.addAttribute("errorMsg", "회원님의 마켓 찜 삭제가 실패했습니다.");
			}
			
			
		} else { // 조회 결과가 없을 경우
			
			// 회원의 마켓 찜 추가
			int insertSubscribe = memberService.ajaxInsertSubscribe(subscribeNo);
			
			if(insertSubscribe > 0) { // 추가 성공
				
				subscribeColor = "btn btn-secondary";
				
			} else { // 추가 실패
				
				model.addAttribute("errorMsg", "회원님의 마켓 찜 추가가 실패했습니다.");
			}
		}
		
		return subscribeColor;
	}
	
	@RequestMapping("like.me")
	public String memberLikeList(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<Goods> list = goodsService.memberLikeList(memberNo);
		
		model.addAttribute("list", list);
		
		return "member/memberLikeList";
	}
	
	@ResponseBody
	@RequestMapping("ajaxDeleteLike.me")
	public String ajaxMemberDeleteLike(Like like) {
		
		int result = memberService.ajaxMemberDeleteLike(like);
		
		if(result > 0) {
			return "Y";
		} else {
			return "N";
		}
	}
	
	// 찜 목록 조회
	@RequestMapping("subscribe.me")
	public String memberSubscribeList(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<Seller> list = sellerService.memberSubscribeList(memberNo);
		
		model.addAttribute("list", list);
		
		return "member/memberSubscribeList";
	}
	
	@ResponseBody
	@RequestMapping("ajaxDeleteSubscribe.me")
	public String ajaxMemberDeleteSubscribe(Subscribe subscribe) {
		
		int result = memberService.ajaxDeleteSubscribe(subscribe);
		
		if(result > 0) {
			return "Y";
		} else {
			return "N";
		}
	}
	
}
