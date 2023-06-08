package com.cos.bogeum.controller;

import com.cos.bogeum.config.auth.PrincipalDetail;
import com.cos.bogeum.model.OrderItem;
import com.cos.bogeum.model.RoleType;
import com.cos.bogeum.model.Users;
import com.cos.bogeum.repository.OrderItemRepository;
import com.cos.bogeum.repository.UserRepository;
import com.cos.bogeum.service.FindsService;
import com.cos.bogeum.service.ShopService;
import com.cos.bogeum.specification.AdminSpecification;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private OrderItemRepository orderItemRepository;
	@Autowired
	private ShopService shopService;
	@Autowired
	private FindsService findsService;
	
	
	@GetMapping("/admin") 
	public String adminPage(Model model,
							@PageableDefault(size=10, sort = "id", direction = Sort.Direction.ASC) Pageable pageable,
							@RequestParam(value = "category", defaultValue = "user") String category,
							@RequestParam(value = "searchType", defaultValue = "") String searchType,
							@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
							@AuthenticationPrincipal PrincipalDetail principal) {

		/* 관리자 권한이 아닌 경우 해당 페이지 요청하지 못하도록 설정*/
//		if(!principal.getUser().getRoles().equals(RoleType.ADMIN)) {
//			return null;
//		}
		/* Specification을 사용하여 쿼리조건 추가 */
		Specification<Users> spec = (root, query, criteriaBuilder) -> null;
		spec = spec.and(AdminSpecification.userRole(RoleType.USER));

		if (category.equals("user")) {
			if (!searchType.isEmpty()) {
				if (searchType.equals("username")) {
					spec = spec.and(AdminSpecification.searchTypeUsername(searchKeyword));
				} else {
					spec = spec.and(AdminSpecification.searchTypeName(searchKeyword));
				}
			}
			model.addAttribute("users", userRepository.findAll(spec, pageable));
		}
		List<OrderItem> OrderItemAll = orderItemRepository.findAll();
		model.addAttribute("category", category);
		model.addAttribute("ItemList", shopService.상품목록(pageable));
		model.addAttribute("orderItem", OrderItemAll);
//		model.addAttribute("users", userRepository.findAll(pageable));
		return "admin/adminPage";
	}

//	@GetMapping("/api/board/{userId}")
//	public ResponseEntity<?> findByUser(@PathVariable("userId") int id) {
//		List<BoardModalDto> boardModalDtoList = findsService.findByUser(id);
//
//		return new ResponseEntity<>(boardModalDtoList, HttpStatus.OK);
//	}
	
	/*상품등록 폼 이동*/
	@GetMapping("/save_item")
	public String saveItem() {
		return "admin/ProductSave";
	}
	
	/*상품수정 폼 이동*/
	@GetMapping("/update_item/{id}")
	public String updateItem(@PathVariable int id, Model model) {
		model.addAttribute("item", shopService.상품아이디조회(id));
		return "admin/ProductUpdate";
	}
	
}
