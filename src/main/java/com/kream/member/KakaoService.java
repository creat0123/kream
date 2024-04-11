package com.kream.member;

import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class KakaoService {
	
	private String accessToken;
	@Autowired 
	private HttpSession session;

	public void getAccessToken(String code) {
		String requrl = "https://kauth.kakao.com/oauth/token";
		String reqParam = "grant_type=authorization_code";
		reqParam += "&client_id=****";
		reqParam += "&redirect_uri=http://localhost:80/kakaoLogin"; 
		reqParam += "&code=" + code;

		// 서버 대 서버 통신
		try {
			URL url = new URL(requrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(reqParam);
			bw.flush();

			InputStreamReader isr = new InputStreamReader(conn.getInputStream());
			ObjectMapper om = new ObjectMapper();

			Map<String, String> map = om.readValue(isr, new TypeReference<Map<String, String>>() {});
			accessToken = map.get("****");
			System.out.println("**** : " + map.get("****"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getUserInfo(Model model) {
		String requrl = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(requrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			int responseCode = conn.getResponseCode();
			System.out.println("code = " + responseCode);

			ObjectMapper om = new ObjectMapper();
			JsonNode jsonNode = om.readTree(conn.getInputStream());

			String kakaoId = jsonNode.get("id").asText();
			String kakaoNickname = jsonNode.get("properties").get("nickname").asText();

			// 세션에 저장
			session.setAttribute("kakaoid", kakaoId);
			session.setAttribute("kakaonickname", kakaoNickname);

			System.out.println("Kakao ID = " + kakaoId);
			System.out.println("Kakao Nickname = " + kakaoNickname);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void unlink() {
		String requrl = "https://kapi.kakao.com/v1/user/unlink";

		try {
			URL url = new URL(requrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			int responseCode = conn.getResponseCode();
			System.out.println("code = " + responseCode);

			ObjectMapper om = new ObjectMapper();
			JsonNode jsonNode = om.readTree(conn.getInputStream());

			// 세션 정보 제거
			session.removeAttribute("kakaoid");
			session.removeAttribute("kakaonickname");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
