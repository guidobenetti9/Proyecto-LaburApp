package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Message;

@Repository
public interface MessageRepository extends CrudRepository<Message, Long>  {
	List <Message> findAll();
}
