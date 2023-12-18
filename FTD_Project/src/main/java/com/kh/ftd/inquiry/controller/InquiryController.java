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
import com.kh.ftd.notice.model.vo.NoticeFile;
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
	
	// 문의글 전체 조회 ajax
	@ResponseBody
	@RequestMapping(value="ajaxSelectList.in", produces = "application/json; charset=UTF-8")
	public String ajaxSelectInquiryList(int sellerNo, int page, int size) {
		
		
//		System.out.println("page : " + page);
//		System.out.println("size : " + pageSize);
//		System.out.println("sellerNo : " + sellerNo);
		
		ArrayList<Inquiry> list = inquiryService.ajaxSelectInquiryList(sellerNo);
		
		
		int totalItems = list.size();
		
		int start = page * size;
		
		int end = Math.min(start + size, totalItems);
		
//		System.out.println(list);
		
		ArrayList<Object> arrList = new ArrayList<Object>();
		
		for(int i = start; i < end; i++) {
			
			arrList.add(list.get(i));
		}
		
		return new Gson().toJson(arrList);
	}
	
	
	// 문의 작성 페이지 이동
	@Transactional
	@RequestMapping("enrollForm.in")
	public ModelAndView enrollForm(int sno, ModelAndView mv) {
		
		
//		System.out.println(sno);
		
		// 작성하려는 문의글의 판매자 정보를 담아서 넘김
		Seller list = inquiryService.sellectSeller(sno);
		
//		System.out.println(list);
		
		mv.addObject(list).setViewName("inquiry/inquiryEnrollForm");
		
		return mv;
		
	}
	
	// 문의글 작성
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
			
			return "redirect:/sellerDetailPage.se?sno=" + i.getSellerNo();
		} else {
			
			model.addAttribute("errorMsg", "게시글 등록 실패");
			
			return "common/errorPage";
		}
		
		
		
	}
	
	// 문의글 상세 조회
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
			
//			System.out.println(i2);
			
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
	
	// 답글작성 페이지 이동
	@RequestMapping("enrollForm.re")
	public ModelAndView insertResponseForm(Inquiry i, ModelAndView mv) {
		
//		System.out.println(i);
		

		
		mv.addObject("i", i).setViewName("inquiry/answerEnrollForm");
		
		return mv;
		
	}
	
	// 답글 작성
	@Transactional
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
	
	// 문의글 수정 페이지 이동
	@RequestMapping("updateForm.in")
	public ModelAndView updateInquiry(Inquiry i,HttpSession session, ModelAndView mv) {
		
		System.out.println("i : " + i);
//		System.out.println("changeName : " + changeName);
		ArrayList<InquiryFile> inf = inquiryService.selectInquiryFile(i);
		
		Seller seller = inquiryService.sellectSeller(Integer.parseInt(i.getSellerNo()));
		
		System.out.println(seller);
		
		if(i.getResponseDate() != null) {
			// 답글이 달려있을 경우
			session.setAttribute("alertMsg", "답글이 작성된 문의글은 수정할 수 없습니다.");
			
			mv.setViewName("redirect:/detail.in?ino=" + i.getInqNo() + "&sno=" + i.getSellerNo());
			
			return mv;
			
		} else {
			
			mv.addObject("i", i).addObject("inf", inf).addObject("seller", seller).setViewName("inquiry/inquiryUpdateForm");
			
			return mv;
		}
	}
	
	// 문의글 수정
	@Transactional
	@RequestMapping("update.in")
	public String updateInquiry(Inquiry i,
							  InquiryFile inf,
							  MultipartFile[] upfile,
							  HttpSession session,
							  String[] originName,
							  String[] changeName,
							  Model model) {
//		System.out.println("i : " + i);
//		System.out.println("inf : " + inf);
		for(MultipartFile uf : upfile) {
			System.out.println("uf : " + uf);
		}
//		for(String on : originName) {
//			System.out.println(on);
//		}
//		for(String cn : changeName) {
//			System.out.println(cn);
//		}
		int result = 1;
		
		
		// 업로드한 파일이 있을경우
		if(!upfile[0].getOriginalFilename().equals("")) {
			
			// case1. 기존에 첨부파일이 있었을 경우
			// => 기존의 첨부파일을 찾아서 서버로부터 삭제
			//	  (기존 첨부파일의 수정파일명이 필요함)
			if(originName != null) {
				
				result *= inquiryService.deleteInquiryFile(i.getInqNo());
				
			}
			
			// case1. 기존에 첨부파일이 있었을 경우
			// case2. 기존에 첨부파일이 없었을 경우
			// 공통코드로써
			// => 새로 넘어온 첨부파일을 파일명 수정 후 업로드
			for(MultipartFile uf : upfile) {
				String rechangeName = saveFile(uf, session);
				
				inf.setInquiryNo(i.getInqNo());
				inf.setOriginName(uf.getOriginalFilename());
				inf.setChangeName("resources/uploadFiles/inquiry/" + rechangeName);
				inf.setInquiryNo(inf.getInquiryNo());
				
				result *= inquiryService.updateInquiryFile(inf);
			}
		}
		// Service 단으로 b 를 보내면서 update 요청
		result *= inquiryService.updateInquiry(i);
		
		if(result > 0) { // 수정 성공
			// => alert 문구를 담아서 
			//	  게시판 상세보기 페이지로 url 재요청
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			
			return "redirect:/detail.in?ino=" + i.getInqNo() + "&sno="+ i.getSellerNo();
			
		} else { // 수정 실패
			// => 에러문구를 담아서 에러페이지로 포워딩
			
			model.addAttribute("errorMsg", "게시글 수정 실패");
			
			return "common/errorPage";
		}
		
	}
	
	// 문의글 삭제
	@Transactional
	@RequestMapping("delete.in")
	public String deleteInquiry(Inquiry i, 
							InquiryFile inf, 
							Model model,
							HttpSession session) {
	
		System.out.println(i);
		System.out.println(inf.getOriginName());

		int result = inquiryService.deleteInquiry(i.getInqNo());
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 문의글이 삭제되었습니다.");
			
			return "redirect:/sellerDetailPage.se?sno=" + i.getSellerNo();
		} else {
			
			
			model.addAttribute("errorMsg", "문의글 삭제 실패");
			
			return "common/errorPage";
		}
	}
	
	// 답글 수정 페이지 이동
	@RequestMapping("updateForm.re")
	public ModelAndView updateResponseForm(Inquiry i,
								ModelAndView mv) {
		
		mv.addObject("i", i).setViewName("inquiry/answerUpdateForm");
		
		return mv;
	}
	
	// 답글 수정
	@Transactional
	@RequestMapping("update.re")
	public String updateResponse(Inquiry i, HttpSession session, Model model) {
		
		System.out.println(i);
		
		int result = inquiryService.updateResponse(i);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 답글이 수정되었습니다.");
			
			return "redirect:/detail.in?ino=" + i.getInqNo() + "&sno="+ i.getSellerNo();
		} else {
			model.addAttribute("errorMsg", "답글 수정 실패");
			
			return "common/errorPage";
		}
	}
	
	// 답글 삭제
	@Transactional
	@RequestMapping("delete.re")
	public String deleteResponse(Inquiry i,
							HttpSession session,
							Model model) {
		
		int result = inquiryService.deleteResponse(i);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 답글이 삭제되었습니다.");
			
			return "redirect:/detail.in?ino=" + i.getInqNo() + "&sno="+ i.getSellerNo();
		} else {
			model.addAttribute("errorMsg", "답글 삭제 실패");
			
			return "common/errorPage";
		}
		
	}
	
	//
	@Transactional
	@RequestMapping("insert.rep")
	public String insertReply(Inquiry i, InquiryReply r, HttpSession session, Model model) {
		
		System.out.println(r);
		int result = inquiryService.insertReply(r);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 댓글이 작성되었습니다.");
			
			return "redirect:/detail.in?ino=" + r.getInqNo() + "&sno="+ i.getSellerNo();
		} else {
			model.addAttribute("errorMsg", "댓글 작성 실패");
			
			return "common/errorPage";
		}
	}
	@ResponseBody
	@RequestMapping(value="update.rep" , produces = "text/html; charset=UTF-8")
	public String updateReply(InquiryReply ir, Model model, HttpSession session) {
		int result = inquiryService.updateReply(ir);
		return (result > 0) ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="delete.rep" , produces = "text/html; charset=UTF-8")
	public void deleteReply(int replyNo) {
		System.out.println(replyNo);
		
		int result = inquiryService.deleteReply(replyNo);
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
