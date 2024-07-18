package com.grupo4.LaburApp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

	@Autowired
	UserService serv;
	
	@GetMapping("/")
	public String index(@ModelAttribute("newUser") User newUser) {
		return "index.jsp";
	}
	
	@GetMapping("/register")
	public String registro(@ModelAttribute("newUser") User newUser) {
		return "register.jsp";
	}
	
	@GetMapping("/login")
	public String loguearse() {
		return "login.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
						   BindingResult result,
						   HttpSession session) {
		serv.register(newUser, result);
		
		if(result.hasErrors()) {
			System.out.println("estoy con un error");
			return "index.jsp";
		} else {
			//Guardo al nuevo usuario en sesión
			session.setAttribute("userInSession", newUser);
			return "redirect:/dashboard";
		}
		
	}
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session) {
		//Validación de que el usuario inició sesión
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
		
		return "dashboard.jsp";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("email") String email,
						@RequestParam("password") String password,
						RedirectAttributes redirectAttributes, /*usar mensajes de Flash*/   
						HttpSession session){
		
		User userTryingLogin = serv.login(email, password); //Obj User o null
		
		if(userTryingLogin == null) {
			//Tiene algo mal
			redirectAttributes.addFlashAttribute("errorLogin", "Wrong email/password");
			return "redirect:/";
		} else {
			session.setAttribute("userInSession", userTryingLogin); //Guardando en sesión el objeto de User
			return "redirect:/dashboard";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInSession");
		return "redirect:/";
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
