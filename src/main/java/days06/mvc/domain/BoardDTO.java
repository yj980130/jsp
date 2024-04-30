package days06.mvc.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDTO {
	
	private long seq;
	private String writer;
	private String pwd;
	private String email;
	private String title;
	private Date writeDate;
	private int readed;
	private int tag;
	private String content;
	
}
