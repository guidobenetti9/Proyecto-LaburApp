package com.grupo4.LaburApp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo4.LaburApp.repositories.MessageRepository;

@Service
public class MessageService {

	@Autowired
	MessageRepository messageRepo;
}
