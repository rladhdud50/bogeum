package com.cos.bogeum.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="cartItem")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name = "CART_SEQ_GENERATOR2"
		, sequenceName = "CART_SEQ2"
	    , initialValue = 1
	    , allocationSize = 1
		)
public class CartItem {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CART_SEQ_GENERATOR2")
	private int id;	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="cartId")
	private Cart cart;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="itemId")
	private items item;
	
	private int count; //상품 갯수
	
	public static CartItem createCartItem(Cart cart, items item, int amount) {
		CartItem cartItem = new CartItem();
		cartItem.setCart(cart);
		cartItem.setItem(item);
		cartItem.setCount(amount);
		return cartItem;
	}
	
	public void addCount(int count) {	//장바구니에 담긴 물건 수량 증가
		this.count += count;
	}
}
