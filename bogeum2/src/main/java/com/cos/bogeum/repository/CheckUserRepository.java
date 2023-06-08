package com.cos.bogeum.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.bogeum.model.Users;


public interface CheckUserRepository extends JpaRepository<Users,Integer> {
	Users findByUsername(String username);

	
}
