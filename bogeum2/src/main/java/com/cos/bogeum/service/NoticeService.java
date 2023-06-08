package com.cos.bogeum.service;


import com.cos.bogeum.dto.NoticeDto;
import com.cos.bogeum.model.Notice;
import com.cos.bogeum.model.Users;
import com.cos.bogeum.repository.NoticeRepository;
import com.cos.bogeum.repository.ReplyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class NoticeService {
    @Autowired
    private NoticeRepository noticeRepository;

    @Autowired
    private ReplyRepository replyRepository;

    @Transactional
    public void 글쓰기(Notice notice, Users user) {
        notice.setCount(0);
        notice.setUsers(user);
        noticeRepository.save(notice);
    }

    @Transactional(readOnly = true)
    public Page<Notice> 글목록(Pageable pageable) {
        return noticeRepository.findAll(pageable);
    }

    @Transactional(readOnly = true)
    public Notice 글상세보기(int id) {
        return noticeRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
        });
    }

    @Transactional
    public void 글삭제하기(int id) {
        noticeRepository.deleteById(id);
    }

    @Transactional
    public void 글수정하기(int id, Notice requestBoard) {
        Notice notice = noticeRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
        });
        notice.setTitle(requestBoard.getTitle());
        notice.setContent(requestBoard.getContent());
    }

    // 조회수 증가 기능
    @Transactional
    public void updateCount(int id) {
        // TODO Auto-generated method stub
        noticeRepository.updateCount(id);
    }

//    // 게시판 댓글 기능
//    @Transactional
//    public void 댓글쓰기(int id, Users user, Reply reply) {
//        Notice notice = noticeRepository.findById(id).orElseThrow(() -> {
//            return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
//        });
//        reply.setUsers(user);
//        reply.setNotice(notice);
//        replyRepository.save(reply);
//    }
//
//    @Transactional(readOnly = true)
//    public List<Reply> 댓글(int id) {
//        Notice notice = noticeRepository.findById(id).orElseThrow(() -> {
//            return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
//        });
//        List<Reply> reply = replyRepository.findByNotice(notice);
//        return reply;
//    }

    // 게시글 검색 기능

    @Transactional
    public Page<Notice> searchPosts(String keyword, Pageable pageable) {
        return noticeRepository.findByTitleContaining(keyword, pageable);

    }
    @Transactional
    public Page<Notice> searchPosts1(String keyword, Pageable pageable) {
        return noticeRepository.findByContentContaining(keyword, pageable);

    }

    private NoticeDto convertEntityToDto(Notice notice) {
        return NoticeDto.builder().id(notice.getId()).title(notice.getTitle()).content(notice.getContent()).users(notice.getUsers()).createDate(notice.getCreateDate()).count(notice.getCount()).build();
    }

}
