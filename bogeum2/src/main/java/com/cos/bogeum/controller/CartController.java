package com.cos.bogeum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.cos.bogeum.config.auth.PrincipalDetail;
import com.cos.bogeum.model.Cart;
import com.cos.bogeum.model.CartItem;
import com.cos.bogeum.model.Users;
import com.cos.bogeum.model.items;
import com.cos.bogeum.service.CartService;
import com.cos.bogeum.service.ShopService;
import com.cos.bogeum.service.UserService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	@Autowired
	private ShopService shopService;
	
	/*장바구니 페이지*/
	@GetMapping("/user/cart/{id}")
	public String cartPage(@PathVariable("id") int id, Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
		Users user = userService.findUser(id);
		Cart userCart = user.getCart();
		if(userCart!=null) {
			if(principalDetail.getUser().getId() == id) {				
				// 장바구니에 들어있는 아이템 모두 가져오기
				List<CartItem> cartItemList = cartService.allUserCartView(userCart);
				
				// 장바구니에 들어있는 상품들의 총 가격
		        int totalPrice = 0;
		        for(CartItem cartitem : cartItemList) {
		        	totalPrice += cartitem.getCount()*cartitem.getItem().getPrice();
		        }
		        model.addAttribute("totalPrice", totalPrice);
		        model.addAttribute("totalCount", userCart.getCount());
		        model.addAttribute("cartItems", cartItemList);
		        model.addAttribute("user", userService.findUser(id));
		        
		        return "shop/ShoppingmallCart";
			}else {
				return "redirect:/";
			}
		}else {
			return "shop/ShoppingmallCart";
		}
		
	}
	/*장바구니 상품 저장*/
	@PostMapping("/user/cart/{id}/{itemId}")
	public String addCartItem(@PathVariable("id") int id, @PathVariable("itemId") int itemId, int amount) {
		Users user = userService.findUser(id);
		items item = shopService.itemView(itemId);
		cartService.addCart(user, item, amount);
		return "redirect:/user/cart/{id}";
	}
	/*장바구니 상품 삭제*/
	@GetMapping("/user/cart/{userid}/{cartItemId}/delete")
	public String deleteCartItem(@PathVariable("userid") int id, @PathVariable("cartItemId") int itemId, Model model, 
									@AuthenticationPrincipal PrincipalDetail principalDetail) {
			//로그인이 되어있는 유저의 id와 장바구니에 접속하는 id가 같아야 함
			if(principalDetail.getUser().getId() == id) {
				// itemId로 장바구니 상품 찾기
				CartItem cartItem = cartService.findCartItemById(itemId);
				// 장바구니 물건 삭제
				cartService.cartItemDelete(itemId);
				// 해당 유저의 카트 찾기
				Cart userCart = cartService.findUserCart(id);
				// 해당 유저의 장바구니 상품들
				List<CartItem> cartItemList = cartService.allUserCartView(userCart);
				//총 가격
		        int totalPrice = 0;
		        for(CartItem cartitem : cartItemList) {
		        	totalPrice += cartitem.getCount()*cartitem.getItem().getPrice();
		        }
		        userCart.setCount(userCart.getCount()-cartItem.getCount());
		        
		        model.addAttribute("totalPrice", totalPrice);
		        model.addAttribute("totalCount", userCart.getCount());
		        model.addAttribute("cartItems", cartItemList);
		        model.addAttribute("user", userService.findUser(id));
		        return "redirect:/user/cart/"+id;
			}
			else {
				return "redirect:/user/cart/{id}";
			}
			
	}
}
