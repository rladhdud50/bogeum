package com.cos.bogeum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.bogeum.model.CartItem;
import com.cos.bogeum.repository.CartItemRepository;

@Service
public class CartItemService {
	@Autowired
	private CartItemRepository cartItemRepository;
	
	@Transactional
	public void plusCartItem(int id) {
		CartItem cartItem = cartItemRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("제품 찾기 실패");
		});
		int count = cartItem.getCount();
		cartItem.setCount(count+1);
	}
	@Transactional
	public void minusCartItem(int id) {
		CartItem cartItem = cartItemRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("제품 찾기 실패");
		});
		int count = cartItem.getCount();
		int cnt = count-1;
		if(cnt >= 1) {
			cartItem.setCount(cnt);
		} else {
			cartItem.setCount(1);
		}
	}
}
