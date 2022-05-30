package myDiary;

import java.sql.Timestamp;

public class DiaryDTO {
	private String id;
	private Timestamp regDate;
	private String content;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp date) {
		this.regDate = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "DiaryDTO [id=" + id + ", date=" + regDate + ", content=" + content + "]";
	}
}
