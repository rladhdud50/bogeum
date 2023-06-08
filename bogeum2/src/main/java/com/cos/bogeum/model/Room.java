package com.cos.bogeum.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Table(name="room")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
        name = "ROOM_SEQ_GENERATOR"
        , sequenceName = "ROOM_SEQ"
        , initialValue = 1
        , allocationSize = 1
)
public class Room {

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CHAT_SEQ_GENERATOR")
    private int id;

    @ManyToOne
    @JoinColumn(name = "username")
    private Users username;
//    private String name;

//    private String roomId;

    @JsonIgnoreProperties({"room"})
    @OneToMany (mappedBy="room",cascade = CascadeType.REMOVE)
    private List<Chat> chat;

//    @Builder
//    public Room(String name) {
//        this.name = name;
//    }
//
//    /**
//     * 채팅방 생성
//     * @param name 방 이름
//     * @return Room Entity
//     */
//    public static Room createRoom(String name) {
//        return Room.builder()
//                .name(name)
//                .build();
//    }

}
