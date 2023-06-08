package com.cos.bogeum.controller.api;


import com.cos.bogeum.config.auth.PrincipalDetail;
import com.cos.bogeum.dto.ResponseDto;
import com.cos.bogeum.model.Inquirys;
import com.cos.bogeum.model.Reply;
import com.cos.bogeum.service.InquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
public class InquiryApiController {
   
   @Autowired
   private InquiryService inquiryService;
   
   @PostMapping("/api/inquiry")
   public ResponseDto<Integer> save(@RequestBody Inquirys inquiry, @AuthenticationPrincipal PrincipalDetail principal) {
      inquiryService.글쓰기(inquiry,principal.getUser());
      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
   }
   @DeleteMapping("/api/inquiry/{id}")
   public ResponseDto<Integer> deleteById(@PathVariable int id){
      inquiryService.글삭제하기(id);
      return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
   }
   @PutMapping("/api/inquiry/{id}")
   public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Inquirys inquiry){
      inquiryService.글수정하기(id,inquiry);
      return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
   }
   
   @PostMapping("/api/inquiry/reply/{id}")
   public ResponseDto<Integer> reply_save(@PathVariable int id,@AuthenticationPrincipal PrincipalDetail principal, @RequestBody Reply reply) {
      inquiryService.댓글쓰기(id,principal.getUser(), reply);
      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
   }
}