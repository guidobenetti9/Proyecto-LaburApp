package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.Post;

@Repository
public interface PostRepository extends CrudRepository<Post, Long>{
	List <Post>findAll();
	// Me trae todos los post filtrando por trabajo. Y en orden ascendente
	List<Post> findAllByTypePostAndJobsInPostIdOrderByCreatedAtAsc(String typePost,Long jobId);
	// Me trae todos los post filtrando por provincia. Y en orden ascendente
	List<Post> findAllByTypePostAndProvinceOrderByCreatedAtAsc(String typePost, String province);
	// Me trae todos los post filtrando por Creador. Y en orden ascendente
	List<Post> findAllByCreatorPostIdOrderByCreatedAtAsc(Long creatorPost);
	// Me trae todos los post filtrando por tipo. Y en orden ascendente
		List<Post> findAllByTypePostOrderByCreatedAtAsc(String typePost);
	// Me trae todos los post en orden ascendente
	//List<Post> findAllByTypePostByOrderByCreatedAtAsc(String typePost);
	// Me trae todos los post en orden descendente
	List<Post> findAllByTypePostOrderByCreatedAtDesc(String typePost);
}
