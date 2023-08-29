package com.springboot.mycgv.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Data
public class BoardDto {
    String page; //post로 넘길때 사용위함
    int rno, bhits;
    String bid, btitle, bcontent, id, bdate, bfile, bsfile;
    MultipartFile file1;
}
