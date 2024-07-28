package com.grupo4.LaburApp.controllers;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
public class UserController {

	@Autowired
	UserService serv;
	
	@Autowired
	PostService ps;
	
	@Autowired
	JobsService js;
	
	@Autowired
	ReviewService rs;
	

	
	@GetMapping("/register")
	public String registro(@ModelAttribute("newUser") User newUser) {
		return "register.jsp";
	}
	
	@GetMapping("/userProfile")
	public String userProfile(Model model, HttpSession session) {
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/login";
		}
		model.addAttribute("userInSession",userTemp);
		return "myUserProfile.jsp";
	}
	
	@GetMapping("/userProfile/{id}")
	public String userProfileNotLogin(Model model, @PathVariable("id") Long id) {
		User user = serv.user(id);
		List<Post> posts = ps.allPostsFilterTypeAndCreator("Ofrecido",id);
		List<Post> postsRequests = ps.allPostsFilterTypeAndCreator("Solicitado",id);
		List<Review> reviews = rs.allReviewsDateDesc();
		model.addAttribute("user",user);
		model.addAttribute("posts",posts);
		model.addAttribute("postsRequests",postsRequests);
		model.addAttribute("reviews",reviews);
		return "anotherProfile.jsp";
	}
	
	@GetMapping("/user/edit/{id}")
	public String editProfile(@PathVariable("id")Long id,
			               		HttpSession session,
			               		@ModelAttribute("newUser") User newUser,
			               		Model model) {
		
		//Validación de que el usuario inició sesión
        User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
        if(userTemp == null) {
            return "redirect:/";
        }
        
        model.addAttribute("confirm", userTemp.getConfirm());
        User userToEdit = serv.user(id);
        model.addAttribute("user", userToEdit);
        
        
        return "editProfile.jsp";
		
	}
	
	@PutMapping("/editProfile")
	public String updateProfile(HttpSession session,
			                 	@Valid @ModelAttribute("newUser") User newUser,
			                 	BindingResult result,
			                 	Model model) {
		
		 User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
	        if(userTemp == null) {
	            return "redirect:/";
	        }
	      if(result.hasErrors()) {
	    	  for (FieldError error : result.getFieldErrors()) {
	              System.out.println("Error en el campo: " + error.getField() + ", Mensaje: " + error.getDefaultMessage());
	          
	    	  }
	    	  return "editProfile.jsp";
	    	  }else { 
	    	  serv.saveOrUpdate(newUser, result);
	    	  return "redirect:/userProfile";
	      }
		
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
	
	private List<String> getProvinces() {
        return Arrays.asList(
            "Buenos Aires","CABA", "Catamarca", "Chaco", "Chubut", "Córdoba", 
            "Corrientes", "Entre Ríos", "Formosa", "Jujuy", "La Pampa", 
            "La Rioja", "Mendoza", "Misiones", "Neuquén", "Río Negro", 
            "Salta", "San Juan", "San Luis", "Santa Cruz", "Santa Fe", 
            "Santiago del Estero", "Tierra del Fuego", "Tucumán"
        );
}
	
	@GetMapping("/")
	public String index(Model model,HttpSession session) {
		
		List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
        //Map<Long, Double> reviews = rs.getAverageRatingByPost();;
        //model.addAttribute("allReviews",reviews);
		model.addAttribute("allPosts", ps.allPosts());
		model.addAttribute("allOffered", ps.allPostsFilterType("Ofrecido"));
		model.addAttribute("allRequests", ps.allPostsFilterType("Solicitado"));
		model.addAttribute("provinces", getProvinces());
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
		return "index.jsp";
	}
	
	// Filtra los post por un determinado Job (Rubro)
	@GetMapping("/filterDataJob")
    public String filterDataJob(@RequestParam("job") Long job, Model model,HttpSession session) {
        // Lógica para obtener los datos filtrados
        List<Post> ofrecidos = ps.allPostsFilterJob("Ofrecido",job);
        List<Post> solicitados = ps.allPostsFilterJob("Solicitado",job);
        model.addAttribute("allOffered", ofrecidos);
		model.addAttribute("allRequests", solicitados);
        //model.addAttribute("allPosts", filteredData);
        List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
       // Map<Long, Double> reviews = rs.getAverageRatingByPost();;
       // model.addAttribute("allReviews",reviews);
		model.addAttribute("provinces", getProvinces());
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
        return "index.jsp"; 
    }
    
    // Filtra los post de una determinada provincia
    @GetMapping("/filterDataProvince")
    public String filterDataProvince(@RequestParam("province") String province, Model model,HttpSession session) {
        // Lógica para obtener los datos filtrados
        //List<Post> filteredData = ps.allPostsFilterProvince(province);
        //model.addAttribute("allPosts", filteredData);
        List<Post> ofrecidos = ps.allPostsFilterProvince("Ofrecido",province);
        List<Post> solicitados = ps.allPostsFilterProvince("Solicitado",province);
        model.addAttribute("allOffered", ofrecidos);
		model.addAttribute("allRequests", solicitados);
        List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
       // Map<Long, Double> reviews = rs.getAverageRatingByPost();;
       // model.addAttribute("allReviews",reviews);
		model.addAttribute("provinces", getProvinces());
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
        return "index.jsp"; 
    }
    
    // Filtra los post de un determinado tipo
    @GetMapping("/filterTypePost")
    public String filterTypePost(@RequestParam("typePost") String typePost, Model model,HttpSession session) {
        // Lógica para obtener los datos filtrados
        List<Post> filteredData = ps.allPostsFilterType(typePost);
        model.addAttribute("allPosts", filteredData);
        List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
        //Map<Long, Double> reviews = rs.getAverageRatingByPost();;
       // model.addAttribute("allReviews",reviews);
		model.addAttribute("provinces", getProvinces());
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
        return "index.jsp"; 
    }
    
    // Filtra los posts por fecha de manera ascendente
    @GetMapping("/filterDataDateAsc")
    public String filterDataDateAsc(Model model,HttpSession session) {
        // Lógica para obtener los datos filtrados
        //List<Post> filteredData = ps.allPostsFilterAsc();
        //model.addAttribute("allPosts", filteredData);
        List<Post> ofrecidos = ps.allPostsFilterAsc("Ofrecido");
        List<Post> solicitados = ps.allPostsFilterAsc("Solicitado");
        model.addAttribute("allOffered", ofrecidos);
		model.addAttribute("allRequests", solicitados);
        List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
        //Map<Long, Double> reviews = rs.getAverageRatingByPost();;
       // model.addAttribute("allReviews",reviews);
		model.addAttribute("provinces", getProvinces());
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
        return "index.jsp"; 
    }
    
    // Filtra los posts por fecha de manera descendente
    @GetMapping("/filterDataDateDesc")
    public String filterDataDateDesc(Model model,HttpSession session) {
        // Lógica para obtener los datos filtrados
        //List<Post> filteredData = ps.allPostsFilterDesc();
        //model.addAttribute("allPosts", filteredData);
    	List<Post> ofrecidos = ps.allPostsFilterDesc("Ofrecido");
        List<Post> solicitados = ps.allPostsFilterDesc("Solicitado");
        model.addAttribute("allOffered", ofrecidos);
		model.addAttribute("allRequests", solicitados);
        List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
        //Map<Long, Double> reviews = rs.getAverageRatingByPost();;
       // model.addAttribute("allReviews",reviews);
		model.addAttribute("provinces", getProvinces());
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
        return "index.jsp"; 
    }
    
    @GetMapping("/findUsers")
    public String findUsers(HttpSession session,Model model,@RequestParam("search") String username) {
    	List<User> users = serv.usersContaining(username);
    	model.addAttribute("users", users);

		String url2 = "https://dolarapi.com/v1/dolares";
		RestTemplate restTemplate2 = new RestTemplate();
		Object dolares = restTemplate2.getForObject(url2, Object.class);
		
		model.addAttribute("dolares", dolares);
		List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
		model.addAttribute("allPosts", ps.allPosts());
		model.addAttribute("provinces", getProvinces());
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
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
	
	@GetMapping("/newsArgentina")
	public String newsArgentina(Model model,HttpSession session) {
		String url = "https://newsapi.org/v2/top-headlines?sources=google-news-ar&apiKey=996e01e65e814f1d80cfa219f6340eb9";
		RestTemplate restTemplate = new RestTemplate();
		Object news = restTemplate.getForObject(url, Object.class);
		
		String url2 = "https://dolarapi.com/v1/dolares";
		RestTemplate restTemplate2 = new RestTemplate();
		Object dolares = restTemplate2.getForObject(url2, Object.class);
		
		model.addAttribute("news", news);
		model.addAttribute("dolares", dolares);
		List <Jobs> jobs = js.allJobs();
        model.addAttribute("allJobs", jobs);
		model.addAttribute("allPosts", ps.allPosts());
		model.addAttribute("provinces", getProvinces());
		model.addAttribute("userInSession",session.getAttribute("userInSession"));
		return "newsArgentina.jsp";
	}
	
	
}
