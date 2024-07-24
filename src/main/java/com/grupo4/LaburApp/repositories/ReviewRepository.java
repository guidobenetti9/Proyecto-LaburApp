package com.grupo4.LaburApp.repositories;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
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
	// Obtiene el promedio de estrellas
    @Query(value = "SELECT AVG(stars) FROM reviews WHERE post_id = :postId", nativeQuery = true)
    Double findAverageStarsByPostId(@Param("postId") Long postId);
    
    @Query(value = "SELECT AVG(stars) FROM reviews", nativeQuery = true)
    Double findAverageRating();
    
    @Query(value = "SELECT post_id, AVG(stars) AS average_rating FROM reviews GROUP BY post_id", nativeQuery = true)
    List<Object[]> findAverageRatingByPost();
}
