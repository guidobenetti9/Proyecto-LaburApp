package com.grupo4.LaburApp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.JobsService;

import jakarta.servlet.http.HttpSession;

@Controller
public class JobsController {

	@Autowired
	JobsService js;
	
	@DeleteMapping("/job/delete/{id}")
	public String deleteJob(@PathVariable("id") Long id,
			                HttpSession session) {
		//REVISAMOS SESION
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
				
		js.deleteJob(id);
		return "redirect:/adminjobs";
	}
}
