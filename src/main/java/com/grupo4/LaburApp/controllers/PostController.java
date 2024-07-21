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
	
	@GetMapping("/post/create")
	public String createPost(Model model, @ModelAttribute("newPost") Post newPost,HttpSession session) {
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
		model.addAttribute("days", Arrays.asList("Lunes", "Martes", "Miercoles","Jueves","Viernes","Sabado","Domingo"));
		model.addAttribute("provinces", getProvinces());
		model.addAttribute("jobs",js.allJobs());
		return "newPost.jsp";
	}
	
	@GetMapping("/post/{id}")
	public String postDetails(Model model, @PathVariable("id") Long id,@ModelAttribute("newReview") Review newReview) {
		Post post = ps.post(id);
		List<Review> reviews = rs.reviewsByPost(id);
		model.addAttribute("post", post);
		model.addAttribute("reviews", reviews);
		return "post.jsp";
	}
    private List<String> getProvinces() {
        return Arrays.asList(
            "Buenos Aires","CABA", "Catamarca", "Chaco", "Chubut", "Córdoba", 
            "Corrientes", "Entre Ríos", "Formosa", "Jujuy", "La Pampa", 
            "La Rioja", "Mendoza", "Misiones", "Neuquén", "Río Negro", 
            "Salta", "San Juan", "San Luis", "Santa Cruz", "Santa Fe", 
            "Santiago del Estero", "Tierra del Fuego", "Tucumán"
        );
    }
    
	@PostMapping("/post/create")
	public String newPost(@Valid @ModelAttribute("newPost") Post newPost, BindingResult result) {
		if(result.hasErrors()) {
			return "newPost.jsp";
		} else {
			// Convierte la lista de categorías seleccionadas en una cadena
            String availableDays = newPost.getAvailableDays() != null ? String.join(",", newPost.getAvailableDays()) : "";

            // Asigna la cadena de categorías al nuevo post
            newPost.setAvailableDays(availableDays);
            // Guarda el posteo
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
