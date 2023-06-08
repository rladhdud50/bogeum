package com.cos.bogeum.controller.api;

import com.cos.bogeum.config.auth.PrincipalDetail;
import com.cos.bogeum.dto.ResponseDto;

import com.cos.bogeum.model.Notice;
import com.cos.bogeum.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
@RestController
public class NoticeApiController {


    @Autowired
    private NoticeService noticeService;

    @PostMapping("/api/notice")
    public ResponseDto<Integer> save(@RequestBody Notice notice, @AuthenticationPrincipal PrincipalDetail principal) {
        noticeService.글쓰기(notice,principal.getUser());
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }
    @DeleteMapping("/api/notice/{id}")
    public ResponseDto<Integer> deleteById(@PathVariable int id){
        noticeService.글삭제하기(id);
        return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
    }
    @PutMapping("/api/notice/{id}")
    public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Notice notice){
        noticeService.글수정하기(id,notice);
        return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
    }

//    @PostMapping("/api/notice/reply/{id}")
//    public ResponseDto<Integer> reply_save(@PathVariable int id, @AuthenticationPrincipal PrincipalDetail principal, @RequestBody Reply reply) {
//        noticeService.댓글쓰기(id,principal.getUser(), reply);
//        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
//    }
}




