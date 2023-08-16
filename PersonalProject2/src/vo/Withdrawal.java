package vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Withdrawal {
	private Date wddate;
	private int wdcnt;
}
