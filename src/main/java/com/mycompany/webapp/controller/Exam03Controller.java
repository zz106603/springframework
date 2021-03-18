package com.mycompany.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.User;

@Controller
@RequestMapping("/exam03")
public class Exam03Controller {

	@GetMapping("/content")
	public String content() {
		return "exam03/content";
	}

	/*@GetMapping("/method1")
	public String method1(HttpServletRequest request, Model model){
		String kind = request.getParameter("kind"); 
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		request.setAttribute("kind", kind);
		request.setAttribute("pageNo", pageNo);
		return "exam03/method1";
	}*/
	
	@GetMapping("/method1")
	public String method1(@RequestParam(name = "kind") String kind, 
						  @RequestParam(defaultValue="1") int pageNo, 
						  Model model){
		model.addAttribute("kind", kind);
		model.addAttribute("pageNo", pageNo);
		return "exam03/method1";
	}
	
	@PostMapping("/method2")
	public String method2(String uemail, String upassword, boolean upublic, Model model) {
		model.addAttribute("uemail", uemail);
		model.addAttribute("upassword", upassword);
		model.addAttribute("upublic", upublic);
		return "exam03/method2";
	
	}
	
	@PostMapping("/method3")
	public String method3(User user) {
		return "exam03/method3";
	}

}
