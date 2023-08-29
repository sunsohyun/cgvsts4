package com.springboot.mycgv.controller;

import com.springboot.mycgv.dto.PageDto;
import com.springboot.mycgv.service.FileUploadService;
import com.springboot.mycgv.service.MemberService;
import com.springboot.mycgv.service.NoticeService;
import com.springboot.mycgv.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {

    @Autowired
    MemberService memberService;

    @Autowired
    NoticeService noticeService;

    @Autowired
    PageService pageService;

    @Autowired
    FileUploadService fileUploadService;

    /* admin index */
    @GetMapping("admin_index")
    public String admin_index(){
        return "/admin/admin_index";
    }

    /* admin_notice_list*/
    @GetMapping("admin_notice_list/{page}")
    public String admin_notice_list(@PathVariable String page, Model model) {

        PageDto pageDto = pageService.getPageResult(new PageDto(page,"notice"));

        model.addAttribute("list", noticeService.list(pageDto));
        model.addAttribute("page", pageDto);

        return "/admin/notice/admin_notice_list";
    }

    /* admin_notice_content */
    @GetMapping("admin_notice_content/{nid}/{page}")
    public String admin_notice_content(@PathVariable String nid, @PathVariable String page, Model model) {
        model.addAttribute("notice",noticeService.content(nid));
        model.addAttribute("page", page);
        return "/admin/notice/admin_notice_content";
    }





}
