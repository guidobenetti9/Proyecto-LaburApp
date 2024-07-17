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
	public List<Work> allWorks(){
		return workRepo.findAll();
	}
}
