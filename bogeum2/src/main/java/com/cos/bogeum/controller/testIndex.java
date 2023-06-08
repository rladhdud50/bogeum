package com.cos.bogeum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cos.bogeum.repository.ShopRepository;
import com.cos.bogeum.service.FindsService;
import com.cos.bogeum.service.FreeService;
import com.cos.bogeum.service.InquiryService;
import com.cos.bogeum.service.NoticeService;
import com.cos.bogeum.service.ShopService;

@Controller
public class testIndex {

	@Autowired
	private ShopService shopService;
	@Autowired
	private ShopRepository shopRepository;
	@Autowired
	private FindsService findsService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private FreeService freeService;

	@GetMapping({ "", "/" })
	public String index(Model model,
						@PageableDefault(size = 4, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {

		model.addAttribute("shop", shopService.상품목록(pageable));
		model.addAttribute("notice", noticeService.글목록(pageable));
		model.addAttribute("finds", findsService.글목록(pageable));
		model.addAttribute("free",freeService.글목록(pageable));
		

		return "index2";
	}
}
