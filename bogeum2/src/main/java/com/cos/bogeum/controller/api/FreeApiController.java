package com.cos.bogeum.controller.api;

import com.cos.bogeum.config.auth.PrincipalDetail;
import com.cos.bogeum.dto.ResponseDto;
import com.cos.bogeum.model.Free;
import com.cos.bogeum.model.Reply;
import com.cos.bogeum.service.FreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
@RestController
public class FreeApiController {


    @Autowired
    private FreeService freeService;

    @PostMapping("/api/free")
    public ResponseDto<Integer> save(@RequestBody Free free, @AuthenticationPrincipal PrincipalDetail principal) {
        freeService.글쓰기(free,principal.getUser());
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }
    @DeleteMapping("/api/free/{id}")
    public ResponseDto<Integer> deleteById(@PathVariable int id){
        freeService.글삭제하기(id);
        return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
    }
    @PutMapping("/api/free/{id}")
    public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Free free){
        freeService.글수정하기(id,free);
        return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
    }

    @PostMapping("/api/free/reply/{id}")
    public ResponseDto<Integer> reply_save(@PathVariable int id, @AuthenticationPrincipal PrincipalDetail principal, @RequestBody Reply reply) {
        freeService.댓글쓰기(id,principal.getUser(), reply);
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }
}




