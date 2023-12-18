package com.kh.ftd.goods.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.ftd.goods.model.service.GoodsService;
import com.kh.ftd.goods.model.vo.Goods;
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
import com.kh.ftd.member.model.vo.Like;
import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.order.model.vo.Cart;
import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.seller.model.vo.Seller;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	// 상품 추천 페이지 이동
	@RequestMapping("goodsRecommendPage.go")
	public String goodsRecommendPage() {
		
		return "goods/goodsRecommendView";
	}
	
	// 상품 베스트 페이지 이동
	@RequestMapping("goodsBestPage.go")
	public String goodsBestPage() {
		
		return "goods/goodsBestView";
	}

	// 상품 페이지 이동
	@RequestMapping("goodsListPage.go")
	public String goodsListPage() {
		
		return "goods/goodsListView";
	}
	
	// 상품 리스트 조회
	@ResponseBody
	@RequestMapping(value = "ajaxSelectGoodsList.go" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectGoodsList(int page, int pageSize) {
		
		// 상품 판매 정보
		ArrayList<GoodsSell> gsList = goodsService.ajaxSelectGoodsSellList();
		
		// 상품 리스트
		ArrayList<Goods> gList = new ArrayList<>();
		
		// System.out.println(gList);
				
		// 상품 파일
		ArrayList<GoodsFile> gfList = new ArrayList<>();
		
		// 상품 평균 별점
		ArrayList<Object> starList = new ArrayList<>();
		
		// 상품 댓글 수
		ArrayList<Object> replyList = new ArrayList<>();
	
		// 상품 총 리스트 수
		int totalList = gsList.size();
		
		//System.out.println(totalList);
		
		int startPage = page * pageSize;
		
		int endPage = Math.min(startPage + pageSize, totalList);		
		
		if(totalList < 0) { // 조회할 상품이 없을 경우
			
			return "조회할 상품이 없습니다.";
			
		} else { // 조회할 상품이 있을 경우
					
			for(GoodsSell gs : gsList) {
				
				int goodNo = gs.getGoodNo();
				int sellNo = gs.getSellNo();
				//System.out.println(goodNo);
				
				// 상품 판매 정보
				Goods goods = goodsService.ajaxSelectGoodsList(goodNo);
				if(goods != null) {		
					
					gList.add(goods);			
				} else {
					
					goods = new Goods();
					gList.add(goods);				
				}
						
				// 상품 파일
				GoodsFile goodsFile = goodsService.ajaxSelectGoodsMainFileList(sellNo);
				if(goodsFile != null) { // 상품 파일이 있을 시
					
					gfList.add(goodsFile);
					
				} else { // 상품 파일이 없을 시
					
					goodsFile = new GoodsFile();
					gfList.add(goodsFile);
					
				}
							
				// 상품 평균 별점
				double starRating = goodsService.ajaxSelectStarRating(goodNo);
				starList.add(starRating);
				
				// 상품 댓글 수
				int reply = goodsService.ajaxSelectReplyCount(sellNo);
				replyList.add(reply);				
				
			}
			
		}

		ArrayList<Object> resultList = new ArrayList<>();
		
		for (int i = startPage; i < endPage; i++) {
			
			ArrayList<Object> arrList = new ArrayList<>();
			
			arrList.add(gList.get(i));
			arrList.add(gsList.get(i));
			arrList.add(gfList.get(i));
			arrList.add(starList.get(i));
			arrList.add(replyList.get(i));
			
			// 상품 전체 리스트
			resultList.add(arrList);		
			
		}	

		return new Gson().toJson(resultList);			
	}
	
	// 상품 리스트 상세 페이지 이동
	@RequestMapping("goodsDetailPage.go")
	public String goodsDetailPage(int sno, Model model) {
			
		// 상품 번호
		int sellNo = sno;
		
		// System.out.println("컨트롤" + sno);
			
		// 조회수 증가
		int result = goodsService.updateGoodsCount(sellNo);	
		
		if(result > 0) { // 조회수 증가
			
			// 상품 글 정보
			GoodsSell goodsSell = goodsService.selectGoodsSell(sellNo);
				
			int goodNo = goodsSell.getGoodNo();
			
			// 상품 정보
			Goods goods = goodsService.selectGoodsByGoodNo(goodNo);			
			
			// 상품 파일 정보
			GoodsFile goodsFile = goodsService.ajaxSelectGoodsMainFileList(sellNo);
			
			// 상품의 후기
			ArrayList<Review> r = goodsService.selectGoodReview(goodNo);
			//System.out.println(goodNo);
			System.out.println(r);
			
			// System.out.println(goodsFile);
			
			if(goodsFile == null) { // 상품 파일이 없을 시
				
				goodsFile = new GoodsFile();				
			}
			
			model.addAttribute("goodsSell", goodsSell);
			model.addAttribute("goods", goods);
			model.addAttribute("goodsFile", goodsFile);
			model.addAttribute("r", r);	
			
			return "goods/goodsDetailView";
	
		} else { // 조회수 증가 실패
			
			model.addAttribute("errorMsg","해당 상품글의 상세 페이지로 이동이 불가합니다.");
			
			return "common/errorPage";
			
		}
		
	}
	
	// 판매자 상품 페이지 이동
	@RequestMapping("sellerGoodsListPage.go")
	public String sellerGoodsListPage() {
		
		return "goods/sellerGoodsListView";
	}
	
	// 판매자 상품 글 페이지 이동
	@RequestMapping("sellerGoodsTextListPage.go")
	public String sellerGoodsTextListPage() {
		
		return "goods/sellerGoodsTextListView";
	}
	
	// 판매자 상품 리스트 조회
	@ResponseBody
	@RequestMapping(value = "ajaxSelectSellerGoodsList.go" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectSellerGoodsList(int page, int pageSize, int sellerNo) {
		
		// 판매자 상품 리스트
		ArrayList<Goods> gList = goodsService.ajaxSelectSellerGoodsList(sellerNo);
		
		// 마켓 총 리스트 수
		int totalList = gList.size();
		// System.out.println(totalList);
		
		int startPage = page * pageSize;
		
		int endPage = Math.min(startPage + pageSize, totalList);
		
		ArrayList<Object> resultList = new ArrayList<>();
		
		for (int i = startPage; i < endPage; i++) {
			
			resultList.add(gList.get(i));
			
		}
		
		return new Gson().toJson(resultList);
	}
	
	// 판매자 상품 등록 페이지 이동
	@RequestMapping("sellerGoodsEnrollForm.go")
	public String sellerGoodsEnrollFormPage() {
		
		return "goods/sellerGoodsEnrollForm";
	}
	
	// 판매자 상품 등록 
	@RequestMapping("insertSellerGoods.go")
	public String insertSellerGoods(HttpSession session, Goods goods) {
			
		int result = goodsService.insertSellerGoods(goods); 
		
		if(result > 0) { // 상품 등록 성공 
			
			session.setAttribute("successMsg", "상품 등록을 성공했습니다.");
			
			return "redirect:/sellerGoodsListPage.go";
			
			
		} else { // 상품 등록 실패
			
			session.setAttribute("successMsg", "상품 등록을 실패했습니다.");
			
			return "redirect:/sellerGoodsListPage.go";
		}
		
	}
	
	// 판매자 상품 글 리스트 조회
	@ResponseBody
	@RequestMapping(value = "ajaxSelectSellerGoodsTextList.go" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectSellerGoodsTextList(int page, int pageSize, int sellerNo) {
			
		// 상품 판매 정보
		ArrayList<GoodsSell> gsList = goodsService.ajaxSelectSellerGoodsTextList(sellerNo);
		
		// 상품 리스트
		ArrayList<Goods> gList = new ArrayList<>();
		
		// 상품 파일
		ArrayList<GoodsFile> gfList = new ArrayList<>();
		
		// 상품 평균 별점
		ArrayList<Object> starList = new ArrayList<>();
		
		// 상품 댓글 수
		ArrayList<Object> replyList = new ArrayList<>();
	
		// 상품 총 리스트 수
		int totalList = gsList.size();
		
		//System.out.println(totalList);
		
		int startPage = page * pageSize;
		
		int endPage = Math.min(startPage + pageSize, totalList);		
				
		for(GoodsSell gs : gsList) {
			
			int goodNo = gs.getGoodNo();
			int sellNo = gs.getSellNo();
			
			// System.out.println(goodNo);
			
			// 상품 판매 정보
			Goods goods = goodsService.ajaxSelectGoodsByGoodNo(goodNo);			
			gList.add(goods);
			
			// 상품 파일
			GoodsFile goodsFile = goodsService.ajaxSelectGoodsMainFileList(sellNo);
			if(goodsFile != null) { // 상품 파일이 있을 시
				
				gfList.add(goodsFile);
				
			} else { // 상품 파일이 없을 시
				
				goodsFile = new GoodsFile();
				gfList.add(goodsFile);
						
			}
			
			// 상품 평균 별점
			double starRating = goodsService.ajaxSelectStarRating(goodNo);
			starList.add(starRating);
			
			// 상품 댓글 수
			int reply = goodsService.ajaxSelectReplyCount(sellNo);
			replyList.add(reply);
			
		}

		ArrayList<Object> resultList = new ArrayList<>();
		
		for (int i = startPage; i < endPage; i++) {
			
			ArrayList<Object> arrList = new ArrayList<>();
			
			arrList.add(gList.get(i));
			arrList.add(gsList.get(i));
			arrList.add(gfList.get(i));
			arrList.add(starList.get(i));
			arrList.add(replyList.get(i));
			
			// 상품 전체 리스트
			resultList.add(arrList);		
						
		}
			
		return new Gson().toJson(resultList);
					
	}
	
	// 판매자 상품 글 등록 페이지 이동
	@RequestMapping("sellerGoodsTextEnrollForm.go")
	public String sellerGoodsTextEnrollFormPage(HttpSession session) {
		
		Seller loginSeller = (Seller)session.getAttribute("loginSeller");
		
		int sellerNo = loginSeller.getSellerNo();
		
		ArrayList<Goods> goodTitle = goodsService.ajaxSelectSellerGoodTitle(sellerNo);
		
		if(goodTitle.size() == 0 ) {
			
			session.setAttribute("alertMsg", "상품을 먼저 등록해주세요.");
		}
		
		return "goods/sellerGoodsTextEnrollForm";
	}
	
	@ResponseBody
	@RequestMapping(value="uploadFile.go", produces = "text/html; charset=utf-8")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request)  {
		
		String changeName = saveFile(multipartFile, request.getSession());
		String originName = multipartFile.getOriginalFilename();
		
		return "resources/uploadFiles/goods/" + changeName;
				
	}
	
	// 판매자 상품 글 등록 
	@RequestMapping("insertSellerGoodsText.go")
	public String insertSellerGoodsText(HttpSession session, GoodsSell goodsSell, MultipartFile upfile) {		
		
		GoodsFile goodsFile = new GoodsFile();
		
		int goodNo = goodsSell.getGoodNo();
		
		System.out.println(goodNo);
			
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			
			goodsFile.setOriginalName(upfile.getOriginalFilename());
			goodsFile.setChangeName("resources/uploadFiles/goods/"+ changeName);
			
		}
		
		int result = goodsService.insertSellerGoodsText(goodsSell);	
		
		if(result > 0) { // 상품 등록 성공 
			
			GoodsSell selectText = goodsService.selectGoodsTextByGoodNo(goodNo);			
			
			int sellNo = selectText.getSellNo();			
			
			goodsFile.setSellNo(sellNo);		
			
			int resultFile = goodsService.insertGoodsFile(goodsFile);
						
			if(resultFile > 0) {
				
				session.setAttribute("successMsg", "상품 글 등록을 성공했습니다.");
				
				return "redirect:/sellerGoodsTextListPage.go";
			
			} else {
				
				session.setAttribute("successMsg", "상품 글 등록을 실패했습니다.");
				
				return "redirect:/sellerGoodsTextListPage.go";				
			}
					
		} else { // 상품 등록 실패
			
			session.setAttribute("successMsg", "상품 글 등록을 실패했습니다.");
			
			return "redirect:/sellerGoodsTextListPage.go";
		}
		
	}
	
	
	// 파일 업로드
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 파일명 수정 작업 진행 후 서버로 업로드 시키기
		// 예) "bono.jsp" => 2023110810223012345.jsp"
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename();
		
		// 2. 시간 형식을 문자열로 뽑아내기
		// "2023110810223012345" (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 뒤에 붙을 5자리 랜덤수 뽑기 (10000 ~ 99999)
		int ranNum = (int)(Math.random() * 90000 + 100000);
		
		// 4. 원본파일명으로 부터 확장자명을 뽑아오기
		// ".jpg"
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 5. 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;
		
		// 6. 업로드 하고자 하는 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/goods/"); 
		
		// 7. 경로와 수정파일명을 합체 후 파일을 업로드 해주기
		// System.out.println(originName);
		// System.out.println(changeName);
		// System.out.println(savePath + changeName);
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		
		} catch (IllegalStateException | IOException e) {
			
			e.printStackTrace();
		}
		
		// 8. 만들어진 수정파일명을 문자열로 리턴
		return changeName;
		
	}
	
	// 판매자 상품 타이틀 조회
	@ResponseBody
	@RequestMapping(value="ajaxSelectSellerGoodTitle.go", produces = "application/json; charset=UTF-8")
	public String ajaxSelectSellerGoodTitle(int sellerNo, HttpSession session)  {
		
		ArrayList<Goods> goodTitle = goodsService.ajaxSelectSellerGoodTitle(sellerNo);
						
		return new Gson().toJson(goodTitle);
		
	}
	
	// 장바구니 상품 추가
	@RequestMapping("insertCart.go")
	public String insertCart(String order, Cart cart, int sellNo , HttpSession session, Model model) {	
		
		int insertResult = goodsService.insertCart(cart);
		
		if(insertResult > 0) { // 장바구니 추가 성공
			
			if(order.equals("cart")) { // 장바구니 담기 클릭
				
				session.setAttribute("successMsg", "해당 상품을 장바구니에 담기 했습니다.");
				
				return "redirect:/goodsDetailPage.go?sno=" + sellNo;
				
			} else { // 주문하기 클릭
				
				return "redirect:/basket.me";
				
			}
					
		} else { // 장바구니 추가 실패
			
			model.addAttribute("errorMsg","해당 상품을 장바구니에 담기 실패했습니다.");
			
			return "common/errorPage";			
		}		
	}
	
	// 좋아요 조회
	@ResponseBody
	@RequestMapping("ajaxSelectLike.go")
	public int selectLike(Like like) {
		
		int likeCount = goodsService.selectLike(like);
		
		if(like.getMemberNo() == 0) {
			
			return -1;
		}
		
		return likeCount;
		
	}

	// 좋아요 클릭
	@ResponseBody
	@RequestMapping(value = "ajaxClickLike.go", produces = "text/html; charset=UTF-8")
	public String ajaxClickLike(Like like, HttpSession session) {
		
		int likeCount = goodsService.selectLike(like);
			
		if(likeCount > 0) { // 조회 후 좋아요 있을 경우
			
			int deleteLikeCount = goodsService.deleteLike(like);			
			
			if(deleteLikeCount > 0) { // 좋아요 삭제 성공했을 경우
				
				session.setAttribute("successMsg", "좋아하지 않게 되었어요.!");
							
				return "삭제";
				
			} else { // 좋아요 삭제 실패했을 경우
				
				session.setAttribute("successMsg", "좋아요 처리를 실패했습니다.");
						
				return "삭제실패";
			}
			
		} else { // 조회 후 좋아요 없을 경우
			
			int insertLikeCount = goodsService.insertLike(like);
			
			if(insertLikeCount > 0) { // 좋아요 추가 성공했을 경우
				
				session.setAttribute("successMsg", "좋아요.");			
				
				return "추가";
						
			} else { // 좋아요 추가 실패했을 경우
				
				session.setAttribute("successMsg", "좋아요 처리를 실패했습니다.");
							
				return "추가실패";
							
			}
		}
		
	}
	
	// 판매자 상품 글 수정 페이지 이동
	@RequestMapping("sellerGoodsUpdateEnrollForm.go")
	public String sellerGoodsUpdateEnrollFormPage(int sno, Model model) {
		
		// 상품 번호
		int sellNo = sno;
		
		// 상품 글 정보
		GoodsSell goodsSell = goodsService.selectGoodsSell(sellNo);
			
		int goodNo = goodsSell.getGoodNo();
		
		// 상품 정보
		Goods goods = goodsService.selectGoodsByGoodNo(goodNo);			
		
		// 상품 파일 정보
		GoodsFile goodsFile = goodsService.ajaxSelectGoodsMainFileList(sellNo);
		
		// System.out.println(goodsFile);
		
		if(goodsFile == null) { // 상품 파일이 없을 시
			
			goodsFile = new GoodsFile();				
		}
		
		model.addAttribute("goodsSell", goodsSell);
		model.addAttribute("goods", goods);
		model.addAttribute("goodsFile", goodsFile);
				
		return "goods/sellerGoodsUpdateEnrollForm";
	}
	
	// 판매자 상품 글 수정
	@RequestMapping(value = "updateSellerGoodsText.go", produces = "text/html; charset=UTF-8")
	public String updateSellerGoodsText(HttpSession session, GoodsSell goodsSell, MultipartFile reupfile, GoodsFile goodsFile) {				
					
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(goodsFile.getChangeName() != null) {
				
				String realPath = session.getServletContext().getRealPath(goodsFile.getChangeName());
				
				new File(realPath).delete();
			}
			
			String changeName = saveFile(reupfile, session);
			
			goodsFile.setOriginalName(reupfile.getOriginalFilename());
			goodsFile.setChangeName("resources/uploadFiles/goods/" + changeName);	
			
		}
			
		int result = goodsService.updateSellerGoodsText(goodsSell);	
		
		if(result > 0) { // 상품 글 수정 성공 
									
			// System.out.println(goodsFile);
			
			int resultFile = goodsService.updateGoodsFile(goodsFile);
						
			if(resultFile > 0) { // 상품 글 수정 성공
				
				session.setAttribute("successMsg", "상품 글 수정을 성공했습니다.");
				
				return "redirect:/goodsDetailPage.go?sno=" + goodsSell.getSellNo();
			
			} else {
							
				session.setAttribute("successMsg", "상품 글 수정을 실패했습니다.");
				
				return "redirect:/goodsDetailPage.go?sno=" + goodsSell.getSellNo();				
			}
					
		} else { // 상품 등록 실패
					
			session.setAttribute("successMsg", "상품 글 수정을 실패했습니다.");
			
			return "redirect:/goodsDetailPage.go?sno=" + goodsSell.getSellNo();
		}
		
	}
	
	// 판매자 상품 글 삭제
	@RequestMapping("sellerGoodsDelete.go")
	public String sellerGoodsDeleteEnrollForm(HttpSession session, int sno) {
		
		int sellNo = sno;
		
		System.out.println(sellNo);
		
		int resultFile = goodsService.deleteGoodsFile(sellNo);
		
		if(resultFile > 0) { // 판매자 상품 글 파일 삭제 성공
			
			int result = goodsService.deleteSellerGoodsText(sellNo);
			
			if(result > 0) { // 판매자 상품 글 삭제 성공
				
				session.setAttribute("successMsg", "상품 글 삭제를 성공했습니다.");
				
				return "redirect:/sellerGoodsTextListPage.go";
				
			} else { // 판매자 상품 글 삭제 실패
				
				session.setAttribute("successMsg", "상품 글 삭제를 실패했습니다.");
				
				return "redirect:/sellerGoodsTextListPage.go";
			}
			
		} else { // 판매자 상품 글 파일 삭제 실패
			
			session.setAttribute("successMsg", "상품 글 삭제를 실패했습니다.");
			
			return "redirect:/sellerGoodsTextListPage.go";
			
		}
		
	}
	
	// 판매자 상품 상세 페이지 이동
	@RequestMapping("sellerGoodsListDetailPage.go")
	public String sellerGoodsListDetailView(int gno, Model model) {
		
		int goodNo = gno;
		
		// 판매자 상품 정보 조회
		Goods goods = goodsService.selectGoodsByGoodNo(goodNo);
	
		model.addAttribute("goods", goods);
		
		return "goods/sellerGoodsListDetailView";
	}
	
	// 판매자 상품 수정
	@RequestMapping("updateSellerGoods.go")
	public String updateSellerGoods(HttpSession session, Goods goods) {
		
		int result = goodsService.updateSellerGoods(goods);
		
		if(result > 0) { // 판매자 상품 수정 성공
			
			session.setAttribute("successMsg", "상품 수정을 성공했습니다.");
			
			return "redirect:/sellerGoodsListDetailPage.go?gno=" + goods.getGoodNo();
			
		} else { // 판매자 상품 수정 실패
			
			session.setAttribute("successMsg", "상품 수정을 실패했습니다.");
			
			return "redirect:/sellerGoodsListDetailPage.go?gno=" + goods.getGoodNo();
			
		}
		
	}
	
	// 판매자 상품 삭제
	@RequestMapping("deleteSellerGoods.go")
	public String deleteSellerGoods(HttpSession session, int gno) {
			
		// 사용할 변수 셋팅
		int goodNo = gno;
			
		GoodsSell goodsSell = goodsService.selectGoodsTextByGoodNo(goodNo);	
						
		if(goodsSell != null) {
			
			int sellNo = goodsSell.getSellNo();
			
			// 상품 글 삭제
			int resultText = goodsService.deleteSellerGoodsText(sellNo);
			
			if(resultText < 0) { // 판매자 상품 글 삭제 성공
				
				session.setAttribute("successMsg", "상품 글 삭제를 실패했습니다.");								
				
				GoodsFile goodsFile =  goodsService.ajaxSelectGoodsMainFileList(sellNo);
				
				// 상품 파일 삭제
				if(goodsFile != null) {
					
					int resultFile = goodsService.deleteGoodsFile(sellNo);
					
					if(resultFile < 0) { // 판매자 상품 글 파일 삭제 성공
						
						session.setAttribute("successMsg", "상품 글 삭제를 실패했습니다.");
						
					}	
				}
				
			}			
		} 
						
		// 상품 삭제
		int result = goodsService.deleteSellerGoods(goodNo);
		
		if(result > 0) {
			
			session.setAttribute("successMsg", "상품 삭제를 성공했습니다.");
			
			return "redirect:/sellerGoodsListPage.go";
			
		} else {
			
			session.setAttribute("successMsg", "상품 삭제를 실패했습니다.");
			
			return "redirect:/sellerGoodsListPage.go";
			
		}
	
	}
	
		
		
		
}
