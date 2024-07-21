package com.grupo4.LaburApp.controllers;

import java.util.Arrays;
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
import com.grupo4.LaburApp.models.Review;
import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.JobsService;
import com.grupo4.LaburApp.services.PostService;
import com.grupo4.LaburApp.services.ReviewService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class PostController {

	@Autowired
	PostService ps;
	
	@Autowired
	JobsService js;
	
	@Autowired
	ReviewService rs;
	private List<String> getProvinces() {
	        return Arrays.asList(
	            "Buenos Aires","CABA", "Catamarca", "Chaco", "Chubut", "Córdoba", 
	            "Corrientes", "Entre Ríos", "Formosa", "Jujuy", "La Pampa", 
	            "La Rioja", "Mendoza", "Misiones", "Neuquén", "Río Negro", 
	            "Salta", "San Juan", "San Luis", "Santa Cruz", "Santa Fe", 
	            "Santiago del Estero", "Tierra del Fuego", "Tucumán"
	        );
	}
	
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
        model.addAttribute("days", Arrays.asList("Lunes", "Martes", "Miercoles","Jueves","Viernes","Sabado","Domingo"));
        model.addAttribute("provinces", getProvinces());
		
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
	
	@GetMapping("/post/{id}")
	public String postDetails(Model model, @PathVariable("id") Long id,@ModelAttribute("newReview") Review newReview) {
		Post post = ps.post(id);
		List<Review> reviews = rs.reviewsByPost(id);
		model.addAttribute("post", post);
		model.addAttribute("reviews", reviews);
		return "post.jsp";
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
