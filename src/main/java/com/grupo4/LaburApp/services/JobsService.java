package com.grupo4.LaburApp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo4.LaburApp.models.Jobs;
import com.grupo4.LaburApp.repositories.JobsRepository;

@Service
public class JobsService {

	@Autowired
	JobsRepository jobsRepo;
	
	// Devuelve todos los trabajos
	public List<Jobs> allJobs(){
		return jobsRepo.findAll();
	}
	//Devuelve un trabajo
	public Jobs jobs(Long id) {
		return jobsRepo.findById(id).orElse(null);
	}
	// Crea y edita un trabajo
	public Jobs newJob(Jobs job) {
		return jobsRepo.save(job);
	}
	// Elimina un trabajo
	public void deleteJob(Long id) {
		jobsRepo.deleteById(id);
	}
}
