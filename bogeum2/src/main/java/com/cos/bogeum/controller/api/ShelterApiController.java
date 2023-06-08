package com.cos.bogeum.controller.api;

import com.cos.bogeum.dto.ResponseDto;
import com.cos.bogeum.model.Shelter;
import com.cos.bogeum.repository.ShelterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ShelterApiController {
    @Autowired
    private ShelterRepository shelterRepository;

    @PostMapping("/auth/shelter")
    public ResponseDto<Integer> save(@RequestBody Shelter shelter){

        System.out.println("보호소 테스트");
        shelterRepository.save(shelter);
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }
}
