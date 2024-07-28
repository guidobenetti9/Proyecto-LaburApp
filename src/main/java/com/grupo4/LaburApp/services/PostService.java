package com.grupo4.LaburApp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo4.LaburApp.models.Post;
import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.repositories.PostRepository;
import com.grupo4.LaburApp.repositories.UserRepository;

@Service
public class PostService {

	@Autowired
	PostRepository postRepo;
	@Autowired
	UserRepository userRepo;
	
	// Devuelve todos los posts
	public List <Post> allPosts(){
		return postRepo.findAll();
		
	}
	// Devuelve un post
	public Post post(Long id) {
		return postRepo.findById(id).orElse(null);
	}
	
	// Crea y editar un nuevo Post
	public Post newPost(Post post) {
		return postRepo.save(post);
	}
	
	// Elimina un post
	public void deletePost(Long id) {
		postRepo.deleteById(id);
	}
	
	// Devuelve todos los posts filtrados por trabajos (jobs). 
	// Se pasa el Id del trabajo
	public List <Post> allPostsFilterJob(String typePost, Long jobId){
		return postRepo.findAllByTypePostAndJobsInPostIdOrderByCreatedAtAsc(typePost,jobId);
	}
	
	// Devuelve todos los posts filtrados por provincias (province). 
	// Se pasa el nombre de la provincia
	public List <Post> allPostsFilterProvince(String typePost,String province){
		return postRepo.findAllByTypePostAndProvinceOrderByCreatedAtAsc(typePost,province);
	}
	
	// Devuelve todos los posts filtrados por Creador (creatorPost). 
	// Se pasa el Id del creatorPost (User)
	public List <Post> allPostsFilterCreator(Long creatorPost){
		return postRepo.findAllByCreatorPostIdOrderByCreatedAtAsc(creatorPost);
	}
	
	// Devuelve todos los posts ordenados de forma ascendente 
	public List <Post> allPostsFilterAsc(String typePost){
		return postRepo.findAllByTypePostOrderByCreatedAtAsc(typePost);
	}
	
	// Devuelve todos los posts ordenados de forma descendente 
	public List <Post> allPostsFilterDesc(String typePost){
		return postRepo.findAllByTypePostOrderByCreatedAtDesc(typePost);
	}
	
	// Devuelve todos los posts de acuerdo a su tipo ordenados de forma descendente 
	public List <Post> allPostsFilterType(String typePost){
		return postRepo.findAllByTypePostOrderByCreatedAtAsc(typePost);
	}
	
	public void addFavorite(Long userId,Long postId) {
		User myUser = userRepo.findById(userId).orElse(null);
		Post projectToAdd = post(postId);
		projectToAdd.getFavoriteUsers().add(myUser);
		postRepo.save(projectToAdd);
	}
	
	
	// Devuelve todos los posts de acuerdo a su tipo y creador ordenados de forma ascendente 
	public List <Post> allPostsFilterTypeAndCreator(String typePost,Long creatorId){
		return postRepo.findAllByTypePostAndCreatorPostIdOrderByCreatedAtAsc(typePost,creatorId);
	}
	
}
