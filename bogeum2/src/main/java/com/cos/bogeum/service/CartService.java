package com.cos.bogeum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.bogeum.model.Cart;
import com.cos.bogeum.model.CartItem;
import com.cos.bogeum.model.Users;
import com.cos.bogeum.model.items;
import com.cos.bogeum.repository.CartItemRepository;
import com.cos.bogeum.repository.CartRepository;
import com.cos.bogeum.repository.ShopRepository;

@Service
public class CartService {
	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private ShopRepository shopRepository;
	@Autowired
	private CartItemRepository cartItemRepository;
	
	@Transactional
	public void addCart(Users user, items newItem, int amount) {
		Cart cart = cartRepository.findByUserId(user.getId());
		
		//장바구니가 존재하지 않는다면
		if(cart == null) {
			cart = Cart.createCart(user);
			cartRepository.save(cart);
		}
		
		items item = shopRepository.findItemById(newItem.getId());
		CartItem cartItem = cartItemRepository.findByCartIdAndItemId(cart.getId(), item.getId());
		
		// 상품이 장바구니에 존재하지 않는다면 카트상품 생성 후 추가
		if(cartItem == null) {
			cartItem = cartItem.createCartItem(cart, item, amount);
			cartItemRepository.save(cartItem);
		}
		// 상품이 장바구니에 이미 존재한다면 수량만 증가
		else {
			CartItem update = cartItem;
			update.setCart(cartItem.getCart());
			update.setItem(cartItem.getItem());
			update.addCount(amount);
			update.setCount(update.getCount());
			cartItemRepository.save(update);
		}
		// 카트 상품 총 개수 증가
		cart.setCount(cart.getCount()+amount);
	}
	
	@Transactional
	public List<CartItem> allUserCartView(Cart userCart){
		return cartItemRepository.findByCart(userCart);
	}
	
	@Transactional
	public CartItem findCartItemById(int itemId) {
		return cartItemRepository.findById(itemId).get();
	}
	@Transactional
	public void cartItemDelete(int itemId) {
		cartItemRepository.deleteById(itemId);
	}
	@Transactional
	public Cart findUserCart(int id) {
		return cartRepository.findByUserId(id);
	}
	//장바구니 상품 전체 삭제 
	public void allCartItemDelete(int userId) {
		// 전체 cartItem 찾기
        List<CartItem> cartItems = cartItemRepository.findAll();
     // 반복문을 이용하여 해당하는 User 의 CartItem 만 찾아서 삭제
        for(CartItem cartItem : cartItems){

            if(cartItem.getCart().getUser().getId() == userId) {

                cartItem.getCart().setCount(0);

                cartItemRepository.deleteById(cartItem.getId());
            }
        }
	}
	@Transactional
	public void plusCartCount(int userId) {
		Cart cart = cartRepository.findByUserId(userId);
		int count = cart.getCount();
		cart.setCount(count+1);
	}
	@Transactional
	public void minusCartCount(int userId) {
		Cart cart = cartRepository.findByUserId(userId);
		int count = cart.getCount();
		int cnt = count-1;
		if(cnt >= 1) {
			cart.setCount(cnt);
		} else {
			cart.setCount(1);
		}
	}
	@Transactional 
	public void minusCount(int id, int cnt) {
		Cart cart = cartRepository.findByUserId(id);
		cart.setCount(cnt);
	}
}
