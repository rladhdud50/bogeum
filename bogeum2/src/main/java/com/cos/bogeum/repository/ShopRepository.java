package com.cos.bogeum.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.bogeum.model.items;


public interface ShopRepository extends JpaRepository<items, Integer>{
	items findItemById(int itemId);
	
	@Query("SELECT count(1) FROM items")
	items findByItemCount();
}
