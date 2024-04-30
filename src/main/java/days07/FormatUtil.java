package days07;

import java.text.DecimalFormat;

public class FormatUtil {
	
	// 인스턴스 메서드
	public String number(long number, String pattern) {
		DecimalFormat df = new DecimalFormat();
		return df.format(number);
	}
	
	// 정적 메서드		
	public static String staticNumber(long number, String pattern) {
		DecimalFormat df = new DecimalFormat();
		return df.format(number);
	}
	
}
