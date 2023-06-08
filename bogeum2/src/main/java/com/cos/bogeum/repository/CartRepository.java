package com.cos.bogeum.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.bogeum.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer>{
	Cart findByUserId(int id);
}
