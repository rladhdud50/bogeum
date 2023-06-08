package com.cos.bogeum.repository;


import com.cos.bogeum.model.Notice;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;



public interface NoticeRepository extends JpaRepository<Notice, Integer> {

    @Modifying
    @Query("update Finds p set p.count = p.count + 1 where p.id = :id")
    int updateCount(int id);

    Page<Notice> findByTitleContaining(String keyword, Pageable pageable);
    Page<Notice> findByContentContaining(String keyword, Pageable pageable);

}
