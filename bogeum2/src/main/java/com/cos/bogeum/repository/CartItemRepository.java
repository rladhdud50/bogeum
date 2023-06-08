package com.cos.bogeum.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.bogeum.model.Cart;
import com.cos.bogeum.model.CartItem;

public interface CartItemRepository extends JpaRepository<CartItem, Integer>{
	CartItem findByCartIdAndItemId(int cartId, int itemId);
	List<CartItem> findByCart(Cart userCart);
}
