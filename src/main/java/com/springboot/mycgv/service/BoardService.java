package com.springboot.mycgv.service;

import com.springboot.mycgv.dto.BoardDto;
import com.springboot.mycgv.dto.PageDto;
import com.springboot.mycgv.repository.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardMapper boardMapper;

    public List<BoardDto> list(PageDto pageDto) {
        return boardMapper.list(pageDto);
    }

    public BoardDto content(String bid){
        return boardMapper.content(bid);
    }

    public int insert(BoardDto boardDto){
        return boardMapper.insert(boardDto);
    }

    public int getUpdate(BoardDto boardDto) {
        return boardMapper.update(boardDto);
    }

    public String getBsfile(String bid){
        return boardMapper.getBsfile(bid);
    }
    public int delete(String bid){
        return boardMapper.delete(bid);
    }
}
