package com.kream.member;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {

    @Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");  // SMTP 호스트 설정
        mailSender.setPort(587);  // SMTP 포트 설정
        mailSender.setUsername("dewyfiower9440@gmail.com");  // SMTP 사용자 이름 설정
        mailSender.setPassword("tebeahviaagglxsc");  // SMTP 비밀번호 설정

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");  // 디버그 모드 활성화

        return mailSender;
    }
}