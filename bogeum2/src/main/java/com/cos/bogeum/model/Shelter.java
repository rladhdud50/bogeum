package com.cos.bogeum.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Table(name ="shelter")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
        name = "SHELTER_SEQ_GENERATOR"
        , sequenceName = "SHELTER_SEQ"
        , initialValue = 1
        , allocationSize = 1
)
public class Shelter {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SHELTER_SEQ_GENERATOR")
    private int id;

    @Column(nullable = false, length = 50, unique = true)
    private String desertionNo;//유기번호

    @Column(nullable = false, length = 30)
    private String kindCd;//품종명

    @Column(nullable = true, length = 30)
    private String colorCd;//털색

    @Column(nullable = true, length = 30)
    private String age;//나이

    @Column(nullable = true, length = 30)
    private String weight;//무게

    @Column(nullable = true, length = 50)
    private String noticeSdt;//공고시작

    @Column(nullable = true, length = 50)
    private String noticeEdt;//공고만료

    @Lob
    private String popfile;//이미지

    @Column(nullable = true, length = 30)
    private String sexCd;//성별

    @Column(nullable = true, length = 30)
    private String neuterYn;//중성화 여부

    @Column(nullable = true, length = 100)
    private String specialMark;//특이사항

    @Column(nullable = true, length = 100)
    private String careNm;//보호소이름

    @Column(nullable = true, length = 100)
    private String careTel;//보호소 연락처

    @Column(nullable = true, length = 200)
    private String careAddr;//보호소 주소

    @Column(nullable = true, length = 200)
    private String processState;//상태



}


