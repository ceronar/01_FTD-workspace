package com.kh.ftd.goods.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.ftd.goods.model.service.GoodsService;
import com.kh.ftd.goods.model.vo.Goods;
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;

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
		
		// 상품 리스트
		ArrayList<Goods> gList = goodsService.ajaxSelectGoodsList();
		
		// System.out.println(gList);
		
		// 상품 판매 정보
		ArrayList<GoodsSell> gsList = new ArrayList<>();
		
		// 상품 파일
		ArrayList<GoodsFile> gfList = new ArrayList<>();
		
		// 상품 평균 별점
		ArrayList<Object> starList = new ArrayList<>();
		
		// 상품 댓글 수
		ArrayList<Object> reviewList = new ArrayList<>();
	
		// 상품 총 리스트 수
		int totalList = gList.size();
		
		//System.out.println(totalList);
		
		int startPage = page * pageSize;
		
		int endPage = Math.min(startPage + pageSize, totalList);		
		
		if(totalList < 0) { // 조회할 상품이 없을 경우
			
			return "조회할 상품이 없습니다.";
			
		} else { // 조회할 상품이 있을 경우
					
			for(Goods g : gList) {
				
				int goodNo = g.getGoodNo();
				//System.out.println(goodNo);
				
				// 상품 판매 정보
				GoodsSell goodsSell = goodsService.ajaxSelectGoodsSellList(goodNo);
				
				if(goodsSell != null) { // 상품 판매 정보가 있을 시
					int sellNo = goodsSell.getSellNo();				
					gsList.add(goodsSell);			
					
					// 상품 파일
					GoodsFile goodsFile = goodsService.ajaxSelectGoodsFileList(sellNo);
					if(goodsFile != null) { // 상품 파일이 있을 시
						
						gfList.add(goodsFile);
						
					} else { // 상품 파일이 없을 시
						
						goodsFile = new GoodsFile();
						gfList.add(goodsFile);
						
					}
					
				} else { // 상품 판매 정보가 없을 시
					
					goodsSell = new GoodsSell();
					gsList.add(goodsSell);	
					
					GoodsFile goodsFile = new GoodsFile();
					gfList.add(goodsFile);
					
				}
						
				// 상품 평균 별점
				double starRating = goodsService.ajaxSelectStarRating(goodNo);
				starList.add(starRating);
				
				// 상품 댓글 수
				int reviews = goodsService.ajaxSelectReviews(goodNo);
				reviewList.add(reviews);
				
			}
			
		}

		ArrayList<Object> resultList = new ArrayList<>();
		
		for (int i = startPage; i < endPage; i++) {
			
			ArrayList<Object> arrList = new ArrayList<>();
			
			arrList.add(gList.get(i));
			arrList.add(gsList.get(i));
			arrList.add(gfList.get(i));
			arrList.add(starList.get(i));
			arrList.add(reviewList.get(i));
			
			// 상품 전체 리스트
			resultList.add(arrList);		
			
		}	

		return new Gson().toJson(resultList);			
	}
	
	// 상품 리스트 상세 페이지 이동
	@RequestMapping("goodsDetailPage.go")
	public String goodsDetailPage(int gno) {
		
		// 상품 번호
		int goodNo = gno;
		
		// 조회수 증가
		int count;
		
		// 상품 정보
		
		// 상품 글 정보
		
		// 상품 파일 정보
		
		return "goods/goodsDetailView";
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
	
	// 판매자 상품 글 등록 페이지 이동
	@RequestMapping("sellerGoodsTextEnrollForm.go")
	public String sellerGoodsTextEnrollFormPage() {
		
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
	public String insertSellerGoodsText(HttpSession session, GoodsSell goodsSell) {
		
		int result = goodsService.insertSellerGoodsText(goodsSell);
		
		if(result > 0) { // 상품 등록 성공 
			
			session.setAttribute("successMsg", "상품 글 등록을 성공했습니다.");
			
			return "redirect:/sellerGoodsTextListPage.go";
			
			
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
	public String ajaxSelectSellerGoodTitle(int sellerNo)  {
		
		ArrayList<Goods> goodTitle = goodsService.ajaxSelectSellerGoodTitle(sellerNo);
		
		return new Gson().toJson(goodTitle);
		
	}
	

		
}
