package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.CodeGroup;
import com.project.service.CodeGroupService;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/codegroup")
@Slf4j
public class CodeGroupController {

	@Autowired
	private CodeGroupService service;

	// 등록 페이지
	@GetMapping("/register")
	public void registerForm(Model model) throws Exception {
		CodeGroup codeGroup = new CodeGroup();
		model.addAttribute(codeGroup);
	}

	// 등록 요청 처리
	@PostMapping("/register")
	public String register(CodeGroup codeGroup, RedirectAttributes rttr) throws Exception {
		int count = service.register(codeGroup);
		log.info("codegroup/register=" + count);
		if (count != 0) {
			// 세션에 정보를 임시 저장한다.
			rttr.addFlashAttribute("msg", "SUCCESS");
			return "redirect:/codegroup/list";
		}
		return "redirect:/codegroup/register";

	}

	// 목록 페이지
	@GetMapping("/list")
	public void list(Model model) throws Exception {
		log.info("model.getAttribute(msg) : "+model.getAttribute("msg"));
		model.addAttribute("list", service.list());
	}

}
