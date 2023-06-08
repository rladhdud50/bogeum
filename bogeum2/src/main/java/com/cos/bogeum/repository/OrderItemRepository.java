package com.cos.bogeum.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.bogeum.model.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Integer>{
	// id에 해당하는 주문아이템 찾기
	List<OrderItem> findOrderItemsByUserId(int userId);
	// OrderItem 하나 찾기
	OrderItem findOrderItemById(int orderItemId);
	
	List<OrderItem> findAll();
}
