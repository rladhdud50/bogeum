package com.cos.bogeum.controller;

import com.cos.bogeum.service.ShelterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
@Controller
public class ShelterController {

	@Autowired
	private ShelterService shelterService;

	@GetMapping("/auth/shelter")
	public String shelter() {

		return "shelter/shelterPage";
	}


	/**
	 * 상세페이지
	 */
	@GetMapping("/auth/shelterDetail/{desertionNo}")
	public String shelterDetail(@PathVariable String desertionNo, Model model)  {
		model.addAttribute("info", shelterService.detail(desertionNo));

		return "shelter/shelterDetail";

	}


	/**
	 * API테스트
	 */
	@GetMapping("/shelterapitest")
	public String shelterApiTest() {
		return "shelter/shelterApiTest";
	}
	@GetMapping("/sidoapitest")
	public String sidoApiTest() {
		return "shelter/sidoApiTest";
	}
	@GetMapping("/sigunguapitest")
	public String sigunguApiTest() {
		return "shelter/sigunguApiTest";
	}


}
