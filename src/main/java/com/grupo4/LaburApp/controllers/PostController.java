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

import com.grupo4.LaburApp.models.Jobs;
import com.grupo4.LaburApp.models.Post;
import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.JobsService;
import com.grupo4.LaburApp.services.PostService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class PostController {

	@Autowired
	PostService ps;
	
	@Autowired
	JobsService js;
	
	@GetMapping("/newPost")
	public String newPost(HttpSession session,
			              @ModelAttribute("newPost") Post newPost,
			              Model model) {
		
		//Validación de que el usuario inició sesión
        User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
        if(userTemp == null) {
            return "redirect:/";
        }
        
        List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
		
		return "newPost.jsp";
	}
	
	@PostMapping("/newPost")
	public String createPost(@Valid @ModelAttribute("newPost") Post newPost,
							 BindingResult result,
							 HttpSession session,
							 Model model) {
		
		//Validación de que el usuario inició sesión
        User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
        if(userTemp == null) {
            return "redirect:/";
        }
        if(result.hasErrors()) {
        	List <Jobs> jobs = js.allJobs();
            model.addAttribute("allJobs", jobs);
            return "newPost.jsp";
        }else {
        	ps.newPost(newPost);
        	return "redirect:/";
        }
		
	}
	
	@DeleteMapping("/post/delete/{id}")
	public String deletePost(@PathVariable("id") Long id,
			                HttpSession session) {
		//REVISAMOS SESION
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
				
		ps.deletePost(id);
		return "redirect:/adminposts";
	}
}
