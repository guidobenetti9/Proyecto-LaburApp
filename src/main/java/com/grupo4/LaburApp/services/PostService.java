package com.grupo4.LaburApp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo4.LaburApp.models.Post;
import com.grupo4.LaburApp.repositories.PostRepository;

@Service
public class PostService {

	@Autowired
	PostRepository postRepo;
	
	public List <Post> allPosts(){
		return postRepo.findAll();
	}
}
