package com.grupo4.LaburApp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.grupo4.LaburApp.services.UserService;

@Controller
public class UserController {

	@Autowired
	UserService us;
}
