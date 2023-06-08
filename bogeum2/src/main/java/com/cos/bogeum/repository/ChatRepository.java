package com.cos.bogeum.repository;

import com.cos.bogeum.model.Chat;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChatRepository extends JpaRepository<Chat,Integer> {

    
}
