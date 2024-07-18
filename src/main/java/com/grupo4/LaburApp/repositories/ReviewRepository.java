package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Review;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long>{
	List<Review> findAll();
	// Me trae todos los reviews en orden ascendente
	List<Review> findAllOrderByStarsAsc();
	// Me trae todos los reviews en orden descendente
	List<Review> findAllOrderByStarsDesc();
}
