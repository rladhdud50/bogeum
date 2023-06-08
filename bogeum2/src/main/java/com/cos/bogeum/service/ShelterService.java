package com.cos.bogeum.service;

import com.cos.bogeum.model.Shelter;
import com.cos.bogeum.repository.ShelterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ShelterService {

    @Autowired
    private ShelterRepository shelterRepository;
    @Transactional(readOnly = true)
    public Shelter detail(String desertionNo) { // 글 상세보기
        return shelterRepository.findByDesertionNo(desertionNo);

    }
}