package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Message;
import com.grupo4.LaburApp.models.Post;

@Repository
public interface MessageRepository extends CrudRepository<Message, Long>  {
	List <Message> findAll();
	// Me trae todos los mensajes en orden ascendente
	List<Message> findAllOrderByCreatedAtAsc();
	// Me trae todos los mensajes en orden descendente
	List<Message> findAllOrderByCreatedAtDesc();
	// Me trae todos los mensajes en orden descendente
	List<Message> findAllBySenderMessage(Long id);
	
}
