package com.springboot.mycgv.service;

import com.springboot.mycgv.dto.BoardDto;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

@Service
public class FileUploadService {
    
    /* 파일 체크 */
    public Object fileCheck(BoardDto boardDto) {
        if(boardDto.getFile1().getOriginalFilename() != null
                && !boardDto.getFile1().getOriginalFilename().equals("")) {//파일이 존재

            //BSFILE 파일 중복 처리
            UUID uuid = UUID.randomUUID();	//랜덤 uuid 생성
            String bfile = boardDto.getFile1().getOriginalFilename();
            String bsfile = uuid + "_" + bfile;

            System.out.println("bfile-->"+bfile);
            System.out.println("bsfile-->"+bsfile);

            boardDto.setBfile(bfile);
            boardDto.setBsfile(bsfile);

        }else {
            System.out.println("파일 없음");
            //boardVo.setBfile("");
            //boardVo.setBsfile("");
        }

        return boardDto;
    }

    /**
     * fileSave 저장 기능 - 파일이 존재하면 서버에 저장하는 메소드
     */
    public void fileSave(BoardDto boardDto) throws Exception{
        //파일의 저장 위치
        String projectPath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\upload\\";
        System.out.println("path==>"+projectPath);

        //파일이 존재하면 서버에 저장
        if(boardDto.getBfile() != null && !boardDto.getBfile().equals("")) {
            System.out.println("save file -->" + boardDto.getBfile());
            File saveFile = new File(projectPath + boardDto.getBsfile());
            boardDto.getFile1().transferTo(saveFile);
        }
    }


    /**
     *	fileDelete 기능 - 파일 삭제
     */
    public void fileDelete(BoardDto boardDto, String oldFileName) throws Exception{
        //파일의 삭제 위치
        String projectPath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\upload\\";

        //새로운 파일이 존재하면 서버에 저장
        if(!boardDto.getFile1().getOriginalFilename().equals("")) {	//새로운 파일 선택
            File deleteFile = new File(projectPath + oldFileName);

            if(deleteFile.exists()) {
                deleteFile.delete();
            }
        }
    }

    /**
     *	fileDelete 기능 - 파일 삭제 - 오버로딩
     */
    public void fileDelete(String oldFileName) throws Exception{
        //파일의 삭제 위치
        String projectPath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\upload\\";

        //새로운 파일이 존재하면 서버에 저장
        if(oldFileName != null && !oldFileName.equals("")) {
            File deleteFile = new File(projectPath + oldFileName);
            System.out.println(projectPath + oldFileName);
            if(deleteFile.exists()) {
                deleteFile.delete();
            }
        }
    }

}
