package com.kh.ftd.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
import com.kh.ftd.promotion.model.vo.PromotionReply;
import com.kh.ftd.review.model.service.ReviewService;
import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.review.model.vo.ReviewFile;
import com.kh.ftd.review.model.vo.ReviewReply;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "rlist.bo")
	public String reviewListView() {
		
		return "review/reviewListView";
	}
	
	@ResponseBody
	@RequestMapping(value = "getReviewLegacyData.bo" , produces = "application/json; charset=UTF-8")
	public String ajaxpromotionListView(int page, int size, Model m) {
		
		
		int rno = 0;
		String mno = "";
		int gno = 0;
		
		
		
		//후기리스트 내용
		ArrayList<Review> rList = reviewService.selectReviewList();
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
	
	@RequestMapping(value = "rdlist.bo")
	public ModelAndView  promotionDetailView(int rno, ModelAndView mv) {
		

		
		//System.out.println(rno); //이 게시글의 번호가 뽑힘
		
		//1. 해당 게시글의 조회수 증가용 서비스 호출
				int result = reviewService.increaseCount(rno);
			
				// 2. 조회수 증가에 성공했다면 해당 게시글 상세조회 서비스 호출
				if(result > 0) { // 성공
					
					//System.out.println("성공");
					
					//이 후기리스트의 내용 , 조횟수 , 이름 , 별점 등등
					Review r = reviewService.selectReview(rno);
					//System.out.println(r);
			
					//즉, MemberNo , GoodNo 구할수있음
					String mno = r.getMemberNo();
					int gno = r.getGoodNo(); 	
					
					//이 후기리스트의 사진 //슬라이드 형식?
					ArrayList<ReviewFile> rfList = reviewService.selectReviewFileList(rno);
					//System.out.println(rfList);
						
					//이 후기리스트의 댓글
					ArrayList<ReviewReply> rrList = reviewService.selectReviewReplyList(rno);
					//System.out.println(rrList);
					
					//이 후기리스트의 상품 사진
					GoodsFile goodsFileList = reviewService.selectGoodsFileList(gno);
					//System.out.println(goodsFileList);
					
					//이 후기리스트의 상품 제목
					GoodsSell goodsList = reviewService.selectGoodsList(gno);
					//System.out.println(goodsList);
					
					// 조회된 데이터를 담아서 상세보기 페이지로 포워딩
					mv.addObject("r", r).addObject("rfList", rfList).addObject("rrList",rrList).addObject("goodsFileList",goodsFileList)
					.addObject("goodsList",goodsList).setViewName("review/reviewDetailView"); 
					// /WEB-INF/views/board/boardDetailView.jsp
						
				} else { // 실패
					
					// 에러문구를 담아서 에러페이지로 포워딩
					mv.addObject("errorMsg", "게시글 상세조회 실패")
					  .setViewName("common/errorPage");
				}
		
				return mv;
		
		
		
	}
	
	
	//-----------------------------댓글 작성 서비스---------------------------------------------------
		@ResponseBody
		@RequestMapping(value="selectReviewReplyList.bo", produces = "application/json; charset=UTF-8")
		public String selectReplyList(int rno) {
			
			//System.out.println(rno);
			
			ArrayList<ReviewReply> rrList = reviewService.selectReviewReplyList(rno);
			
			//System.out.println(rrList);
			
			return new Gson().toJson(rrList);
		}
		
		@ResponseBody
		@RequestMapping(value="insertReviewReply.bo" , produces = "text/html; charset=UTF-8")
		public String insertReviewReply(ReviewReply rr
										  , Model model
										  , HttpSession session) {
			
			//System.out.println(rr);
			
			int result = reviewService.insertReviewReply(rr);
			
			
			  return (result > 0) ? "success" : "fail";
			}
		
		@ResponseBody
		@RequestMapping(value="updateReviewReply.bo", produces = "text/html; charset=UTF-8")
		public String updatePromotionReply(ReviewReply rr
										  , Model model
										  , HttpSession session) {	
			
			//System.out.println(rr);
			
			int result = reviewService.updateReviewReply(rr);

				//System.out.println(result);
				
			 return (result > 0) ? "success" : "fail";
			}
		
		@RequestMapping(value="deleteReviewReply.bo")
		public String deletePromotionReply(ReviewReply rr
										  , Model model
										  , HttpSession session) {
			
			//System.out.println(rr);
			
			
			int result = reviewService.deleteReviewReply(rr);
			//System.out.println(result);
			
			if(result > 0) { // 댓글 삭제 성공
		
			
			session.setAttribute("alertMsg", "성공적으로 댓글이 삭제되었습니다.");
				
				return "redirect:/pdlist.bo?pno=" + rr.getRevNo();
			
			} else { // 삭제 실패
				// => 에러문구를 담아서 에러페이지로 포워딩
				
				model.addAttribute("errorMsg", "댓글 등록 실패");
				
				return "common/errorPage";
			}
		
			
		}
		
		@RequestMapping("deleteReview.bo")
		public String deleteNotice(int rno,
								  String filePath,
								  Model model,
								  HttpSession session) {
			
			// bno 에는 post 방식으로 넘겨받은 글번호가 들어가있음
			//System.out.println(rno);
			//System.out.println(filePath); //지금 널이담김 노티스 디테일뷰 보면서 수정해야뎀
			
			
			// 삭제 요청
			int result = reviewService.deleteReview(rno);
			
			if(result > 0) { // 삭제 성공
				// => alert 문구를 담아 게시판 리스트 페이지로 url 재요청
				
				// 기존에 첨부파일이 있었을 경우
				// 서버로부터 해당 첨부파일 삭제하기
				
				// filePath 라는 매개변수에는
				// 기존에 첨부파일이 있었을 경우 수정파일명
				// 기존에 첨부파일이 없었을 경우 "" 이 들어가 있음
				if(filePath != null) {
					// 기존에 첨부파일이 있었을 경우
					// => 해당 파일을 삭제처리
					String[] list = filePath.split(",");
					// 해당 파일이 실제 저장되어있는 경로 알아내기
					for(int i = 0; i < list.length; i++) {
						
						reviewService.deleteReviewFile(rno);
					}
				}
				
				session.setAttribute("alertMsg", "성공적으로 글이 삭제되었습니다.");
				
				return "redirect:/rlist.bo";
				
			} else { // 삭제 실패
				// => 에러문구를 담아서 에러페이지로 포워딩
				
				model.addAttribute("errorMsg", "게시글 삭제 실패");
				
				return "common/errorPage";
			}
		}
		
		
	
}
