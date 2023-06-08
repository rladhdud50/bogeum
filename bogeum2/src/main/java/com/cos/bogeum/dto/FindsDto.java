package com.cos.bogeum.dto;

import com.cos.bogeum.model.Finds;
import com.cos.bogeum.model.Users;
import lombok.*;

import java.sql.Timestamp;
@Getter
@Setter
@ToString
@NoArgsConstructor
public class FindsDto {
    private int id;
    private int count;
    private Users users;
    private String title;
    private String content;
    private Timestamp createDate;
    public Finds toEntity(){
        Finds build = Finds.builder()
                .id(id)
                .users(users)
                .title(title)
                .content(content)
                .count(count)
                .build();
        return build;
    }
    @Builder
    public FindsDto(int id, String title, String content, Users users, Timestamp createDate, int count){
        this.id = id;
        this.users = users;
        this.title = title;
        this.content = content;
        this.count = count;
        this.createDate = createDate;
    }
}
