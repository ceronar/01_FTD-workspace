package com.kh.ftd.seller.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

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
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
import com.kh.ftd.order.model.service.OrderService;
import com.kh.ftd.order.model.vo.OrderGoods;
import com.kh.ftd.promotion.model.service.PromotionService;
import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionFile;
import com.kh.ftd.review.model.service.ReviewService;
import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.review.model.vo.ReviewFile;
import com.kh.ftd.seller.model.service.SellerService;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private PromotionService promotionService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private ReviewService reviewService;
	
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
		//System.out.println(startPage);
		//System.out.println(endPage);
		
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
	
	//판재자 서브메뉴 이 마켓 홍보 리스트 조회
	@ResponseBody
	@RequestMapping(value = "list.pr" , produces = "application/json; charset=UTF-8")
	public String selectSellerPromotion(int sno , int page, int size) {
		
		int promotionNo = 0;
		int sellerNo = 0;
		
		//System.out.println(sellerNo);
		
		//홍보리스트(이 마켓의)
		ArrayList<Promotion> pList = promotionService.selectPromotionSellerList(sno);
		//System.out.println(pList);
		
		for(int i = 0; i < pList.size(); i++) {
			if(pList.get(i).getPromotionContent().length() > 80) {
				String s = pList.get(i).getPromotionContent();
				pList.get(i).setPromotionContent(s.substring(0, 77) + "...");
			}
		}
		
		//홍보리스트 판매자용 어레이 리스트
		ArrayList<Object> sList = new ArrayList<Object>();
		
		//홍보리스트 마켓프로필사진조회 어레이 리스트
		ArrayList<SellerFile> sfList = new ArrayList<SellerFile>();
		
		//홍보리스트 사진조회 어레이 리스트
		ArrayList<Object> pfList = new ArrayList<Object>();
		
		//댓글 개수 담을 곳
		ArrayList<Object> rList = new ArrayList<Object>();
		
	
			
		//진짜 다 담을 곳
		ArrayList<Object> arrList2 = new ArrayList<Object>();
		
		//총 DB의 홍보게시글개수
		int TOTAL_ITEMS = pList.size();
		//System.out.println(pList.size());
		
		int start = page * size;
		 
	    int end = Math.min(start + size, TOTAL_ITEMS);
		
		for(Promotion p : pList) {
			promotionNo = p.getPromotionNo();
			sellerNo = p.getSellerNo();
		
		//홍보리스트 판매자
		Seller sellerList = promotionService.selectSellerList(sellerNo);
		//System.out.println(sellerList);
		sList.add(sellerList);
		
		//홍보리스트 마켓프로필사진조회 리스트
		SellerFile sellerFileList = promotionService.selectSellerFileProfileList(sellerNo);
		//System.out.println(sellerFileList); 
		sfList.add(sellerFileList);
		
		//홍보리스트 사진조회 리스트
		ArrayList<PromotionFile> pFileList = promotionService.selectPromotionFileList(promotionNo);
		//System.out.println(pFileList);
		pfList.add(pFileList);
	
		//각 홍보리스트 댓글갯수
		int replyList =  promotionService.PromotionReplyCount(promotionNo);
		//System.out.println(replyList); 
	
		rList.add(replyList);
		
		
		}
		
		//System.out.println(pList);
		//System.out.println(sList);
		//System.out.println(sfList);
		//System.out.println(pfList);
		//System.out.println(rList);
		
		//System.out.println(pfCount);

		
	
		
	
	  
//	  // * 테스트용
//	    ArrayList<String> list 
//					=  new ArrayList<String>();
//
		
	        for (int i = start; i < end; i++) {
	        	
	        	ArrayList<Object> arrList = new ArrayList<Object>();
	        	
	        	arrList.add(pList.get(i));
	        	arrList.add(sList.get(i));
	        	arrList.add(sfList.get(i));
	        	arrList.add(pfList.get(i));
	        	arrList.add(rList.get(i));
	        	
	        	//System.out.println(arrList);
	        	arrList2.add(arrList);
	        	//System.out.println(i); // 순서대로 0~4 5개라쳣을때
	    		
  }
	        //System.out.println(arrList2);
	       // System.out.println("*"+arrList2.size()); //띄워질요소사이즈

		// Gson gson = new Gson();
		// return gson.toJson(list);
		
	        return new Gson().toJson(arrList2);
	}
	
	//판매자 서브메뉴 이 후기리스트 조회
	@ResponseBody
	@RequestMapping(value = "list.re" , produces = "application/json; charset=UTF-8")
	public String ajaxpromotionListView(int sno, int page, int size, Model m) {
		
		
		int rno = 0;
		String mno = "";
		int gno = 0;
		 
		//System.out.println(sno);
		
		
		//후기리스트 내용
		ArrayList<Review> rList = reviewService.selectReviewSellerList(sno);
		//System.out.println(rList); //홍보리스트 다 불어와짐 + 구매자 이름 + 구매자 후기내용
		// + 별점까지가지고있음
		
		for(int i = 0; i < rList.size(); i++) {
			if(rList.get(i).getRevContent().length() > 80) {
				String s = rList.get(i).getRevContent();
				rList.get(i).setRevContent(s.substring(0, 77) + "...");
			}
		}
		
		
		//후기리스트 사진조회 어레이 리스트
		ArrayList<Object> rfList = new ArrayList<Object>();
		
		//후기리스트 상품사진 어레이 리스트
		ArrayList<Object> gfList = new ArrayList<Object>();

		//댓글 개수 담을 곳 + 그냥 이거안쓰고 댓글배열.size() 해도댐
		ArrayList<Object> replyList = new ArrayList<Object>();
		
		//후기리스트 상품사진 제목,상세정보
		ArrayList<Object> gList = new ArrayList<Object>();
		
			
		//진짜 다 담을 곳
				ArrayList<Object> arrList2 = new ArrayList<Object>();
		
		//총 DB의 홍보게시글개수
		int TOTAL_ITEMS = rList.size();
		//System.out.println(rList.size());
		
		int start = page * size;
		 
	    int end = Math.min(start + size, TOTAL_ITEMS);
		
		for(Review r : rList) {
			rno = r.getRevNo();
			mno = r.getMemberNo();
			gno = r.getGoodNo();
		
		
		//후기리스트 사진조회 리스트
		ArrayList<ReviewFile> rFileList = reviewService.selectReviewFileList(rno);
		//System.out.println(rFileList);
		rfList.add(rFileList);
		
		//각 홍보리스트 댓글갯수
		int reply =  reviewService.ReviewReplyCount(rno);
		//System.out.println(reply); 
		replyList.add(reply);
		
	
		//후기리스트 상품사진
		GoodsFile goodsFileList = reviewService.selectGoodsFileList(gno);
		//System.out.println(goodsFileList);
		gfList.add(goodsFileList);
	
		//후기리스트 상품제목
		GoodsSell goodsList = reviewService.selectGoodsList(gno);
		//System.out.println(goodsList);
		gList.add(goodsList);
		}
		
			
		//System.out.println(rList);
		//System.out.println(rfList);
		//System.out.println(gfList);
		//System.out.println(replyList);


//	  // * 테스트용
//	    ArrayList<String> list 
//					=  new ArrayList<String>();
//
		
	        for (int i = start; i < end; i++) {
	        	
	        	ArrayList<Object> arrList = new ArrayList<Object>();
	        	
	        	arrList.add(rList.get(i));
	        	arrList.add(rfList.get(i));
	        	arrList.add(gfList.get(i));
	        	arrList.add(replyList.get(i));
	        	arrList.add(gList.get(i));
	        	
	        	//System.out.println(arrList);
	        	arrList2.add(arrList);
	        	//System.out.println(i); // 순서대로 0~4 5개라쳣을때
	    		
  }
	        //System.out.println(arrList2);
	       // System.out.println("*"+arrList2.size()); //띄워질요소사이즈

		// Gson gson = new Gson();
		// return gson.toJson(list);
		
	        return new Gson().toJson(arrList2);
	
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
	public String sellerPage(HttpSession session) {
		SellerFile sf = sellerService.getSellerFile(((Seller)session.getAttribute("loginSeller")).getSellerNo());
		session.setAttribute("profileImage", sf);
		return "seller/sellerPage";
	}
	
	// 회원정보 변경 
	@RequestMapping(value = "update.se", method = RequestMethod.POST)
    public String updateSeller(
            Seller s,
            Model model,
            HttpSession session,
            @RequestPart("upFile") MultipartFile upfile, HttpServletRequest req) {
		
        if (upfile != null && !upfile.isEmpty()) {
        	
        	String uploadDirectory = req.getRealPath("/resources/uploadFiles/sellerPage");
            
            String fileName = UUID.randomUUID() + "_" + upfile.getOriginalFilename();
            
            String filePath = uploadDirectory + "/" + fileName;
            
            // String imageUrl = handleFileUpload(upfile);
            
            s.setChangeName(filePath);
            
            SellerFile sf = new SellerFile(-1, s.getSellerNo(), upfile.getOriginalFilename(), "/resources/uploadFiles/sellerPage" + "/" + fileName, null, null);
            
            int upfile_delete = sellerService.deleteSellerFile(s.getSellerNo());
            int upfile_result = sellerService.sellerFile(sf);
            
            if(upfile_result > 0) {
            	File f = new File(filePath);
                
                try {
    				upfile.transferTo(f);
    			} 
                catch (IllegalStateException | IOException e) {
    				e.printStackTrace();
    			}
            }
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
				
				//System.out.println(sellerId);
				//System.out.println(sellerPwd);
				
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
	
	/*
    // 판매자 프로필 사진
	@RequestMapping("updateFile.se")
    private String handleFileUpload(MultipartFile file) {
        
        String uploadDirectory = "/path/to/upload/directory";
        
        String fileName = file.getOriginalFilename();
        
        String filePath = uploadDirectory + "/" + fileName;

        return "/images/" + fileName; 
    }
    */
    
	
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
	
	@RequestMapping("orderGoodsList.se")
	public void sellerOrderGoodsList(HttpSession session, Model model) {
		
		Seller loginSeller = (Seller)session.getAttribute("loginSeller");
		int sellerNo = loginSeller.getSellerNo();
		
		ArrayList<OrderGoods> list = orderService.sellerOrderGoodsList(sellerNo);
		
	}
}
