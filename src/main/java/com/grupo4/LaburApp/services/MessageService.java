package com.grupo4.LaburApp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo4.LaburApp.models.Message;
import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.repositories.MessageRepository;

@Service
public class MessageService {

	@Autowired
	MessageRepository messageRepo;
	// Trae todos los mensajes
	public List <Message> allMessages(){
		return messageRepo.findAll();
	}
	// Trae todos los mensajes en orden ascendente
	public List <Message> allMessagesAsc(){
		return messageRepo.findAllByOrderByCreatedAtAsc();
	}
	// Trae todos los mensajes en orden ascendente
	public List <Message> allMessagesDesc(){
		return messageRepo.findAllByOrderByCreatedAtDesc();
	}
	// Trae todos los mensajes de un determinado usuario
	public List <Message> allMessagesUser(Long id){
		return messageRepo.findAllBySenderMessageId(id);
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
	public void deleteMessage(Long id) {
		messageRepo.deleteById(id);
	}
}
