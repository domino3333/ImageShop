package com.project.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.UserItemService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/useritem")
@RequiredArgsConstructor
public class UserItemController {

	@Value("${upload.path}")
	private String uploadPath;
	
	private final UserItemService service;
	
	
	
}
