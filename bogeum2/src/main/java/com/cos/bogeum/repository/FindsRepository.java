package com.cos.bogeum.repository;


import com.cos.bogeum.model.Finds;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;



public interface FindsRepository extends JpaRepository<Finds, Integer> {

    @Modifying
    @Query("update Finds p set p.count = p.count + 1 where p.id = :id")
    int updateCount(int id);

    Page<Finds> findByTitleContaining(String keyword, Pageable pageable);
    Page<Finds> findByContentContaining(String keyword, Pageable pageable);

}
