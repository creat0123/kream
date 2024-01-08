package com.kream.board;
/*
CREATE TABLE admin_board (
    no INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    id VARCHAR(20) NOT NULL,
    time VARCHAR(15) NOT NULL,
    content VARCHAR(200) NOT NULL,
    image VARCHAR(255)
);
*/

public class AdminBoardDTO {
	private int no;
	private String title;
	private String id;
	private String time;
	private String content;
	private String image;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
