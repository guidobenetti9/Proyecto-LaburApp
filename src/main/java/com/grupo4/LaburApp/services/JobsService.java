package com.grupo4.LaburApp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo4.LaburApp.repositories.JobsRepository;

@Service
public class JobsService {

	@Autowired
	JobsRepository jobsRepo;
}
