package com.kh.ftd.review.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
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
	
	
}
