package com.cos.bogeum.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="users2")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity	//user 클래스가 자동으로 db에 테이블이 생성된다.
@SequenceGenerator(
		name = "USER_SEQ_GENERATOR"
		, sequenceName = "USER_SEQ"
		, initialValue = 1
		, allocationSize = 1
		)

public class Users {
	@Id	//Primary Key
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "USER_SEQ_GENERATOR")
	private int id;	//시퀀스
	
	@Column(nullable = false, length = 30, unique = true)
	private String username;	//아이디
	
	@Column(nullable = false, length = 100)	//해쉬로 변경하여 암호화 length 크기
	private String password;
	
	@Column(length = 30)
	private String username2;	//이름		
	
	@Column(nullable = true, length = 30)
	private String birth;	//생년월일
	
	@Column(nullable = true, length = 100)
	private String address;	//주소	
	
	@Column(nullable = true, length = 50)
	private String tel;	//전화번호			
	
	@Column(nullable = true, length = 30)
	private String email;	//이메일		

	private String oauth; //Kakao 회원판별
	
	@OneToOne(mappedBy = "user", cascade = CascadeType.REMOVE)	//mappedBy는 조인된 테이블의 칼럼명을 따라가야됨!!!!!
	private Cart cart;	// 구매자의 장바구니
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
	private List<Order> userOrder = new ArrayList<>();	// 구매자의 주문
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
	private List<OrderItem> userOrderItem = new ArrayList<>();	// 구매자의 주문상품들
	
	
//	@ColumnDefault("'user'")
	@Enumerated(EnumType.STRING)	//Enum을 쓰는게 좋다
	private RoleType roles;
	//예) admin, user, manager (권한) 셋 중 하나만
	
	@CreationTimestamp	//시간이 자동으로 입력
	private Timestamp createDate;
}
