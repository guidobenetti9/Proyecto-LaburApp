package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Jobs;
import com.grupo4.LaburApp.models.Post;

@Repository
public interface JobsRepository extends CrudRepository<Jobs, Long>{
	List <Jobs> findAll();
	//
	List<Jobs> findAllByjobName(String job);
	
}
