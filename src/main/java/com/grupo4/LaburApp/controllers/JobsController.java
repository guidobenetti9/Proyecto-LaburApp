package com.grupo4.LaburApp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.batch.BatchProperties.Job;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.grupo4.LaburApp.models.Jobs;
import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.JobsService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class JobsController {

	@Autowired
	JobsService js;
	
	@GetMapping("/job/create")
	public String createJob(@ModelAttribute("newJob") Jobs newJob) {
		return "newJob.jsp";
	}
	
	@PostMapping("/job/create")
	public String newJob(@Valid @ModelAttribute("newJob") Jobs newJob, BindingResult result) {
		if(result.hasErrors()) {
			return "newJob.jsp";
		} else {
			js.newJob(newJob);
			return "redirect:/";
		}
	}
	
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
