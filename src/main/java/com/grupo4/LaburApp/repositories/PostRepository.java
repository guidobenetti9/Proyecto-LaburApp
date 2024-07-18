package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Post;

@Repository
public interface PostRepository extends CrudRepository<Post, Long>{
	List <Post>findAll();
	// Me trae todos los post filtrando por trabajo. Y en orden ascendente
	List<Post> findAllByJobsInPostOrderByCreatedAtAsc(String job);
	// Me trae todos los post filtrando por provincia. Y en orden ascendente
	List<Post> findAllByProvinceOrderByCreatedAtAsc(String province);
	// Me trae todos los post filtrando por Creador. Y en orden ascendente
	List<Post> findAllByCreatorPostOrderByCreatedAtAsc(String creatorPost);
	// Me trae todos los post en orden ascendente
	List<Post> findAllOrderByCreatedAtAsc();
	// Me trae todos los post en orden descendente
	List<Post> findAllOrderByCreatedAtDesc();
}
