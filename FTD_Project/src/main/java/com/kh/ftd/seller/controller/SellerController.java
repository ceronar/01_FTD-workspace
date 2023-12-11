package com.kh.ftd.seller.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.member.model.vo.Subscribe;
import com.kh.ftd.seller.model.service.SellerService;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 판매자 마켓 페이지 이동
	@RequestMapping("sellerListPage.se")
	public String sellerListPage() {
		
		return "seller/sellerListView";
	}
	
	// 판매자 리스트 조회
	@ResponseBody
	@RequestMapping(value = "ajaxSelectSellerList.se" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectSellerList(int page, int pageSize) {
	
		// 마켓 리스트
		ArrayList<Seller> sList = sellerService.ajaxSelectSellerList();
		
		// 마켓 파일
		ArrayList<SellerFile> sfList = new ArrayList<>();
		
		// 마켓 평균 별점
		ArrayList<Object> starList = new ArrayList<>();
		
		// 마켓 리뷰 수
		ArrayList<Object> reviewList = new ArrayList<>();
		
		// 마켓 찜 수
		ArrayList<Object> subscribeList = new ArrayList<>();
		
		
		// 마켓 총 리스트 수
		int totalList = sList.size();
		// System.out.println(totalList);
		
		int startPage = page * pageSize;
		
		int endPage = Math.min(startPage + pageSize, totalList);		
		
		for(Seller s : sList) {
			
			int sellerNo = s.getSellerNo();
			// System.out.println(sellerNo);
			
			// 마켓 파일
			SellerFile sellerFile = sellerService.ajaxSelectSellerFileList(sellerNo);
			sfList.add(sellerFile);
			
			// 마켓 평균 별점
			double starRating = sellerService.ajaxSelectStarRating(sellerNo);
			starList.add(starRating);
			
			// 마켓 리뷰 수
			int reviews = sellerService.ajaxSelectReviews(sellerNo);
			reviewList.add(reviews);
			
			// 마켓 찜 수
			int subscribe = sellerService.ajaxSelectSubscribeCount(sellerNo);
			subscribeList.add(subscribe);
		}
		
		ArrayList<Object> resultList = new ArrayList<>();
		
		for (int i = startPage; i < endPage; i++) {
			
			ArrayList<Object> arrList = new ArrayList<>();
			
			arrList.add(sList.get(i));
			arrList.add(sfList.get(i));
			arrList.add(starList.get(i));
			arrList.add(reviewList.get(i));
			arrList.add(subscribeList.get(i));
			
			// 마켓 전체 리스트
			resultList.add(arrList);		
			
		}	
		System.out.println(startPage);
		System.out.println(endPage);
		
		return new Gson().toJson(resultList);
	}
	
	// 판매자 마켓 상세 페이지 이동
	@RequestMapping("sellerDetailPage.se")
	public ModelAndView sellerDetailPage(int sno, ModelAndView mv) {
		
		int sellerNo = sno;
		
		mv.addObject("sellerNo", sellerNo).setViewName("seller/sellerDetailView");
		
		return mv;
	}

	
	// 마켓 조회
	@ResponseBody
	@RequestMapping(value = "ajaxSelectSellerMarketList.se" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectSellerMarketList(int sellerNo) {
		
//		System.out.println(sellerNo);
		
		// 마켓 리스트
		Seller sList = sellerService.ajaxSelectSellerMarketList(sellerNo);
		
		// 마켓 평균 별점
		double starRating = sellerService.ajaxSelectStarRating(sellerNo);
		
		// 마켓 리뷰 수
		int reviews = sellerService.ajaxSelectReviews(sellerNo);
		
		// 마켓 찜 수
		int subscribe = sellerService.ajaxSelectSubscribeCount(sellerNo);
		
		ArrayList<Object> resultList = new ArrayList<>();
		
		resultList.add(sList);
		resultList.add(starRating);
		resultList.add(reviews);
		resultList.add(subscribe);
			
		return new Gson().toJson(resultList);
	}	
	
	// 로그인 폼
	@RequestMapping("loginForm.se")
	public String sellerLoginForm() {
		return "seller/sellerLogin";
	}
	
	// 로그인 
	@RequestMapping("login.se")
	public ModelAndView loginSeller(Seller s, ModelAndView mv, HttpSession session) {
		Seller loginSeller = sellerService.loginSeller(s);
		if(loginSeller != null && bcryptPasswordEncoder.matches(s.getSellerPwd(), loginSeller.getSellerPwd())) { 
			// 로그인 성공
			session.setAttribute("loginSeller", loginSeller);
			session.setAttribute("alertMsg", "로그인에 성공했습니다.");
			mv.setViewName("redirect:/");
		} else { 
			// 로그인 실패
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 로그아웃
	@RequestMapping("logout.se")
	public String logoutSeller(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입 폼
	@RequestMapping("insertSellerForm.se")
	public String insertSellerForm() {
		return "seller/insertSeller";
	}
	
	// 회원가입
	@RequestMapping(value = "insertSeller.se", produces = "text/html; charset=UTF-8")
	public String insertSeller(Seller s,
							   Model model,
							   HttpSession session) {
//		System.out.println(s);
		
		String encPwd = bcryptPasswordEncoder.encode(s.getSellerPwd());
		
//		System.out.println(encPwd);
		
		s.setSellerPwd(encPwd);
		
		int result = sellerService.insertSeller(s);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "회원가입 성공");
			
			return "redirect:/";
		
		} else {
			
			model.addAttribute("errorMsg", "회원가입 실패");
			
			return "common/errorPage";
		}
	}
	
	// 판매자 페이지
	@RequestMapping("sellerPage")
	public String sellerPage() {
		return "seller/sellerPage";
	}
	
	// 회원정보 변경 
	@RequestMapping(value = "update.se", method = RequestMethod.POST)
    public String updateSeller(
            Seller s,
            Model model,
            HttpSession session,
            @RequestPart("upFile") MultipartFile upfile) {
        
        if (upfile != null && !upfile.isEmpty()) {
            
            String imageUrl = handleFileUpload(upfile);

            s.setChangeName(imageUrl);
        }
        
        sellerService.updateSeller(s);
        session.removeAttribute("loginSeller");
        session.setAttribute("loginSeller", s);
        session.setAttribute("alertMsg", "회원정보 변경 성공했습니다.");
        return "redirect:/sellerPage"; 
    }
	
	// 비밀번호 변경
	@PostMapping(value="updateSellerPwd.se")
	public String updateSellerPwd(Seller s, Model model, HttpSession session, String sellerPwd, String updateSellerPwd) {
		if(bcryptPasswordEncoder.matches(sellerPwd, ((Seller)(session.getAttribute("loginSeller"))).getSellerPwd())) {
			
			String encPwd =bcryptPasswordEncoder.encode(updateSellerPwd);
			
			s.setSellerPwd(encPwd);
			
			int result = sellerService.updateSellerPwd(s);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "성공적으로 비밀번호가 수정되었습니다.");
				
				return "redirect:/";
			} else {
				
				model.addAttribute("errorMsg","로직 에러 발생");
				
				return "common/errorPage";
				
			} 
			
		} else {
			
			model.addAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
			
			return "common/errorPage";
			
		}
		
	}
	
	// 회원탈퇴
	@RequestMapping("delete.se")
	public String deleteSeller(String sellerId,
							   String sellerPwd,
							   HttpSession session,
							   Model model) {
		
		String encPwd = ((Seller)session.getAttribute("loginSeller")).getSellerPwd();
		
		if(bcryptPasswordEncoder.matches(sellerPwd, encPwd)) {
			
			int result = sellerService.deleteSeller(sellerId);
			
			if(result > 0) {
				
				session.removeAttribute("loginSeller");
				
				session.setAttribute("alertMsg", "성공적으로 탈퇴했습니다. 감사했습니다.");
				
				System.out.println(sellerId);
				System.out.println(sellerPwd);
				
				return "redirect:/";
				
			} else {
				
				model.addAttribute("errorMsg", "회원탈퇴실패");
				
				return "common/errorPage";
				
			}
			
		} else {
			
			session.setAttribute("alertMsg", "비밀번호를 잘못입력했습니다. 다시 한번 확인해주세요");
			
			return "redirect:/sellerPage";
			
		}
		
	}
	
	
	
	// 아이디 중복체크 만들어야함 
	
	
    // 판매자 프로필 사진
    private String handleFileUpload(MultipartFile file) {
        
        String uploadDirectory = "/path/to/upload/directory";
        
        String fileName = file.getOriginalFilename();
        
        String filePath = uploadDirectory + "/" + fileName;

        return "/images/" + fileName; 
    }
    
    
	
	// 아이디 찾기
	@GetMapping("/find-id1")
	public String sellerId(HttpSession session) {
		if(session.getAttribute("loginUser") != null) { // 로그인상태
			
			session.setAttribute("alertMsg", "이미 로그인 되어있습니다.");
			
			return "redirect:/";
		}
		else {
			return "seller/sellerIdFind";
		}
	}	
	@PostMapping("/found-id1")
	public String findIdByEmail(String email, Model model) {
		
		String foundId = sellerService.findSellerIdByEmail(email);
		
		if (foundId != null) {
			model.addAttribute("foundId", foundId);
			return "seller/found-id";
			
		} else {
			model.addAttribute("error", "님 이거 이메일 못찾음");
			return "seller/found-id";
		}
	}
}
