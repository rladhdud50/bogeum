package com.cos.bogeum.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Formula;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Table(name="chat")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity    //user 클래스가 자동으로 db에 테이블이 생성된다.
@SequenceGenerator(
        name = "CHAT_SEQ_GENERATOR"
        , sequenceName = "CHAT_SEQ"
        , initialValue = 1
        , allocationSize = 1
)
public class Chat {

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CHAT_SEQ_GENERATOR")
    private int id;	//기본키

    private String username;

    private String message;

    private LocalDateTime createDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "roomId")
    private Room room;
//
    private String sender;
//
//    @Column
//    private String message;
//
    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime sendDate;
//
    @Builder
    public Chat(Room room, String sender, String message) {
        this.room = room;
        this.sender = sender;
        this.message = message;
        this.sendDate = LocalDateTime.now();
    }

    /**
     * 채팅생성
     * @param room 채팅방
     * @param sender 보낸이
     * @param message 내용
     * @return Chat Entity
     */
    public static Chat createChat(Room room, String sender, String message) {
        return Chat.builder()
                .room(room)
                .sender(sender)
                .message(message)
                .build();
    }
}
