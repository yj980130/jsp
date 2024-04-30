package domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DeptEmpSal {
	
	private int empno;
	private String ename;
	private int deptno;
	private String dname;
	private double sal;
	
	@Override
	public String toString() {
		return String.format("%d\t%s\t%d\t%s\t%.2f\n", deptno, dname, empno, ename, sal);
	}
	
}
