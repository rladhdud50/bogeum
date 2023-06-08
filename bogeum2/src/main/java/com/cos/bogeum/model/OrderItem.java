package com.cos.bogeum.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
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

@Table(name="orderItem")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name = "ORDERITEM_SEQ_GENERATOR1"
		, sequenceName = "ORDERITEM_SEQ1"
	    , initialValue = 1
	    , allocationSize = 1
		)
public class OrderItem {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="ORDERITEM_SEQ_GENERATOR1")
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="orderId")
	private Order order;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="userId")
	private Users user;
		
	private int itemId; // 주문 상품 번호
    private String itemName; // 주문 상품 이름
    private int itemPrice; // 주문 상품 가격
    private int itemCount; // 주문 상품 수량
    private int itemTotalPrice; // 가격*수량
	
    //장바구니 전체주문
    public static OrderItem createOrderItem(int itemId, Users user, CartItem cartItem) {
    	OrderItem orderItem = new OrderItem();
    	orderItem.setItemId(itemId);
    	orderItem.setUser(user);
    	orderItem.setItemName(cartItem.getItem().getName());
    	orderItem.setItemPrice(cartItem.getItem().getPrice());
    	orderItem.setItemCount(cartItem.getCount());
    	orderItem.setItemTotalPrice(cartItem.getItem().getPrice()*cartItem.getCount());
    	return orderItem;
    }
    //상품 개별주문
    public static OrderItem createOrderItem(int itemId, Users user, items item, int count, Order order) {
    	OrderItem orderItem = new OrderItem();
    	orderItem.setItemId(itemId);
    	orderItem.setUser(user);
    	orderItem.setOrder(order);
    	orderItem.setItemName(item.getName());
    	orderItem.setItemPrice(item.getPrice());
    	orderItem.setItemCount(count);
    	orderItem.setItemTotalPrice(item.getPrice()*count);
    	return orderItem;
    }
}
