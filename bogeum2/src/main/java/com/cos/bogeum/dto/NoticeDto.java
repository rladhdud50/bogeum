package com.cos.bogeum.dto;


import com.cos.bogeum.model.Notice;
import com.cos.bogeum.model.Users;
import lombok.*;

import java.sql.Timestamp;
@Getter
@Setter
@ToString
@NoArgsConstructor
public class NoticeDto {
    private int id;
    private int count;
    private Users users;
    private String title;
    private String content;
    private Timestamp createDate;
    public Notice toEntity(){
       Notice build = Notice.builder()
                .id(id)
                .users(users)
                .title(title)
                .content(content)
                .count(count)
                .build();
        return build;
    }
    @Builder
    public NoticeDto(int id, String title, String content, Users users, Timestamp createDate, int count){
        this.id = id;
        this.users = users;
        this.title = title;
        this.content = content;
        this.count = count;
        this.createDate = createDate;
    }
}
