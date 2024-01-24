package com.kream.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailService {

    private final JavaMailSender javaMailSender;
    private final String senderEmail = "dewyfiower9440@gmail.com";

    @Autowired
    public MailService(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    public int createNumber() {
        int number = (int) (Math.random() * 90000) + 100000;
        System.out.println("Generated number: " + number);
        return number;
    }

    public MimeMessage createMail(String mail, int number) throws MessagingException {
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom(senderEmail);
            helper.setTo(mail);
            helper.setSubject("이메일 인증");

            String body = "<h3>요청하신 인증 번호입니다.</h3>"
                    + "<h1>" + number + "</h1>"
                    + "<h3>감사합니다.</h3>";

            helper.setText(body, true);
        } catch (MessagingException e) {
            throw new MessagingException("Failed to create MimeMessage", e);
        }

        return message;
    }

    public int sendMail(String mail) {
        try {
            int number = createNumber();
            MimeMessage message = createMail(mail, number);
            javaMailSender.send(message);
            return number;
        } catch (MessagingException e) {
            e.printStackTrace();
            // 예외 던지기도 고려 가능
            return -1;
        }
    }
}
