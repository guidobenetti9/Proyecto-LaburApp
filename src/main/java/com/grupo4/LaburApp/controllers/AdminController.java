package com.grupo4.LaburApp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.JobsService;
import com.grupo4.LaburApp.services.MessageService;
import com.grupo4.LaburApp.services.PostService;
import com.grupo4.LaburApp.services.ReviewService;
import com.grupo4.LaburApp.services.UserService;
import com.grupo4.LaburApp.services.WorkService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	UserService serv;
	@Autowired
	JobsService JobsServ;
	@Autowired
	PostService PostServ;
	@Autowired
	ReviewService ReviewServ;
	@Autowired
	WorkService WorkServ;
	@Autowired
	MessageService MsgServ;
	
	@GetMapping("/dashboard")
	public String users(HttpSession session,Model model) {
		//REVISAMOS SESION
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
		//REVISO SI ES ADMIN
		User esAdmin = serv.findAdmin(userTemp);
		if(esAdmin.getEsAdmin()==false) {
			return "redirect:/";
		}
		
		model.addAttribute("allUsers", serv.allUsers());
		return "/admin/userAdmin.jsp";
	}
	
	@GetMapping("/adminmessages")
	public String admin(HttpSession session,Model model) {
		
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
		//REVISO SI ES ADMIN
		User esAdmin = serv.findAdmin(userTemp);
		if(esAdmin.getEsAdmin()==false) {
			return "redirect:/";
		}
		model.addAttribute("allMessages", MsgServ.allMessages());
		return "/admin/messageAdmin.jsp";
	}
	
	@GetMapping("/adminjobs")
	public String job(HttpSession session,Model model) {
		
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
		//REVISO SI ES ADMIN
		User esAdmin = serv.findAdmin(userTemp);
		if(esAdmin.getEsAdmin()==false) {
			return "redirect:/";
		}
		model.addAttribute("allJobs",JobsServ.allJobs());
		return "/admin/jobAdmin.jsp";
	}
	
	@GetMapping("/adminposts")
	public String post(HttpSession session,Model model) {
		
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
		//REVISO SI ES ADMIN
		User esAdmin = serv.findAdmin(userTemp);
		if(esAdmin.getEsAdmin()==false) {
			return "redirect:/";
		}
		
		model.addAttribute("allPosts",PostServ.allPosts());
		return "/admin/postAdmin.jsp";
	}
	
	@GetMapping("/adminreviews")
	public String review(HttpSession session,Model model) {
		
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
		//REVISO SI ES ADMIN
		User esAdmin = serv.findAdmin(userTemp);
		if(esAdmin.getEsAdmin()==false) {
			return "redirect:/";
		}
		model.addAttribute("allReviews", ReviewServ.allReviews());
		return "/admin/reviewAdmin.jsp";
	}
	
	@GetMapping("/adminworks")
	public String work(HttpSession session,Model model) {
		
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
		//REVISO SI ES ADMIN
		User esAdmin = serv.findAdmin(userTemp);
		if(esAdmin.getEsAdmin()==false) {
			return "redirect:/";
		}
		model.addAttribute("allWorks", WorkServ.allWorks());
		return "/admin/workAdmin.jsp";
	}
	
	@GetMapping("/loginAdmin")
	public String loguearAdmin() {
		return "/admin/loginAdmin.jsp";
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
