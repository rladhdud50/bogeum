package com.cos.bogeum.controller.api;

import com.cos.bogeum.config.auth.PrincipalDetail;
import com.cos.bogeum.dto.ResponseDto;
import com.cos.bogeum.model.Finds;
import com.cos.bogeum.model.Reply;
import com.cos.bogeum.service.FindsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
@RestController
public class FindsApiController {


        @Autowired
        private FindsService findsService;

        @PostMapping("/api/finds")
        public ResponseDto<Integer> save(@RequestBody Finds finds, @AuthenticationPrincipal PrincipalDetail principal) {
            findsService.글쓰기(finds,principal.getUser());
            return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
        }
        @DeleteMapping("/api/finds/{id}")
        public ResponseDto<Integer> deleteById(@PathVariable int id){
            findsService.글삭제하기(id);
            return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
        }
        @PutMapping("/api/finds/{id}")
        public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Finds finds){
            findsService.글수정하기(id,finds);
            return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
        }

        @PostMapping("/api/finds/reply/{id}")
        public ResponseDto<Integer> reply_save(@PathVariable int id, @AuthenticationPrincipal PrincipalDetail principal, @RequestBody Reply reply) {
            findsService.댓글쓰기(id,principal.getUser(), reply);
            return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
        }
    }




