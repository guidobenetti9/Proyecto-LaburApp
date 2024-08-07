package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Work;

@Repository
public interface WorkRepository extends CrudRepository<Work, Long>{
	List <Work> findAll();
	
	List<Work> findAllByCompleted(Boolean completed);
}
