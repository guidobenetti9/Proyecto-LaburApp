package com.grupo4.LaburApp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo4.LaburApp.models.Jobs;
import com.grupo4.LaburApp.models.Message;
import com.grupo4.LaburApp.repositories.MessageRepository;

@Service
public class MessageService {

	@Autowired
	MessageRepository messageRepo;
	// Trae todos los mensajes
	public List <Message> allMessages(){
		return messageRepo.findAll();
	}
	// Trae todos los mensajes en orden descendente
	public List <Message> allMessagesDesc(){
		return messageRepo.findAllOrderByCreatedAtDesc();
	}
	// Trae todos los mensajes en orden ascendente
	public List <Message> allMessagesAsc(){
		return messageRepo.findAllOrderByCreatedAtAsc();
	}
	// Trae todos los mensajes de un determinado usuario
	public List <Message> allMessagesUser(Long id){
		return messageRepo.findAllBySenderMessage(id);
	}
	//Devuelve un message
		public Message message(Long id) {
			return messageRepo.findById(id).orElse(null);
	}
	// Crea un mensaje
	public Message newMessage(Message message) {
		return messageRepo.save(message);
	}
	// Elimina un mensaje
	public void deletemessage(Message message) {
		messageRepo.delete(message);
	}
}
