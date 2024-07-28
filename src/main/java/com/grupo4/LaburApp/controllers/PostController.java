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
import org.springframework.web.bind.annotation.PutMapping;

import com.grupo4.LaburApp.models.Jobs;
import com.grupo4.LaburApp.models.Post;
import com.grupo4.LaburApp.models.Review;
import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.JobsService;
import com.grupo4.LaburApp.services.PostService;
import com.grupo4.LaburApp.services.ReviewService;
import com.grupo4.LaburApp.services.UserService;

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
	
	@Autowired
	UserService us;
	
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
            return "redirect:/login";
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
            return "redirect:/login";
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
	
	@GetMapping("/newRequest")
	public String newRequest(HttpSession session,
			              	@ModelAttribute("newPost") Post newPost,
			              	Model model) {
		
		//Validación de que el usuario inició sesión
        User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
        if(userTemp == null) {
            return "redirect:/login";
        }
        
        List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
        model.addAttribute("provinces", getProvinces());
		
		return "newRequest.jsp";
	}
	
	@PostMapping("/newRequest")
	public String createRequest(@Valid @ModelAttribute("newPost") Post newPost,
							 	BindingResult result,
							 	HttpSession session,
							 	Model model) {
		
		//Validación de que el usuario inició sesión
        User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
        if(userTemp == null) {
            return "redirect:/login";
        }
        if(result.hasErrors()) {
        	System.out.print("Tenes un error che");
        	List <Jobs> jobs = js.allJobs();
            model.addAttribute("allJobs", jobs);
            return "newRequest.jsp";
        }else {
        	ps.newPost(newPost);
        	return "redirect:/";
        }
		
	}
	
	@GetMapping("/post/{id}")
	public String postDetails(Model model, 
			                  @PathVariable("id") Long id,
			                  @ModelAttribute("newReview") Review newReview,
			                  HttpSession session) {
		
		//Validación de que el usuario inició sesión
        User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
        if(userTemp == null) {
            return "redirect:/login";
        }
		
		Post post = ps.post(id);
		List<Review> reviews = rs.reviewsByPost(id);
		System.out.print(post.getLatitud());
		System.out.print(post.getLongitud());
		model.addAttribute("post", post);
		model.addAttribute("reviews", reviews);
		return "post.jsp";
	}
	
	@GetMapping("/post/edit/{id}")
	public String editPost(@PathVariable("id")Long id,
			               HttpSession session,
			               @ModelAttribute("newPost") Post newPost,
			               Model model) {
		
		//Validación de que el usuario inició sesión
        User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
        if(userTemp == null) {
            return "redirect:/login";
        }
        
        Post postToEdit = ps.post(id);
        model.addAttribute("post", postToEdit);
        if(userTemp.getId() != postToEdit.getCreatorPost().getId()) {
        	return "redirect:/";
        }
        
        List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
        model.addAttribute("days", Arrays.asList("Lunes", "Martes", "Miercoles","Jueves","Viernes","Sabado","Domingo"));
        model.addAttribute("provinces", getProvinces());
        
        return "editPost.jsp";
		
	}
	
	@PutMapping("/editPost")
	public String updatePost(HttpSession session,
			                 @Valid @ModelAttribute("newPost") Post newPost,
			                 BindingResult result,
			                 Model model) {
		
		 User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
	        if(userTemp == null) {
	            return "redirect:/login";
	        }
	      if(result.hasErrors()) {
	    	  List <Jobs> jobs = js.allJobs();
	          model.addAttribute("allJobs", jobs);
	          return "editPost.jsp";
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
		return "redirect:/";
	}
	
    @GetMapping("/favoritePosts/{id}")
    public String favoritePostsView(@PathVariable("id") Long id,
    						Model model,
    						HttpSession session) {
        User userTemp = (User) session.getAttribute("userInSession");//obj user o null
        if(userTemp==null) {
            return "redirect:/";
        }
        
        Post favoritePosts= ps.post(id);
        User UserWithFavoritePosts = us.user(id);
        
        model.addAttribute("UserInFavorites", UserWithFavoritePosts);
        model.addAttribute("allFavorites", favoritePosts);

    	return "favorites.jsp";
    }
    
	@GetMapping("/favoritePost/add/{id}")
	public String addFavorite(@PathVariable("id") Long id,
								HttpSession session
								) {
        User userTemp = (User) session.getAttribute("userInSession");//obj user o null
        if(userTemp==null) {
            return "redirect:/";
        }else {
        	ps.addFavorite(userTemp.getId(), id);
        	return "redirect:/";
        }	
	}
	
	@GetMapping("/request/{id}")
	public String requestDetails(Model model, 
			                  	@PathVariable("id") Long id,
			                  	HttpSession session) {
		
		//Validación de que el usuario inició sesión
        User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
        if(userTemp == null) {
            return "redirect:/login";
        }
		
		Post post = ps.post(id);
		System.out.print(post.getLatitud());
		System.out.print(post.getLongitud());
		model.addAttribute("post", post);
		return "request.jsp";
	}
	
	@GetMapping("/request/edit/{id}")
	public String editRequest(@PathVariable("id")Long id,
			               	HttpSession session,
			               	@ModelAttribute("newPost") Post newPost,
			               	Model model) {
		
		//Validación de que el usuario inició sesión
        User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
        if(userTemp == null) {
            return "redirect:/";
        }
        
        Post postToEdit = ps.post(id);
        model.addAttribute("post", postToEdit);
        if(userTemp.getId() != postToEdit.getCreatorPost().getId()) {
        	return "redirect:/";
        }
        
        List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
        model.addAttribute("provinces", getProvinces());
        
        return "editRequest.jsp";
		
	}
	
	@PutMapping("/editRequest")
	public String updateRequest(HttpSession session,
			                 	@Valid @ModelAttribute("newPost") Post newPost,
			                 	BindingResult result,
			                 	Model model) {
		
		 User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
	        if(userTemp == null) {
	            return "redirect:/";
	        }
	      if(result.hasErrors()) {
	    	  List <Jobs> jobs = js.allJobs();
	          model.addAttribute("allJobs", jobs);
	          return "editRequest.jsp";
	      }else {
	    	  ps.newPost(newPost);
	    	  return "redirect:/";
	      }
		
	}
}
