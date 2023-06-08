package com.cos.bogeum.repository;

import com.cos.bogeum.model.Shelter;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShelterRepository extends JpaRepository<Shelter, Integer> {

    Shelter findByDesertionNo(String desertionNo);
}
