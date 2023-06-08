package com.cos.bogeum.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.bogeum.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{
	List<Order> findOrdersByUserId(int id);
	Order findOrderById(int orderId);
}
