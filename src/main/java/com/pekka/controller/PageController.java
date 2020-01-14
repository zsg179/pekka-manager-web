package com.pekka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	@RequestMapping("/")
	private String showIndex() {
		return "index";
	}

	@RequestMapping("/{page}")
	public String showPage(@PathVariable String page) {
		return page;
	}

	@RequestMapping("/rest/page/{page}")
	public String showEditPage(@PathVariable String page) {
		return page;
	}

	@RequestMapping("/page/login")
	public String login() {
		return "login-manager";
	}

	@RequestMapping("/manager/register")
	public String register() {
		return "register-manager";
	}

}
