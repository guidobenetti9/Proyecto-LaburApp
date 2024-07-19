package com.grupo4.LaburApp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo4.LaburApp.models.Work;
import com.grupo4.LaburApp.repositories.WorkRepository;

@Service
public class WorkService {

	@Autowired
	WorkRepository workRepo;
	// Devuelve todos los works
	public List<Work> allWorks(){
		return workRepo.findAll();
	}
	
	// Devuelve un work
	public Work work(Long id) {
		return workRepo.findById(id).orElse(null);
	}
	
	// Crea y edita un work
	public Work newWork(Work work) {
		return workRepo.save(work);
	}
	
	// Elimina un work
	public void deleteWork(Work work) {
		workRepo.delete(work);
	}
	
	// Devuelve los work si estan completos (0) o no (1). Completed tiene que ser 0 o 1
	public List<Work> allWorksCompletedOrNot(Boolean completed){
		return workRepo.findAllByCompleted(completed);
	}
}
