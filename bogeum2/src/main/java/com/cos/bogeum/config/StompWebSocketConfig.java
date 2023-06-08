package com.cos.bogeum.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

/**
 * @ServerEndpoint 어노테이션이 달린 클래스들은 WebSocket이 생성될 때마다
 * 인스턴스가 생성되고 JWA에 의해 관리되기 때문에 스프링의  @Autowired가 설정된 멤버들이
 * 정상적으로 초기화되지않음. 이때 이를 연결해 주고 초기화해 주는 클래스가 필요
 */
@Configuration
@EnableWebSocketMessageBroker
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {

        //클라이언트에서 보낸 메세지를 받을 prefix
        registry.setApplicationDestinationPrefixes("/pub");

        //해당 주소를 구독하고 있는 클라이언트들에게 메세지 전달
        registry.enableSimpleBroker("/sub");
    }
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/stomp/chat") //SockJS 연결 주소
                .setAllowedOrigins("http://localhost:8111")
                .withSockJS(); // 버전 낮은 브라우저에서도 적용 가능
        //주소 : ws://localhost:8111/ws-stomp
    }
}
