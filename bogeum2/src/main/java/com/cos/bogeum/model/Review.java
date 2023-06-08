package com.cos.bogeum.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name = "REVIEW_SEQ_GENERATOR"
	    , sequenceName = "review_SEQ3"
	    , initialValue = 1
	    , allocationSize = 1
	)
public class Review {
	@Id//기본키
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="REVIEW_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=200)
	private String content;
	
	@CreationTimestamp 
	private Timestamp createDate;
	
	@ManyToOne //여러개의 리뷰은 하나의 상품에 존재
	@JoinColumn(name="itemsId")
	private items items;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private Users users;
	
}
