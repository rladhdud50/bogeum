package com.cos.bogeum.service;


import com.cos.bogeum.dto.InquiryDto;
import com.cos.bogeum.model.Inquirys;
import com.cos.bogeum.model.Reply;
import com.cos.bogeum.model.Users;
import com.cos.bogeum.repository.InquiryRepository;
import com.cos.bogeum.repository.ReplyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class InquiryService {

	@Autowired
	private InquiryRepository inquiryRepository;

	@Autowired
	private ReplyRepository replyRepository;

	@Transactional
	public void 글쓰기(Inquirys inquiry, Users user) {
		inquiry.setCount(0);
		inquiry.setUsers(user);
		inquiryRepository.save(inquiry);
	}

	@Transactional(readOnly = true)
	public Page<Inquirys> 글목록(Pageable pageable) {
		return inquiryRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public Inquirys 글상세보기(int id) {
		return inquiryRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
		});
	}

	@Transactional
	public void 글삭제하기(int id) {
		inquiryRepository.deleteById(id);
	}

	@Transactional
	public void 글수정하기(int id, Inquirys requestBoard) {
		Inquirys inquiry = inquiryRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
		});
		inquiry.setTitle(requestBoard.getTitle());
		inquiry.setContent(requestBoard.getContent());
	}

	// 조회수 증가 기능
	@Transactional
	public void updateCount(int id) {
		// TODO Auto-generated method stub
		inquiryRepository.updateCount(id);
	}

	// 게시판 댓글 기능
	@Transactional
	public void 댓글쓰기(int id, Users user, Reply reply) {
		Inquirys inquiry = inquiryRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
		});
		reply.setUsers(user);
		reply.setInquirys(inquiry);
		replyRepository.save(reply);
	}

	@Transactional(readOnly = true)
	public List<Reply> 댓글(int id) {
		Inquirys inquirys = inquiryRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
		});
		List<Reply> reply = replyRepository.findByinquirys(inquirys);
		return reply;
	}

	// 게시글 검색 기능

	@Transactional
	public Page<Inquirys> searchPosts(String keyword, Pageable pageable) {
		return inquiryRepository.findByTitleContaining(keyword, pageable);

	}

	private InquiryDto convertEntityToDto(Inquirys inquiry) {
		return InquiryDto.builder().id(inquiry.getId()).title(inquiry.getTitle()).content(inquiry.getContent())
				.users(inquiry.getUsers()).createDate(inquiry.getCreateDate()).count(inquiry.getCount()).build();
	}
}