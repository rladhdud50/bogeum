package com.cos.bogeum.repository;

import com.cos.bogeum.model.Cart;
import com.cos.bogeum.model.CartItem;
import com.cos.bogeum.model.Chat;
import com.cos.bogeum.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoomRepository extends JpaRepository<Room,Integer> {
    List<Room> findAll();
    List<Room> findById(int id);
}
