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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ftd.inquiry.model.service.InquiryService;
import com.kh.ftd.inquiry.model.vo.Inquiry;
import com.kh.ftd.inquiry.model.vo.InquiryFile;
import com.kh.ftd.inquiry.model.vo.InquiryReply;
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
		
//		System.out.println("page : " + page);
//		System.out.println("size : " + pageSize);
//		System.out.println("sellerNo : " + sellerNo);
		
		ArrayList<Inquiry> list = inquiryService.ajaxSelectInquiryList(sellerNo);
		
		
//		int totalItems = list.size();
//		
//		int start = page * size;
//		
//		int end = Math.min(start + size, totalItems);
		
//		System.out.println(list);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping("enrollForm.in")
	public ModelAndView enrollForm(int sno, ModelAndView mv) {
		
		
//		System.out.println(sno);
		
		// 작성하려는 문의글의 판매자 정보를 담아서 넘김
		Seller list = inquiryService.sellectSeller(sno);
		
//		System.out.println(list);
		
		mv.addObject(list).setViewName("inquiry/inquiryEnrollForm");
		
		return mv;
		
	}
	
	@Transactional
	@RequestMapping("insert.in")
	public String insertInquiry(Inquiry i, InquiryFile inf, MultipartFile upfile[], HttpSession session, Model model) {
		
//		System.out.println("i : " + i);
//		System.out.println("inf : " + inf);
		
//		for(MultipartFile uf : upfile) {
//			System.out.println("upfile : " + uf);
//		}
		
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
	public ModelAndView selectInquiry(Inquiry i, int ino, String sno, ModelAndView mv) {
//		System.out.println("ino : " + ino);
//		System.out.println("sno : " + sno);
		
		i.setInqNo(ino);
		i.setSellerNo(sno);
		
//		System.out.println(i);
		
		// 게시글 조회수 증가용 서비스
		int result = inquiryService.increaseInquiryCount(i);
		
		// 조회수가 증가여부에 따라 상세조회 서비스 호출
		if(result > 0) {
			
			Inquiry i2 = inquiryService.selectInquiry(i);
			
			System.out.println(i2);
			
			ArrayList<InquiryFile> inf = inquiryService.selectInquiryFile(i);
//			for(InquiryFile n : inf) {
//				System.out.println(n);
//			}
			
			ArrayList<InquiryReply> ir = inquiryService.selectInquiryReplyList(i);
			
//			for(InquiryReply n : ir) {
//				System.out.println(n);
//			}
			
			
			mv.addObject("i2", i2).addObject("inf", inf).addObject("ir", ir).setViewName("inquiry/inquiryDetailView");
		} else {
			
			mv.addObject("errorMsg", "문의글 상세 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("enrollForm.re")
	public ModelAndView insertResponseForm(Inquiry i, ModelAndView mv) {
		
//		System.out.println(i);
		

		
		mv.addObject("i", i).setViewName("inquiry/answerEnrollForm");
		
		return mv;
		
	}
	
	@RequestMapping("insert.re")
	public String insertResponse(Inquiry i, HttpSession session, Model model) {
		
//		System.out.println(i);
		
		int result = inquiryService.insertAnswer(i);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
			return "redirect:/detail.in?ino=" + i.getInqNo() + "&sno=" + i.getSellerNo();
		} else {
			
			model.addAttribute("errorMsg", "게시글 등록 실패");
			
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateForm.in")
	public ModelAndView updateInquiry(Inquiry i, InquiryFile inf, HttpSession session, ModelAndView mv) {
		
//		System.out.println(i);
		
		if(i.getResponseDate() != null) {
			// 답글이 달려있을 경우
			session.setAttribute("alertMsg", "답글이 작성된 문의글은 수정할 수 없습니다.");
			
			mv.setViewName("redirect:/detail.in?ino=" + i.getInqNo() + "&sno=" + i.getSellerNo());
			
			return mv;
			
		} else {
			
			mv.addObject("i", i).addObject("inf", inf).setViewName("inquiry/answerEnrollForm");
			
			return mv;
		}
		
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
