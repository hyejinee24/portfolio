package vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private int rno;
	private int mno;
	private String id;
	private String content;
	private Date regdate;
}
