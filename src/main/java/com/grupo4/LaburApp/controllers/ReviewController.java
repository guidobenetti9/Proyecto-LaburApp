package com.grupo4.LaburApp.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
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
public class ReviewController {

	@Autowired
	ReviewService rs;
	
	@Autowired
	PostService ps;
	
	@Autowired
	JobsService js;
	
	
	/*@GetMapping("/post/create")
	public String createPost(@ModelAttribute("newJob") Jobs newJob) {
		return "newJob.jsp";
	}*/
	
	@PostMapping("/review/create/{postId}")
	public String newPost(@PathVariable("postId") Long postId, Model model,@Valid @ModelAttribute("newReview") Review newReview, BindingResult result) {
		if(result.hasErrors()) {
			Post post = ps.post(postId);
			List<Review> reviews = rs.reviewsByPost(postId);
			model.addAttribute("post", post);
			model.addAttribute("reviews", reviews);
			return "post.jsp";
		} else {
			rs.newReview(newReview);
			return "redirect:/";
		}
	}
	
	@DeleteMapping("/review/delete/{id}")
	public String deleteReview(@PathVariable("id") Long id,
			                HttpSession session) {
		//REVISAMOS SESION
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
				
		rs.deleteReview(id);
		return "redirect:/adminreviews";
	}
}
