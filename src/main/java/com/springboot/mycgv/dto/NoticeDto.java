package com.springboot.mycgv.dto;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.ArrayList;

@Data
public class NoticeDto {
    int rno, nhits;
    String nid, ntitle, ncontent, ndate, nfile1, nsfile1, nfile2, nsfile2;
    CommonsMultipartFile[] files;
    ArrayList<String> nfiles = new ArrayList<String>();
    ArrayList<String> nsfiles = new ArrayList<String>();
}
