package com.kream.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailController {

    private final MailService mailService;

    public MailController(MailService mailService) {
        this.mailService = mailService;
    }

    @ResponseBody
    @PostMapping("/mail")
    public Map<String, Object> mailSend(@RequestBody Map<String, String> requestBody) {
        String mail = requestBody.get("mail");
        System.out.println("Received mail: " + mail);
        int number = mailService.sendMail(mail);
        System.out.println("서버에서 생성한 번호: " + number);

        Map<String, Object> response = new HashMap<>();
        response.put("number", number); // 숫자 그대로 전송
        System.out.println("Response: " + response);
        return response;
    }
}
