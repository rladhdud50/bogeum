package com.cos.bogeum.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j2
public class ChatContrller {

    @GetMapping("/auth/chat")
    public String chatGET(Model model) {
        log.info("@ChatController, chat GET()");
        model.addAttribute("name", "Rooney");
        return "th/chat";
    }

}
