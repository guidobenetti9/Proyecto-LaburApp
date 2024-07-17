package com.grupo4.LaburApp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo4.LaburApp.models.Message;
import com.grupo4.LaburApp.repositories.MessageRepository;

@Service
public class MessageService {

	@Autowired
	MessageRepository messageRepo;
	
	public List <Message> allMessages(){
		return messageRepo.findAll();
	}
}
