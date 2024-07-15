package com.grupo4.LaburApp.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Review;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long>{

}
