package com.cos.bogeum.service;

import com.cos.bogeum.dto.FindsDto;
import com.cos.bogeum.model.Finds;
import com.cos.bogeum.model.Reply;
import com.cos.bogeum.model.Users;
import com.cos.bogeum.repository.FindsRepository;
import com.cos.bogeum.repository.ReplyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
@Service
public class FindsService {
    @Autowired
    private FindsRepository findsRepository;

    @Autowired
    private ReplyRepository replyRepository;

    @Transactional
    public void 글쓰기(Finds finds, Users user) {
        finds.setCount(0);
        finds.setUsers(user);
        findsRepository.save(finds);
    }

    @Transactional(readOnly = true)
    public Page<Finds> 글목록(Pageable pageable) {
        return findsRepository.findAll(pageable);
    }

    @Transactional(readOnly = true)
    public Finds 글상세보기(int id) {
        return findsRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
        });
    }

    @Transactional
    public void 글삭제하기(int id) {
        findsRepository.deleteById(id);
    }

    @Transactional
    public void 글수정하기(int id, Finds requestBoard) {
        Finds finds = findsRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
        });
        finds.setTitle(requestBoard.getTitle());
        finds.setContent(requestBoard.getContent());
    }

    // 조회수 증가 기능
    @Transactional
    public void updateCount(int id) {
        // TODO Auto-generated method stub
        findsRepository.updateCount(id);
    }

    // 게시판 댓글 기능
    @Transactional
    public void 댓글쓰기(int id, Users user, Reply reply) {
        Finds finds = findsRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
        });
        reply.setUsers(user);
        reply.setFinds(finds);
        replyRepository.save(reply);
    }

    @Transactional(readOnly = true)
    public List<Reply> 댓글(int id) {
        Finds finds = findsRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
        });
        List<Reply> reply = replyRepository.findByFinds(finds);
        return reply;
    }

    // 게시글 검색 기능

    @Transactional
    public Page<Finds> searchPosts(String keyword, Pageable pageable) {
        return findsRepository.findByTitleContaining(keyword, pageable);

    }
    @Transactional
    public Page<Finds> searchPosts1(String keyword, Pageable pageable) {
        return findsRepository.findByContentContaining(keyword, pageable);

    }


//    private FindsDto convertEntityToDto(Finds finds) {
//        return FindsDto.builder().id(finds.getId()).title(finds.getTitle()).content(finds.getContent())
//                .users(finds.getUsers()).createDate(finds.getCreateDate()).count(finds.getCount()).build();
//    }
//
//    @Transactional(readOnly = true)
//    public List<BoardModalDto> findByUser(int userId) {
//        List<Finds> boards = findsRepository.findByUserId(userId);
//        List<BoardModalDto> boardModalDtoList = new ArrayList<>();
//        for (int i = 0; i < boards.size(); i++) {
//            BoardModalDto boardModalDto = BoardModalDto.builder()
//                    .id(boards.get(i).getId())
//                    .title(boards.get(i).getTitle())
//                    .createDate(boards.get(i).getCreateDate())
//                    .views(boards.get(i).getCount())
//                    .build();
//        }
//    }
}
