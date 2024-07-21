package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Review;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long>{
	List<Review> findAll();
	// Me trae todos los reviews en orden ascendente por estrellas
	List<Review> findAllByOrderByStarsAsc();
	// Me trae todos los reviews en orden descendente por estrellas
	List<Review> findAllByOrderByStarsDesc();
	// Me trae todos los reviews en orden ascendente por fecha
	List<Review> findAllByOrderByCreatedAtAsc();
	// Me trae todos los reviews en orden descendente por fecha
	List<Review> findAllByOrderByCreatedAtDesc();
	// Me trae todos los reviews de un determinado post en orden descendente por fecha
	List<Review> findAllByPostReviewIdOrderByCreatedAtDesc(Long id);
}
