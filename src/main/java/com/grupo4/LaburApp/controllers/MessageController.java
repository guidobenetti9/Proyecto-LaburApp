package com.grupo4.LaburApp.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.grupo4.LaburApp.models.Message;
import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.services.MessageService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MessageController {

	@Autowired
	MessageService ms;
	
	@GetMapping("/messages")
	public String myMessages(Model model) {
		List <Message> messages = ms.allMessagesDesc(); 
		model.addAttribute("messages",messages);
		return "messages.jsp";
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
