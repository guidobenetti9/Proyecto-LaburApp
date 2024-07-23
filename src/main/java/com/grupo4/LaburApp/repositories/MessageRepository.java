package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Message;


@Repository
public interface MessageRepository extends CrudRepository<Message, Long>  {
	List <Message> findAll();
	// Me trae todos los mensajes en orden ascendente
	List<Message> findAllByOrderByCreatedAtAsc();
	// Me trae todos los mensajes en orden descendente
	List<Message> findAllByOrderByCreatedAtDesc();
	// Me trae todos los mensajes en orden descendente
	List<Message> findAllBySenderMessageId(Long id);
	// Me trae todos los mensajes de un determinado Post
	List<Message> findAllBypostMessageIdOrderByCreatedAtDesc(Long id);
	
}
