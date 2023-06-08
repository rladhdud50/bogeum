package com.cos.bogeum.repository;



import com.cos.bogeum.model.Free;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;



public interface FreeRepository extends JpaRepository<Free, Integer> {

    @Modifying
    @Query("update Free p set p.count = p.count + 1 where p.id = :id")
    int updateCount(int id);

    Page<Free> findByTitleContaining(String keyword, Pageable pageable);

}
