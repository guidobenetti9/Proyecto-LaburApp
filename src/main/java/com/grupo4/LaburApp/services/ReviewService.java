package com.grupo4.LaburApp.services;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// Devuelva una lista de review de un determinado Post
	public List<Review> reviewsByPost(Long id){
		return reviewRepo.findAllByPostReviewIdOrderByCreatedAtDesc(id);
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
	
    public Double getAverageStarsByPostId(Long postId) {
        return reviewRepo.findAverageStarsByPostId(postId);
    }
    
    public Map<Long, Double> getAverageRatingByPost() {
        List<Object[]> results = reviewRepo.findAverageRatingByPost();
        Map<Long, Double> averageRatings = new HashMap<>();

        // Define el número de decimales a los que quieres redondear
        int decimalPlaces = 2;

        for (Object[] result : results) {
            Long postId = ((Number) result[0]).longValue(); // Convertir Object a Long
            Double averageRating = ((Number) result[1]).doubleValue(); // Convertir Object a Double

            // Redondear el promedio a decimalPlaces decimales
            BigDecimal bd = new BigDecimal(averageRating);
            bd = bd.setScale(decimalPlaces, RoundingMode.HALF_UP); // Redondeo

            // Convertir a Double y agregar al mapa
            averageRatings.put(postId, bd.doubleValue());
        }

        return averageRatings;
    }
}
