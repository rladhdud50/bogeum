package com.cos.bogeum.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Table(name = "reply")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@SequenceGenerator(
        name = "USER_SEQ_GENERATOR3",
        sequenceName = "USER_SEQ3",
        initialValue = 1,
        allocationSize = 1
)
@Entity
public class Reply {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "USER_SEQ_GENERATOR3")
    private int id;

    @Column(nullable = false, length = 200)
    private String content;

    @ManyToOne
    @JoinColumn(name = "FindsId")
    private Finds finds;

    @ManyToOne
    @JoinColumn(name = "inquirysId")
    private Inquirys inquirys;
    @ManyToOne
    @JoinColumn(name = "freeId")
    private Free free;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userid")
    private Users users;

    @CreationTimestamp
    private Timestamp createDate;
}
