package com.grupo4.LaburApp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelpController {

	@GetMapping("/help")
	public String help() {
		return "help.jsp";
	}
	
	// Vista de contacto
	@GetMapping("/contact")
	public String contact() {
		return "contact.jsp";
	}
}
