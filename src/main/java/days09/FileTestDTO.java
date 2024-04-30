package days09;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FileTestDTO {
	
	// table column name = file name
	private int num;                  // 번호
    private String subject;           // 제목
    private String filesystemname;    // 시스템파일명
    private String originalfilename;  // 오리지널파일명
    private long filelength;
    
}
