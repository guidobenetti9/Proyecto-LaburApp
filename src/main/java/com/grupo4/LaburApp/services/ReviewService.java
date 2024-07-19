package com.grupo4.LaburApp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo4.LaburApp.models.Review;
import com.grupo4.LaburApp.repositories.ReviewRepository;

@Service
public class ReviewService {

	@Autowired
	ReviewRepository reviewRepo;
	// Devuelve todas las reviews
	public List<Review> allReviews(){
		return reviewRepo.findAll();
	}
	
	// Devuelve una review
	public Review review(Long id) {
		return reviewRepo.findById(id).orElse(null);
	}
	
	// Crea y edita una review
	public Review newReview(Review review) {
		return reviewRepo.save(review);
	}
	
	// Elimina un review
	public void deleteReview(Long id) {
		reviewRepo.deleteById(id);
	}
	
	// Devuelve todos los review de forma ascendente por estrellas
	public List<Review> allReviewsStarAsc(){
		return reviewRepo.findAllByOrderByStarsAsc();
	}
	
	// Devuelve todos los review de forma descendente por estrellas
	public List<Review> allReviewsStarDesc(){
		return reviewRepo.findAllByOrderByStarsDesc();
	}
	
	// Devuelve todos los review de forma ascendente por fecha
	public List<Review> allReviewsDateAsc(){
		return reviewRepo.findAllByOrderByCreatedAtAsc();
	}
	
	// Devuelve todos los review de forma descendente por fecha
	public List<Review> allReviewsDateDesc(){
		return reviewRepo.findAllByOrderByCreatedAtDesc();
	}
}
