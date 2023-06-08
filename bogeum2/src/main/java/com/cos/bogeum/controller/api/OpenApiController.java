package com.cos.bogeum.controller.api;

import com.fasterxml.jackson.core.JsonParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

@Controller
@RequestMapping("/shelter")
public class OpenApiController {

    @GetMapping("/shelterTest")
    public String shelter() throws Exception {


        String result = callShelter();

        System.out.println(result);

        return "shelter/shlterTest";
    }

    private String callShelter() throws Exception{

        //인증키
        final String MyKey = "PDUYcZF9dcMRdEkUd1Pw9rGid%2BJo0ZfjB3LCXuea%2BFybDCjXK%2FsY5e8uyVqZGqCdwUijgAfBM31dtYDTZmWpOQ%3D%3D";

        //<자바에서 웹으로 요청하는 방법>
        //1. URL 세팅(요청주소 + 파라미터들 세팅)
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552584/UlfptcaAlarmInqireSvc/getUlfptcaAlarmInfo"); /*URL*/

        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + MyKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*xml 또는 json*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        //URLEncoder.encode : 한글은 URLEncoding 작업을 해줘야 URL에서 정상적으로 전달이 됨

        //2. URL 객체 생성(urlBuilder를 이용해서)
        URL url = new URL(urlBuilder.toString());

        //3. URL을 이용해서 connection 가져오기
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        //4. request의 요청방식(method)랑 header설정
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        //conn.getResponseCode() : connection을 이용해서 응답코드(response code) 확인가능
        System.out.println("Response code : " + conn.getResponseCode());

        //5. 커넥션에서 inputStream가져옴 -> BufferedReader로 변환
        //응답코드에 따른 처리(conn.getInputStream())
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        //6. 5에서 가져온 스트림으로 데이터 한 줄씩 읽기(누적시키기)
        //rd를 한줄 씩 읽어서 line에 누적해서 넣기

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        //7. 사용한 자원(스트림, 커넥션) 정리 : rd 자원 반납, 웹사이트랑 연결도 끊기
        rd.close();
        conn.disconnect();

        //8. 6에서 누적한 결과 확인
        System.out.println(sb.toString());
        return sb.toString();

        }

}
