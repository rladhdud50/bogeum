package com.cos.bogeum.service;

import com.cos.bogeum.model.Chat;
import com.cos.bogeum.model.Room;
import com.cos.bogeum.repository.ChatRoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ChatRoomService {

    /**
     * 채팅방 저장
     */
//    @Autowired
//    private ChatRoomRepository chatRoomRepository;
//
//    public Room createRoom(String name) {
//        Room room = new Room();
//        room.setName(name);
//        room.setRoomId(UUID.randomUUID().toString());
//
//        return chatRoomRepository.save(room);
//    }
//
//    public List<Room> findAllRooms() {
//        return chatRoomRepository.findAll();
//    }
}
