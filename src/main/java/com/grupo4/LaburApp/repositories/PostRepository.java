package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Post;

@Repository
public interface PostRepository extends CrudRepository<Post, Long>{
	List <Post>findAll();
}
