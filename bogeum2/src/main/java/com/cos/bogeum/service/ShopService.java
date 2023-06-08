package com.cos.bogeum.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.cos.bogeum.model.Review;
import com.cos.bogeum.model.Users;
import com.cos.bogeum.model.items;
import com.cos.bogeum.repository.ReviewReoisitory;
import com.cos.bogeum.repository.ShopRepository;

@Service
public class ShopService {
	@Autowired
	private ShopRepository shopRepository;
	@Autowired
	private ReviewReoisitory reviewReoisitory;
	
	@Transactional
	public void 상품등록(items item) {
		shopRepository.save(item);
	}
	
	@Transactional
	public Page<items> 상품목록(Pageable pageable){
		return shopRepository.findAll(pageable);
	}
	@Transactional
	public items 아이템갯수(){
		return shopRepository.findByItemCount();
	}
	
	@Transactional
	public void 상품수정(items requestItem, int id) {
		System.out.println("상품수정 service"+requestItem.getName()+","+requestItem.getCategory()+","+requestItem.getId()+","+id);
		items items = shopRepository.findById(id).orElseThrow(()->{
			System.out.println("실행");
			return new IllegalArgumentException("상품 수정 실패 : 아이디 찾을수없음");
		});
		items.setCategory(requestItem.getCategory());
		items.setName(requestItem.getName());
		items.setPrice(requestItem.getPrice());
		items.setCount(requestItem.getCount());
		items.setFilename(requestItem.getFilename());
		items.setFileOriName(requestItem.getFileOriName());
		items.setFileurl(requestItem.getFileurl());
		items.setContent(requestItem.getContent());
	}
	
	@Transactional
	public items 상품아이디조회(int id) {
		return shopRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("상품 아이디 조회 실패 : 아이디 찾을수없음");
				});
	}
	@Transactional
	public void 상품삭제(int id) {
		shopRepository.deleteById(id);		
	}
	
	
	public items itemView(int id) {
		return shopRepository.findById(id).get();
	}
	
}
