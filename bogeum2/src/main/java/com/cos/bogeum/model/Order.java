package com.cos.bogeum.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="orders")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name = "ORDER_SEQ_GENERATOR1"
		, sequenceName = "ORDER_SEQ1"
	    , initialValue = 1
	    , allocationSize = 1
		)
public class Order {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="ORDER_SEQ_GENERATOR1")
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="userId")
	private Users user;
	
	@OneToMany(mappedBy = "order")
	private List<OrderItem> orderItems = new ArrayList<>();
	
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private LocalDate createDate;
	
	private int isCancel;
	private int isDelevery;
	
	@PrePersist
	public void createDate() {
		this.createDate = LocalDate.now();
	}
	public void addOrderItem(OrderItem orderItem) {
		orderItems.add(orderItem);
		orderItem.setOrder(this);
	}	
	public static Order createOrder(Users user, List<OrderItem> orderItemList) {
		Order order = new Order();
		order.setUser(user);
		for (OrderItem orderItem : orderItemList) {
          order.addOrderItem(orderItem);
		}
		order.setCreateDate(order.createDate);
		return order;
	}
	public static Order createOrder(Users user) {
		Order order = new Order();
		order.setUser(user);
		order.setCreateDate(order.createDate);
		return order;
	}
}
