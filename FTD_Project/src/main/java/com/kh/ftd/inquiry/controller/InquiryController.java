package com.kh.ftd.inquiry.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.common.template.Pagination;
import com.kh.ftd.inquiry.model.service.InquiryService;
import com.kh.ftd.inquiry.model.vo.Inquiry;
import com.kh.ftd.inquiry.model.vo.InquiryFile;
import com.kh.ftd.notice.model.vo.Notice;
import com.kh.ftd.seller.model.vo.Seller;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping("list.in")
	public ModelAndView selectInquiryList(String sellerNo,
										  ModelAndView mv) {
		mv.addObject("sellerNo", sellerNo).setViewName("inquiry/inquiryListView");
		
//		System.out.println(sellerNo);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxSelectList.in", produces = "application/json; charset=UTF-8")
	public String ajaxSelectInquiryList(int sellerNo, String page, String pageSize) {
		
		int inquiryNo =0;
		
		System.out.println("page : " + page);
		System.out.println("size : " + pageSize);
		System.out.println("sellerNo : " + sellerNo);
		
		ArrayList<Inquiry> list = inquiryService.ajaxSelectInquiryList(sellerNo);
		
		
//		int totalItems = list.size();
//		
//		int start = page * size;
//		
//		int end = Math.min(start + size, totalItems);
		
		System.out.println(list);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping("enrollForm.in")
	public ModelAndView enrollForm(int sno, ModelAndView mv) {
		
		
		System.out.println(sno);
		Seller list = inquiryService.sellectSeller(sno);
		
		System.out.println(list);
		
		mv.addObject(list).setViewName("inquiry/inquiryEnrollForm");
		
		return mv;
		
	}
	
	@Transactional
	@RequestMapping("insert.in")
	public String insertInquiry(Inquiry i, InquiryFile inf, MultipartFile upfile[], HttpSession session, Model model) {
		
		System.out.println("i : " + i);
		System.out.println("inf : " + inf);
		for(MultipartFile uf : upfile) {
			System.out.println("upfile : " + uf);
		}
		
		// 제목과 내용을 업로드
		int result = inquiryService.insertInquiry(i);
		
		// 파일업로드
		for(MultipartFile n : upfile) {
			if(!n.getOriginalFilename().equals("")) {
				
				String changeName = saveFile(n, session);
				
				inf.setOriginName(n.getOriginalFilename());
				inf.setChangeName("resources/uploadFiles/inquiry/" + changeName);
				inf.setInquiryNo(i.getInqNo());
//				System.out.println(inf);
				
				result *= inquiryService.insertInquiryFile(inf);
				
			}
		}
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
			return "redirect:/list.in?sellerNo=" + i.getSellerNo();
		} else {
			
			model.addAttribute("errorMsg", "게시글 등록 실패");
			
			return "common/errorPage";
		}
		
		
		
	}
	
	@RequestMapping("detail.in")
	public void selectInquiry(int ino, int sno) {
		System.out.println("ino : " + ino);
		System.out.println("sno : " + sno);
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
				.getRealPath("/resources/uploadFiles/inquiry/");
		
		// 7. 경로와 수정파일명을 합체 후 파일을 업로드 해주기
		try {
			
			upfile.transferTo(new File(savePath + changeName));
		
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		
		// 8. 만들어진 수정파일명을 문자열로 리턴
		return changeName;
	}
	
}
