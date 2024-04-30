package days05;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

// 자바빈(Java Bean)
@Getter
@Setter
public class MemberInfo implements Serializable{
	
	private static final long serialVersionUID = 888475768047718294L;
	
	private String id; 
	private String passwd;
	private String name;
	private Date registerDate; 
	private String email;
	
}
