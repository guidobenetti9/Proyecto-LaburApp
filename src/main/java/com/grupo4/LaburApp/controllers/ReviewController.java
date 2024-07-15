package com.grupo4.LaburApp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.grupo4.LaburApp.services.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService rs;
}
