package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.domain.CodeLabelValue;
import com.project.common.domain.PageRequest;
import com.project.common.domain.Pagination;
import com.project.common.security.domain.CustomUser;
import com.project.domain.Board;
import com.project.domain.Comments;
import com.project.domain.Member;
import com.project.service.BoardService;
import com.project.service.CommentsService;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;

@Controller
@RequestMapping("/board")
@Log
@RequiredArgsConstructor
public class BoardController {

	private final BoardService service;
	private final CommentsService commentsService;
	

	// 게시글 등록 페이지
	@GetMapping("/register")
	@PreAuthorize("hasRole('MEMBER')")
	public void registerForm(Model model, Authentication authentication) throws Exception {
		// 로그인한 사용자 정보 획득
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();
		log.info("권한들: " + member.getAuthList());
		Board board = new Board();
		// 로그인한 사용자 아이디를 등록 페이지에 표시
		board.setWriter(member.getUserId());
		model.addAttribute(board);
	}

	// 게시글 등록 처리
	@PostMapping("/register")
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String register(Board board, RedirectAttributes rttr) throws Exception {
		int count = service.register(board);

		if (count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
			rttr.addFlashAttribute("msg", "FAILED");
		}

		return "redirect:/board/list";
	}

	// 게시글 목록 페이지
	@GetMapping("/list")
	public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {

		if (pageRequest.getPage() == 0) {
			pageRequest = new PageRequest();
		}

		model.addAttribute("list", service.list(pageRequest));
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(service.count(pageRequest));
		model.addAttribute("pagination", pagination);

		// 검색 유형의 코드명과 코드값을 정의한다.
		List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
		searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
		searchTypeCodeValueList.add(new CodeLabelValue("t", "Title"));
		searchTypeCodeValueList.add(new CodeLabelValue("c", "Content"));
		searchTypeCodeValueList.add(new CodeLabelValue("w", "Writer"));
		searchTypeCodeValueList.add(new CodeLabelValue("tc", "Title OR Content"));
		searchTypeCodeValueList.add(new CodeLabelValue("cw", "Content OR Writer"));
		searchTypeCodeValueList.add(new CodeLabelValue("tcw", "Title OR Content OR Writer"));
		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
	}

	// 게시글 상세 페이지, 페이징 요청 정보를 매개변수로 받고 다시 뷰에 전달한다.
	@GetMapping("/read")
	public void read(Board board, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		// 조회한 게시글 상세 정보를 뷰에 전달한다.
		Board b1 = service.read(board);
		List<Comments> commentsList = commentsService.read(board.getBoardNo());
		model.addAttribute(commentsList);
		model.addAttribute(b1);
	}

	// 게시글 수정 페이지로 이동, 페이징 요청 정보를 매개변수로 받고 다시 뷰에 전달한다.
	@GetMapping("/modify")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	public void modifyForm(Board board, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		// 조회한 게시글 상세 정보를 뷰에 전달한다.
		Board b1 = service.read(board);
		model.addAttribute(b1);
	}

	// 게시글 수정 완료 처리, 페이징 요청 정보를 매개변수로 받고 다시 뷰에 전달한다.
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	@PostMapping("/modify")
	public String modify(Board board, @ModelAttribute("pgrq") PageRequest pageRequest, RedirectAttributes rttr)
			throws Exception {
		service.modify(board);
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/list";
	}

	// 게시글 삭제 처리, 페이징 요청 정보를 매개변수로 받고 다시 뷰에 전달한다.
	@GetMapping("/remove")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	public String remove(Board board, @ModelAttribute("pgrq") PageRequest pageRequest, RedirectAttributes rttr)
			throws Exception {
		service.remove(board);
		log.info("삭제 요청 page: " + pageRequest.getPage());
		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/list";
	}
	
	//댓글 등록 처리
	@PostMapping("/comment/add")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	public String commentAdd(Comments comments, @ModelAttribute("pgrq") PageRequest pageRequest, RedirectAttributes rttr)
			throws Exception {
		log.info("댓글 등록 요청 : "+ comments.getContent());
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		comments.setWriter(auth.getName());
		
		commentsService.add(comments);

		rttr.addAttribute("boardNo", comments.getBoardNo());
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/read";
	}
	
	//댓글 삭제 처리
	@PostMapping("/comment/remove")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	public String commentRemove(Comments comments, @ModelAttribute("pgrq") PageRequest pageRequest, RedirectAttributes rttr)
			throws Exception {
		log.info("댓글 삭제 요청 : "+ comments.getCommentNo());
		
		//현재 로그인된 사용자와 댓글의 작성자 아이디가 같지 않으면 예외 발생
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(!(comments.getWriter().equals(auth.getName()))) {
			throw new RuntimeException("권한 없음"); 
		}
		commentsService.remove(comments);

		rttr.addAttribute("boardNo", comments.getBoardNo());
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/read";
	}

	
	
	
	
	

}
