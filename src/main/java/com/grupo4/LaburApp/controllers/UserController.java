package com.grupo4.LaburApp.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo4.LaburApp.models.Post;
import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.PostService;
import com.grupo4.LaburApp.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

	@Autowired
	UserService serv;
	
	@Autowired
	PostService ps;
	

	
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
			return "register.jsp";
		} else {
			//Guardo al nuevo usuario en sesión
			session.setAttribute("userInSession", newUser);
			return "redirect:/";
		}
		
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
			return "login.jsp";
		} else {
			session.setAttribute("userInSession", userTryingLogin); //Guardando en sesión el objeto de User
			return "redirect:/";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInSession");
		return "redirect:/";
	}
	
	@GetMapping("/")
	public String index(Model model,HttpSession session) {
		
		model.addAttribute("allPosts", ps.allPosts());
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
		return "index.jsp";
	}
	
	// Filtra los post por un determinado Job (Rubro)
	@GetMapping("/filterDataJob")
    public String filterDataJob(@RequestParam Long filter, Model model,HttpSession session) {
        // Lógica para obtener los datos filtrados
        List<Post> filteredData = ps.allPostsFilterJob(filter);
        model.addAttribute("allPosts", filteredData);
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
        return "index.jsp"; 
    }
    
    // Filtra los post de una determinada provincia
    @GetMapping("/filterDataProvince")
    public String filterDataProvince(@RequestParam String filter, Model model,HttpSession session) {
        // Lógica para obtener los datos filtrados
        List<Post> filteredData = ps.allPostsFilterProvince(filter);
        model.addAttribute("allPosts", filteredData);
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
        return "index.jsp"; 
    }
    
    // Filtra los posts por fecha de manera ascendente
    @GetMapping("/filterDataDateAsc")
    public String filterDataDateAsc(Model model,HttpSession session) {
        // Lógica para obtener los datos filtrados
        List<Post> filteredData = ps.allPostsFilterAsc();
        model.addAttribute("allPosts", filteredData);
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
        return "index.jsp"; 
    }
    
    // Filtra los posts por fecha de manera descendente
    @GetMapping("/filterDataDateDesc")
    public String filterDataDateDesc(Model model,HttpSession session) {
        // Lógica para obtener los datos filtrados
        List<Post> filteredData = ps.allPostsFilterDesc();
        model.addAttribute("allPosts", filteredData);
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
        return "index.jsp"; 
    }
    
    @GetMapping("/findUsers")
    public String findUsers(Model model,@RequestParam("search") String username) {
    	List<User> users = serv.usersContaining(username);
    	model.addAttribute("users", users);
    	return "findUsers.jsp";
    }
	
	@DeleteMapping("/user/delete/{id}")
	public String deleteUser(@PathVariable("id") Long id,
			                HttpSession session) {
		//REVISAMOS SESION
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
				
		serv.deleteUser(id);
		return "redirect:/dashboard";
	}
	
	
	
}
