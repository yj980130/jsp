package domain;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmpVO {

	
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private Date hiredate;
//	private LocalDateTime hiredate;
	private double sal;
	private double comm;
	private int deptno;

	
}
