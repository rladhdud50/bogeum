package com.cos.bogeum.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.cos.bogeum.config.auth.PrincipalDetail;
import com.cos.bogeum.model.Cart;
import com.cos.bogeum.model.CartItem;
import com.cos.bogeum.model.Order;
import com.cos.bogeum.model.OrderItem;
import com.cos.bogeum.model.Users;
import com.cos.bogeum.model.items;
import com.cos.bogeum.service.CartService;
import com.cos.bogeum.service.OrderService;
import com.cos.bogeum.service.ShopService;
import com.cos.bogeum.service.UserService;

@Controller
public class OrderController {
	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ShopService shopService;
	
	/* 장바구니->결제 페이지로 이동 */
	@GetMapping("/order/cart/{id}")
	public String orderCart(@PathVariable int id, Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
		Users user = userService.findUser(id);
		//유저 카트 찾기
		Cart userCart = user.getCart();
		if(userCart != null) {
			//로그인 되어있는 유저의 id와 주문하는 id가 같아야 함 
			if(principalDetail.getUser().getId() == id) {
				//유저 카트 안에 있는 상품들
				List<CartItem> userCartItems = cartService.allUserCartView(userCart);
				
				int totalPrice = 0;
				for(CartItem cartItem: userCartItems) {
					totalPrice += cartItem.getCount()*cartItem.getItem().getPrice();
				}
				model.addAttribute("totalPrice", totalPrice);
				model.addAttribute("totalCount", userCart.getCount());
				model.addAttribute("cartItem", userCartItems);
				return "shop/ShoppingmallPayment";
			}
		}
		return "/";
	}
	
	/*장바구니 상품 주문*/
	@Transactional
	@PostMapping("/cart/checkout/{id}")
	public String cartCheckout(@PathVariable("id") int id, Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
		//로그인 되어있는 유저의 id와 주문하는 id가 같아야 함 
		if(principalDetail.getUser().getId() == id) {
			Users user = userService.findUser(id);
			Cart userCart = user.getCart();
			List<CartItem> userCartItems = cartService.allUserCartView(userCart);
			//최종 결제 금액
			int totalPrice = 0;
			for(CartItem cartItem: userCartItems) {
				totalPrice += cartItem.getCount()*cartItem.getItem().getPrice();
			}
			List<OrderItem> orderItemList = new ArrayList<>();
			for (CartItem cartItem : userCartItems) {
				Users seller = cartItem.getItem().getSeller();
				//order, orderItem 에 담기
				OrderItem orderItem = orderService.addCartOrder(cartItem.getItem().getId(), user.getId(), cartItem);
                orderItemList.add(orderItem);
			}
			orderService.addOrder(user, orderItemList);

            // 장바구니 상품 모두 삭제
            cartService.allCartItemDelete(id);
            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("cartItems", userCartItems);
            model.addAttribute("user", userService.findUser(id));
            return "shop/finish";
		}else {
			return "redirect:/";
		}
	}
	/* 바로주문->주문페이지로 이동 */
	@GetMapping("/order/now/{id}/{itemId}/{count}")
	public String orderNow(@PathVariable("id") int id, @PathVariable("itemId") int itemId, @PathVariable("count") int count, 
							Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
		items item =shopService.상품아이디조회(itemId);
		model.addAttribute("totalPrice", (item.getPrice() * count));
		model.addAttribute("count", count);
		model.addAttribute("item", item);
		return "shop/ShoppingmallPayment";
	}
	/* 바로 결제 */
	@Transactional
	@PostMapping("/now/checkout/{userId}/{itemId}/{count}")
	public String nowCheckout(@PathVariable("userId") int id,@PathVariable("itemId") int itemId, @PathVariable("count") int count,
								Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
		if(principalDetail.getUser().getId() == id) {
			Users user = userService.findUser(id);
			items item = shopService.itemView(itemId);
			
			//최종결제금액
			int totalPrice = item.getPrice()*count;
			orderService.addOneItemOrder(user.getId(), item, count);
			return "shop/finish";
		}else {
			return "redirect:/";
		}
	}
	/*결제 완료 페이지*/
	@GetMapping("/order/finish/{id}")
	public String orderFinish(@PathVariable("id") int id) {
		return "shop/finish";
	}
	/*주문 취소*/
	@Transactional
	@GetMapping("/order/cancel/{id}/{orderId}")
	public String orderCancle(@PathVariable("id") int id, @PathVariable("orderId") int OrderId, Model model) {
		orderService.orderCancel(OrderId);
		return "redirect:/";
	}
}
