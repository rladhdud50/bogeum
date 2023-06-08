package com.cos.bogeum.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="cart")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name = "CART_SEQ_GENERATOR1"
		, sequenceName = "CART_SEQ1"
	    , initialValue = 1
	    , allocationSize = 1
		)
public class Cart {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CART_SEQ_GENERATOR1")
	private int id;	
	
	@OneToOne
	@JoinColumn(name="userId")
	private Users user;	//구매자
	
	private int count; //카트에 담긴 총 상품 갯수
	
	@OneToMany(mappedBy = "cart")
	private List<CartItem> cartItem = new ArrayList<>();
	
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private LocalDate createDate;
	
	@PrePersist	//DB에 해당 테이블이 insert 될 때 실행해라
	public void createDate() {
		this.createDate = LocalDate.now();
	}
	
	public static Cart createCart(Users user) {
		Cart cart = new Cart();
		cart.setCount(0);
		cart.setUser(user);
		return cart;
	}
}
