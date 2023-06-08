package com.cos.bogeum.controller;


import com.cos.bogeum.model.Finds;
import com.cos.bogeum.model.Free;
import com.cos.bogeum.model.Inquirys;
import com.cos.bogeum.model.Notice;
import com.cos.bogeum.repository.FreeRepository;
import com.cos.bogeum.service.FindsService;
import com.cos.bogeum.service.FreeService;
import com.cos.bogeum.service.InquiryService;
import com.cos.bogeum.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
@Autowired
    private FindsService findsService;
@Autowired
private NoticeService noticeService;
@Autowired
private InquiryService inquiryService;
@Autowired
private FreeService freeService;
    @Autowired
    private FreeRepository freeRepository;

    @GetMapping("/")
    public String board_index(Model model,
                              @PageableDefault(size = 5, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
        model.addAttribute("inquirys", inquiryService.글목록(pageable));
        model.addAttribute("notice", noticeService.글목록(pageable));
        model.addAttribute("finds", findsService.글목록(pageable));
        model.addAttribute("free",freeService.글목록(pageable));
        return "index";
    }
    @GetMapping({"/auth/board"})
    public String mainBoard(Model model,
                            @PageableDefault(size = 5, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
        model.addAttribute("inquirys", inquiryService.글목록(pageable));
        model.addAttribute("notice", noticeService.글목록(pageable));
        model.addAttribute("finds", findsService.글목록(pageable));
        model.addAttribute("free",freeService.글목록(pageable));
        return "board/main_board";}

    /* 분실-습득 */

    @GetMapping({ "/auth/findboard" })
    public String finds_index(Model model,
                                @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
        model.addAttribute("finds", findsService.글목록(pageable));
        return "board/find_board";
    }

    @GetMapping("/finds/{id}/find_board_updateForm")
    public String updateForm(@PathVariable int id, Model model) {
        model.addAttribute("finds", findsService.글상세보기(id));
        return "board/find_board_updateForm";
    }

    @GetMapping("/finds/{id}")
    public String findById(@PathVariable int id, Model model) {
        model.addAttribute("finds", findsService.글상세보기(id));
        findsService.updateCount(id);
        model.addAttribute("reply", findsService.댓글(id));
        return "board/find_board_detail";
    }

    @GetMapping({ "/find_board_saveForm" })
    public String saveForm() {
        return "board/find_board_saveForm";
    }

    @GetMapping("/auth/finds/search")
    public String search(@RequestParam(value = "keyword") String keyword, Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {

        Page<Finds> findsDtoList = findsService.searchPosts(keyword, pageable);
        model.addAttribute("keyword", keyword);
        model.addAttribute("findsList", findsDtoList);
        return "board/find_board_search";
    }

    /* ======공지사항====== */
    @GetMapping({ "/auth/notice" })
    public String finds_index1(Model model,
                              @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
        model.addAttribute("notice", noticeService.글목록(pageable));
        return "board/notice_board";
    }

    @GetMapping("/notice/{id}/notice_board_updateForm")
    public String updateForm1(@PathVariable int id, Model model) {
        model.addAttribute("notice", noticeService.글상세보기(id));
        return "board/notice_board_updateForm";
    }

    @GetMapping("/notice/{id}")
    public String findById1(@PathVariable int id, Model model) {
        model.addAttribute("notice", noticeService.글상세보기(id));
        noticeService.updateCount(id);
//        model.addAttribute("reply", noticeService.댓글(id));
        return "board/notice_board_detail";
    }

    @GetMapping({ "/notice_board_saveForm" })
    public String saveForm1() {
        return "board/notice_board_saveForm";
    }

    @GetMapping("/auth/notice/search")
    public String search1(@RequestParam(value = "keyword") String keyword, Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {

        Page<Notice> noticeDtoList = noticeService.searchPosts(keyword, pageable);
        model.addAttribute("keyword", keyword);
        model.addAttribute("noticeList", noticeDtoList);
        return "board/notice_board_search";
    }
    /* FAQs 게시판 */

    @GetMapping({ "/auth/inquiry" })
    public String inquiry_index(Model model,
                                @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
        model.addAttribute("inquirys", inquiryService.글목록(pageable));
        return "board/inquiry_board";
    }

    @GetMapping("/inquiry/{id}/inquiry_board_updateForm")
    public String updateForm2(@PathVariable int id, Model model) {
        model.addAttribute("inquirys", inquiryService.글상세보기(id));
        return "board/inquiry_board_updateForm";
    }

    @GetMapping("/inquiry/{id}")
    public String findById2(@PathVariable int id, Model model) {
        model.addAttribute("inquirys", inquiryService.글상세보기(id));
        inquiryService.updateCount(id);
        model.addAttribute("reply", inquiryService.댓글(id));
        return "board/inquiry_board_detail";
    }

    @GetMapping({ "/inquiry_board_saveForm" })
    public String saveForm2() {
        return "board/inquiry_board_saveForm";
    }

    @GetMapping("/auth/inquiry/search")
    public String search2(@RequestParam(value = "keyword") String keyword, Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {

        Page<Inquirys> inquiryDtoList = inquiryService.searchPosts(keyword, pageable);
        model.addAttribute("keyword", keyword);
        model.addAttribute("inquiryList", inquiryDtoList);
        return "board/inquiry_board_search";
    }

    /* ======자유게시판====== */
    @GetMapping({ "/auth/free" })
    public String finds_index3(Model model,
                               @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
        model.addAttribute("free", freeService.글목록(pageable));
        return "board/free_board";
    }

    @GetMapping("/free/{id}/free_board_updateForm")
    public String updateForm3(@PathVariable int id, Model model) {
        model.addAttribute("free", freeService.글상세보기(id));
        return "board/free_board_updateForm";
    }

    @GetMapping("/free/{id}")
    public String findById3(@PathVariable int id, Model model) {
        model.addAttribute("free", freeService.글상세보기(id));
        freeService.updateCount(id);
        model.addAttribute("reply", freeService.댓글(id));
        return "board/free_board_detail";
    }

    @GetMapping({ "/free_board_saveForm" })
    public String saveForm3() {
        return "board/free_board_saveForm";
    }

    @GetMapping("/auth/free/search")
    public String search3(@RequestParam(value = "keyword") String keyword, Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {

        Page<Free> freeDtoList = freeService.searchPosts(keyword, pageable);
        model.addAttribute("keyword", keyword);
        model.addAttribute("freeList", freeDtoList);
        return "board/free_board_search";
    }


}