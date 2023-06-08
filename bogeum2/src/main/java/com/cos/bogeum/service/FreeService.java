package com.cos.bogeum.service;

import com.cos.bogeum.dto.FreeDto;
import com.cos.bogeum.model.Free;
import com.cos.bogeum.model.Reply;
import com.cos.bogeum.model.Users;
import com.cos.bogeum.repository.FreeRepository;
import com.cos.bogeum.repository.ReplyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class FreeService {

    @Autowired
    private FreeRepository freeRepository;

    @Autowired
    private ReplyRepository replyRepository;

    @Transactional
    public void 글쓰기(Free free, Users user) {
        free.setCount(0);
        free.setUsers(user);
        freeRepository.save(free);
    }

    @Transactional(readOnly = true)
    public Page<Free> 글목록(Pageable pageable) {
        return freeRepository.findAll(pageable);
    }

    @Transactional(readOnly = true)
    public Free 글상세보기(int id) {
        return freeRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
        });
    }

    @Transactional
    public void 글삭제하기(int id) {
        freeRepository.deleteById(id);
    }

    @Transactional
    public void 글수정하기(int id, Free requestBoard) {
        Free free = freeRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
        });
        free.setTitle(requestBoard.getTitle());
        free.setContent(requestBoard.getContent());
    }

    // 조회수 증가 기능
    @Transactional
    public void updateCount(int id) {
        // TODO Auto-generated method stub
        freeRepository.updateCount(id);
    }

    // 게시판 댓글 기능
    @Transactional
    public void 댓글쓰기(int id, Users user, Reply reply) {
        Free free = freeRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
        });
        reply.setUsers(user);
        reply.setFree(free);
        replyRepository.save(reply);
    }

    @Transactional(readOnly = true)
    public List<Reply> 댓글(int id) {
        Free free = freeRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
        });
        List<Reply> reply = replyRepository.findByFree(free);
        return reply;
    }

    // 게시글 검색 기능

    @Transactional
    public Page<Free> searchPosts(String keyword, Pageable pageable) {
        return freeRepository.findByTitleContaining(keyword, pageable);

    }

    private FreeDto convertEntityToDto(Free free) {
        return FreeDto.builder().id(free.getId()).title(free.getTitle()).content(free.getContent())
                .users(free.getUsers()).createDate(free.getCreateDate()).count(free.getCount()).build();
    }

}
