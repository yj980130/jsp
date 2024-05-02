package homework;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ImageListDTO {
	
	// table column name = file name
	private int product_id;                   // 번호
    private String subject;                 
    private String product_name;    // 시스템파일명
    private String product_detail; // 제목
    private String filesystemname;    // 시스템파일명
    private String originalfilename;  // 오리지널파일명
    private long filelength;
    
}
