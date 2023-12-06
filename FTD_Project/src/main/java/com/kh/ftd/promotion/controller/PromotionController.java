package com.kh.ftd.promotion.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ftd.promotion.model.service.PromotionService;
import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionFile;
import com.kh.ftd.promotion.model.vo.PromotionReply;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;


@Controller
public class PromotionController {

	@Autowired
	private PromotionService promotionService;
	
	@RequestMapping(value = "plist.bo")
	public String promotionListView() {
		
		return "promotion/promotionListView";
	}
	
	@RequestMapping(value = "pdlist.bo")
	public ModelAndView  promotionDetailView(int pno, ModelAndView mv) {
		

		
		//System.out.println(pno); 이 게시글의 번호가 뽑힘
		
		//1. 해당 게시글의 조회수 증가용 서비스 호출
				int result = promotionService.increaseCount(pno);
				
				// 2. 조회수 증가에 성공했다면 해당 게시글 상세조회 서비스 호출
				if(result > 0) { // 성공
					
					//System.out.println("성공");
					
					//이 홍보게시글의 내용 , 조횟수
					Promotion p = promotionService.selectPromotion(pno);
					//System.out.println(p);
					
					//즉, sellerNo 구할수있음
					int sno = p.getSellerNo();
					
					//이 홍보게시글의 사진 //슬라이드 형식?
					ArrayList<PromotionFile> pfList = promotionService.selectPromotionFileList2(pno);
					//System.out.println(pfList);
					
					//이 홍보게시글의 댓글
					ArrayList<PromotionReply> prList = promotionService.selectPromotionReplyList(pno);
					//System.out.println(prList);
					
					//이 홍보게시글의 댓글개수
					int replyList =  promotionService.PromotionReplyCount(pno);
					
					//이 홍보게시글 마켓,지역
					Seller seller = promotionService.selectSellerList(sno);
					//System.out.println(seller);
					
					//이 홍보게시글 마켓 프로필
					SellerFile sellerFile = promotionService.selectSellerFileProfileList(sno);
					//System.out.println(sellerFile);
					
					//이 홍보게시글의 별점
					double starRating = promotionService.marketStarRating(sno);
					//System.out.println(starRating);
					
					//이 마켓의 후기 갯수
					int reviewCount = promotionService.reviewCount(sno);
					//System.out.println(reviewCount);
					
					
					// 조회된 데이터를 담아서 상세보기 페이지로 포워딩
					mv.addObject("p", p).addObject("pfList", pfList).addObject("prList",prList).addObject("seller",seller)
					.addObject("sellerFile",sellerFile).addObject("starRating",starRating).addObject("replyList", replyList)
					.addObject("reviewCount", reviewCount)
					  .setViewName("promotion/promotionDetailView"); 
					// /WEB-INF/views/board/boardDetailView.jsp
					
				} else { // 실패a
					
					// 에러문구를 담아서 에러페이지로 포워딩
					mv.addObject("errorMsg", "게시글 상세조회 실패")
					  .setViewName("common/errorPage");
				}
				
				return mv;
		
		
		
	}
	
	@RequestMapping(value = "enrollForm.bo")
	public String enrollForm(int sno, Model mv) {
		
		Seller seller = promotionService.selectSellerList(sno);
		SellerFile sellerFile = promotionService.selectSellerFileProfileList(sno);
		
		mv.addAttribute("seller", seller);
		mv.addAttribute("sellerFile", sellerFile);
		
		return "promotion/promotionEnrollForm";
	}
	
	
	@PostMapping(value = "insert.bo")
	public String insertPromotion(Promotion p,
								MultipartFile upfile[],
								HttpSession session,
								PromotionFile pf,
								Model model) {
		//System.out.println(p);
		
		int result = promotionService.insertPromotion(p);
		//System.out.println(result);
		
		for(int i = 0; i < upfile.length; i++) {
			if(!upfile[i].getOriginalFilename().equals("")) {
				
				String changeName = saveFile(upfile[i], session);

				pf.setOriginalName(upfile[i].getOriginalFilename());
				pf.setChangeName("resources/uploadFiles/promotion/" + changeName);
				// System.out.println(nf);
				promotionService.insertFile(pf);
			}
		}
		
		// 이 시점 기준으로
		// 넘어온 첨부파일이 있었을 경우 (if문을 거쳤기 때문)
		// Board b : 제목, 작성자아이디, 내용, 원본파일명, 수정파일명
		// 넘어온 첨부파일이 없었을 경우 (if문을 거치지 않았기 때문)
		// Board b : 제목, 작성자아이디, 내용
		
		
		if(result > 0) { // 게시글 작성 성공
			// => alert 문구를 담고
			//    list.bo 로 url 재요청
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
			return "redirect:/plist.bo";
			
		} else { // 게시글 작성 실패
			// => 에러문구를 담아서 에러페이지로 포워딩
			
			//model.addAttribute("errorMsg", "게시글 등록 실패");
			
			// /WEB-INF/views/common/errorPage.jsp
			return "common/errorPage";
		}
		
		
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "getLegacyData.bo" , produces = "application/json; charset=UTF-8")
	public String ajaxpromotionListView(int page, int size) {
		
		
		int promotionNo = 0;
		int sellerNo = 0;
		
		
		
		//홍보리스트 내용
		ArrayList<Promotion> pList = promotionService.selectPromotionList();
		//System.out.println(pList); //홍보리스트 다 불어와짐
		
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
	
	
	
	// ----------------------------------------------

	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 역할
	// 스프링의 Controller 클래스에는 
	// 무조건 요청을 받아주는 메소드만 만들 필요가 없음!!
	public String saveFile(MultipartFile upfile,
						   HttpSession session) {
		String changeName = null;
		// 파일명 수정 작업 진행 후 서버로 업로드 시키기
		// 예) "bono.jpg" => "2023110810223012345.jpg"
		// 1. 원본파일명 뽑아오기 ("bono.jpg")
		String originName = upfile.getOriginalFilename();
		
		// 2. 시간 형식을 문자열로 뽑아내기
		// "20231108102230" (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss")
												.format(new Date());
		
		// 3. 뒤에 붙을 5자리 랜덤수 뽑기 (10000 ~ 99999)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 4. 원본파일명으로 부터 확장자명을 뽑아오기
		// ".jpg"
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 5. 모두 이어 붙이기
		changeName = currentTime + ranNum + ext;
		
		// 6. 업로드 하고자 하는 물리적인 경로 알아내기
		String savePath = session.getServletContext()
				.getRealPath("/resources/uploadFiles/promotion/");
		
		// 7. 경로와 수정파일명을 합체 후 파일을 업로드 해주기
//		 System.out.println("originName : " + originName);
//		 System.out.println("changeName : " + changeName);
//		 System.out.println("savePate : " + savePath);
		try {
			
			upfile.transferTo(new File(savePath + changeName));
		
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		
		// 8. 만들어진 수정파일명을 문자열로 리턴
		return changeName;
	}
	
	
}
