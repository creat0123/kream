package com.kream.board;

import java.sql.Timestamp;

/*
CREATE TABLE kream_board (
    num INT NOT NULL,
    writer VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    pass VARCHAR(100) NOT NULL,
    readcount INT DEFAULT 0 NOT NULL,
    ref INT DEFAULT 0 NOT NULL,
    step INT DEFAULT 0 NOT NULL,
    depth INT DEFAULT 0 NOT NULL,
    regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip VARCHAR(20) NOT NULL,
    content VARCHAR(4000) NOT NULL,
    PRIMARY KEY (num)
);
ALTER TABLE kream_board
MODIFY COLUMN num INT AUTO_INCREMENT;

-- MariaDB에서는 시퀀스 대신 AUTO_INCREMENT 사용
-- MariaDB에서는 commit 문이 필요 없음

-- 다음은 num 필드에 AUTO_INCREMENT를 추가하는 방법입니다.
-- MariaDB에서는 시퀀스 대신 AUTO_INCREMENT를 사용합니다.
-- AUTO_INCREMENT는 자동으로 값이 증가합니다.
-- 주의: MariaDB에서는 테이블 생성 시 AUTO_INCREMENT를 설정하는 것이 더 흔하며,
-- 이미 생성된 테이블의 경우 ALTER TABLE 문을 사용해야 합니다.
 */
public class BoardDTO {
	private int num;
	private String writer;
	private String email;
	private String subject;
	private String pass;
	private int readCount;
	private int ref;
	private int step;
	private int depth;
	private Timestamp regDate;
	private String ip;
	private String content;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}