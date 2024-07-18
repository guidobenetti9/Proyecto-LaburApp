package com.grupo4.LaburApp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	UserService serv;
	
	@GetMapping("/adminmessages")
	public String admin() {
		return "messageAdmin.jsp";
	}
	
	@GetMapping("/adminjobs")
	public String job() {
		return "jobAdmin.jsp";
	}
	
	@GetMapping("/adminposts")
	public String post() {
		return "postAdmin.jsp";
	}
	
	@GetMapping("/adminreviews")
	public String review() {
		return "reviewAdmin.jsp";
	}
	
	@GetMapping("/adminworks")
	public String work() {
		return "workAdmin.jsp";
	}
	
	@GetMapping("/loginAdmin")
	public String loguearAdmin() {
		return "loginAdmin.jsp";
	}
	
	@PostMapping("/loginAdmin")
	public String loginAdmin(@RequestParam("email") String email,
							 @RequestParam("password") String password,
							 RedirectAttributes redirectAttributes, /*usar mensajes de Flash*/   
							 HttpSession session) {
		User userAdminTryingLogin = serv.login(email, password); //Obj User o null
		User esAdmin = serv.findAdmin(userAdminTryingLogin);
		if(userAdminTryingLogin == null) {
			//Tiene algo mal
			redirectAttributes.addFlashAttribute("errorLogin", "Wrong email/password");
			return "redirect:/";
		} else if(esAdmin.getEsAdmin()==false) {
			redirectAttributes.addFlashAttribute("errorLogin", "No sos admin");
			return "redirect:/";
		}else {
			session.setAttribute("userInSession", userAdminTryingLogin); //Guardando en sesión el objeto de User
			return "redirect:/dashboard";}
		
	}
}
