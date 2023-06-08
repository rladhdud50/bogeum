package com.cos.bogeum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.bogeum.service.CartItemService;
import com.cos.bogeum.service.CartService;

@Controller
public class CartItemController {
	@Autowired
	private CartItemService cartItemService;
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("api/cartItem/plus/{id}/{userId}")
	public String plus(@PathVariable int id, @PathVariable int userId) {
		System.out.println("호출");
		cartItemService.plusCartItem(id);
		cartService.plusCartCount(userId);
		return "redirect:/user/cart/"+userId;
	}
	@GetMapping("api/cartItem/minus/{id}/{userId}")
	public String minus(@PathVariable int id, @PathVariable int userId){
		cartItemService.minusCartItem(id);
		cartService.minusCartCount(userId);
		return "redirect:/user/cart/"+userId;
	}
}
