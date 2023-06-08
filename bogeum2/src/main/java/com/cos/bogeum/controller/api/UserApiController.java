package com.cos.bogeum.controller.api;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.bogeum.dto.ResponseDto;
import com.cos.bogeum.dto.SendTmpPwdDto;
import com.cos.bogeum.model.Users;
import com.cos.bogeum.repository.UserRepository;
import com.cos.bogeum.service.UserService;

@RestController
public class UserApiController {

	@Value("${cos.key}")
	private String cosKey;

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserService userService;
	@Autowired
	private AuthenticationManager authenticationManager;

	// 회원가입
	@PostMapping("/auth/joinproc") // 회원가입 로직이 실행되는 부분
	public ResponseDto<Integer> save(@RequestBody Users user) {		

		userService.회원가입(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);		
	}

	// 회원정보수정
	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody Users user) {

		userService.회원수정(user);

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));

		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);

	}

	// 회원정보수정2(카카오회원)
	@PutMapping("/user2")
	public ResponseDto<Integer> update2(@RequestBody Users user) {

		userService.회원수정2(user);

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), cosKey));

		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);

	}

	// 회원 탈퇴
	@DeleteMapping("/api/user/out/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id) {
		userService.회원탈퇴(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	// 아이디 중복 체크
	@PostMapping("/auth/user/check")
	public ResponseDto<Integer> findByUsername(@RequestBody String username) {
		int i = 0;
		if (userService.중복체크(username) != null) {
			i = userService.중복체크(username).getId();
		}
		return new ResponseDto<Integer>(HttpStatus.OK.value(), i);
	}

	// 비밀번호 재발급
	@PostMapping("/auth/find")
	public ResponseDto<Integer> find(@RequestBody SendTmpPwdDto dto) {
		int i = 0;
		
		if(userService.비밀번호재발급(dto.getUsername(), dto.getEmail()) !=null) {			
			userService.sendTmpPwd(dto);			
			i=userService.비밀번호재발급(dto.getUsername(), dto.getEmail()).getId();
		}
		System.out.println(i);		
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), i);
	}

	// 인증번호 발송
	@PostMapping("/auth/joinnumber")
	public ResponseDto<String> joinnumber(@RequestBody String email) {

		String joinNumber = userService.sendJoinNumber(email);

		return new ResponseDto<String>(HttpStatus.OK.value(), joinNumber);
	}

}
