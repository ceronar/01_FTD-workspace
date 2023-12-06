package com.kh.ftd.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.common.template.Pagination;
import com.kh.ftd.notice.model.service.NoticeService;
import com.kh.ftd.notice.model.vo.Notice;
import com.kh.ftd.notice.model.vo.NoticeFile;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("list.no")
	public ModelAndView selectList(
			@RequestParam(value = "npage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = noticeService.selectNoticeCount();
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, 
						currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("notice/noticeListView");
		  
		return mv;
	}
	
	@GetMapping("enrollForm.no")
	public String enrollForm() {
		
		return "notice/noticeEnrollForm";
	}
	
	@PostMapping("insert.no")
	// @RequestMapping(value = "insert.bo", method = RequestMethod.POST)
	public String insertNotice(Notice n,
							  NoticeFile nf,
							  MultipartFile upfile[],
							  HttpSession session,
							  Model model) {
		
		// System.out.println("n :" +  n); // 제목, 작성자아이디, 내용
		// System.out.println("upfile : " + upfile); // 첨부파일에 대한 정보
		
		
		// => 파일명을 수정 후 서버로 업로드
		int result = noticeService.insertNotice(n);
		
		for(int i = 0; i < upfile.length; i++) {
			if(!upfile[i].getOriginalFilename().equals("")) {
				
				String changeName = saveFile(upfile[i], session);

				nf.setOriginName(upfile[i].getOriginalFilename());
				nf.setChangeName("resources/uploadFiles/notice/" + changeName);
				nf.setNoticeNo(n.getNoticeNo());
				// System.out.println(nf);
				noticeService.insertFile(nf);
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
			
			return "redirect:/list.no"; // 첫 페이지로 이동
			
		} else { // 게시글 작성 실패
			// => 에러문구를 담아서 에러페이지로 포워딩
			
			model.addAttribute("errorMsg", "게시글 등록 실패");
			
			// /WEB-INF/views/common/errorPage.jsp
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(int nno, 
									ModelAndView mv) {
		
		// 1. 해당 게시글의 조회수 증가용 서비스 호출
		int result = noticeService.increaseNoticeCount(nno);
		
		// 2. 조회수 증가에 성공했다면 해당 게시글 상세조회 서비스 호출
		if(result > 0) { // 성공
			
			Notice n = noticeService.selectNotice(nno);
			
			ArrayList<NoticeFile> nf = noticeService.selectNoticeFile(nno);
			
//			System.out.println(n);

//			System.out.println(nf);
			
			// 조회된 데이터를 담아서 상세보기 페이지로 포워딩
			mv.addObject("n", n).addObject("nf", nf).setViewName("notice/noticeDetailView"); 
			
		} else { // 실패
			
			// 에러문구를 담아서 에러페이지로 포워딩
			mv.addObject("errorMsg", "게시글 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping(value="delete.no", method=RequestMethod.POST)
	public String deleteBoard(String nno,
							  String filePath,
							  Model model,
							  HttpSession session) {
		
		// bno 에는 post 방식으로 넘겨받은 글번호가 들어가있음
		
		System.out.println("nno " + nno);
		System.out.println(filePath);
		// 삭제 요청
//		int result = noticeService.deleteNotice(nno);
//		
//		if(result > 0) { // 삭제 성공
//			// => alert 문구를 담아 게시판 리스트 페이지로 url 재요청
//			
//			// 기존에 첨부파일이 있었을 경우
//			// 서버로부터 해당 첨부파일 삭제하기
//			
//			// filePath 라는 매개변수에는
//			// 기존에 첨부파일이 있었을 경우 수정파일명
//			// 기존에 첨부파일이 없었을 경우 "" 이 들어가 있음
//			if(!filePath.equals("")) {
//				// 기존에 첨부파일이 있었을 경우
//				// => 해당 파일을 삭제처리
//				
//				// 해당 파일이 실제 저장되어있는 경로 알아내기
//				String realPath = session.getServletContext()
//								.getRealPath(filePath);
//				
//				new File(realPath).delete();
//			}
//			
//			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
//			
//			return "redirect:/list.bo";
//			
//		} else { // 삭제 실패
//			// => 에러문구를 담아서 에러페이지로 포워딩
//			
//			model.addAttribute("errorMsg", "게시글 삭제 실패");
//			
			return "common/errorPage";
//		}
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
				.getRealPath("/resources/uploadFiles/notice/");
		
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
