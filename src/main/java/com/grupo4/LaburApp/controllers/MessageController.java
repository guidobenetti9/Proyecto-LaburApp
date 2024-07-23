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

import com.grupo4.LaburApp.models.Message;
import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.MessageService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MessageController {

	@Autowired
	MessageService ms;
	
	@GetMapping("/messages")
	public String myMessages(Model model,HttpSession session) {
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
		List <Message> messages = ms.allMessagesDesc(); 
		model.addAttribute("messages",messages);
		return "messages.jsp";
	}
	
	@PostMapping("/message/create")
	public String newMessage(HttpSession session,@Valid @ModelAttribute("newMessage") Message newMessage,BindingResult result) {
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			return "post.jsp";
		} else {
			ms.newMessage(newMessage);
			return "redirect:/";
		}
	}
	@DeleteMapping("/message/delete/{id}")
	public String deleteMessage(@PathVariable("id") Long id,
			                HttpSession session) {
		//REVISAMOS SESION
		User userTemp = (User) session.getAttribute("userInSession"); //Obj User o null
		if(userTemp == null) {
			return "redirect:/";
		}
				
		ms.deleteMessage(id);
		return "redirect:/adminmessages";
	}
}
