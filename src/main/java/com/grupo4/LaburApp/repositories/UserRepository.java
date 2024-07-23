package com.grupo4.LaburApp.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grupo4.LaburApp.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	List <User>findAll();
	User findByEmail(String email);
	User findByEsAdmin(Boolean admin);
	   @Query(value = "SELECT * FROM User u WHERE LOWER(u.username) LIKE LOWER(CONCAT('%', :keyword, '%')) OR LOWER(u.firstName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR LOWER(u.lastName) LIKE LOWER(CONCAT('%', :keyword, '%'))", nativeQuery = true)
	    List<User> findByKeywordContaining(@Param("keyword") String keyword);
}
