package com.kh.ftd.review.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.review.model.service.ReviewService;
import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.review.model.vo.ReviewFile;

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
		
		
		int revNo = 0;
		int memberNo = 0;
		int goodNo = 0;
		
		
		
		//홍보리스트 내용
		ArrayList<Review> rList = reviewService.selectReviewList();
		System.out.println(rList); //홍보리스트 다 불어와짐 + 구매자 이름 + 구매자 후기내용
		// + 별점까지가지고있음
		
		
		//후기리스트 사진조회 어레이 리스트
		ArrayList<Object> rfList = new ArrayList<Object>();
		
		//후기리스트 상품사진 어레이 리스트
		ArrayList<Object> gfList = new ArrayList<Object>();

		//댓글 개수 담을 곳 + 그냥 이거안쓰고 댓글배열.size() 해도댐
		ArrayList<Object> replyList = new ArrayList<Object>();
		
	
			
		//진짜 다 담을 곳
				ArrayList<Object> arrList2 = new ArrayList<Object>();
		
		//총 DB의 홍보게시글개수
		int TOTAL_ITEMS = rList.size();
		//System.out.println(rList.size());
		
		int start = page * size;
		 
	    int end = Math.min(start + size, TOTAL_ITEMS);
		
		for(Review r : rList) {
			revNo = r.getRevNo();
			memberNo = r.getMemberNo();
			goodNo = r.getGoodNo();
		
		
		//후기리스트 사진조회 리스트
		ArrayList<ReviewFile> rFileList = reviewService.selectReviewFileList(revNo);
		//System.out.println(rFileList);
		rfList.add(rFileList);
		
		//각 홍보리스트 댓글갯수
		int reply =  reviewService.ReviewReplyCount(revNo);
		System.out.println(reply); 
		//replyList.add(reply);
		
	/*	
		//후기리스트 상품사진
		GoodsFile goodsFileList = reviewService.selectGoodsFileList(sellerNo);
		//System.out.println(sellerList);
		//sList.add(sellerList);
	*/	
		}
		/*	
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
	
	
*/
		
		return "";
	
	}
}
