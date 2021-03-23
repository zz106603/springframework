package com.mycompany.webapp.controller;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.BoardService;

@Controller
@RequestMapping("/exam04")
public class Exam04Controller {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private DataSource dataSource;

	
	@RequestMapping("/content")
	public String content(Model model) {
		
		Connection conn = null;
		try {
			//커넥션 풀에서 커넥션 객체를 대여해 오기
			conn = dataSource.getConnection();
			model.addAttribute("connStatus", "성공");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("connStatus", "실패");
		}finally {
			try{
				//커넥션 풀로 커넥션 객체를 반납
				conn.close();
			}catch(Exception e) {}
		}
		return "exam04/content";
	}


	/*@GetMapping("/list")
	public String getBoardList(Model model) {
			List<Board> list = boardService.getBoardList();
			model.addAttribute("list", list);
			return "exam04/boardlist";
	}*/
	
	@GetMapping("/list")
	public String getBoardList(
			@RequestParam(defaultValue="1") int pageNo, Model model) {
			
			int totalRows = boardService.getTotalRows();
			Pager pager = new Pager(10,5,totalRows, pageNo);
			List<Board> list = boardService.getBoardList(pager);
			model.addAttribute("list", list);
			model.addAttribute("pager", pager);
			return "exam04/boardlist";
	}
	
	@GetMapping("/createForm")
	public String createForm() {
		return "exam04/createForm";
	}
	
	
	/*	@PostMapping("/create")
		public String saveBoard(String btitle, String bcontent) {
			
			Board board = new Board();
			board.setBtitle(btitle);
			board.setBcontent(bcontent);
			board.setBwriter("임시 사용자");
			boardsService.saveBoard(board);
			
			return "redirect:/exam04/list";
		}*/
	
	@PostMapping("/create")
	public String create(Board board) {
		board.setBwriter("임시 사용자");
		boardService.saveBoard(board);
		
		return "redirect:/exam04/list";
	}
	
	
	@GetMapping("/read")
	public String read(int bno, Model model) {
		boardService.addHitcount(bno);
		Board board = boardService.getBoard(bno);
		model.addAttribute("board", board);
		return "exam04/read";
	}
	
	@GetMapping("/updateForm")
	public String updateForm(int bno, Model model) {
		
		//수정창에 기존 데이터를 가져옴
		Board board = boardService.getBoard(bno);
		model.addAttribute("board", board);
		return "exam04/updateForm";
	}
	
	/* form을 이용하여 데이터를 전달받아서 객체에 저장 */
	@PostMapping("/update")
	public String update(Board board) {
		boardService.updateBoard(board);
		return "redirect:/exam04/list";
	}
	
	/* Get으로 데이터를 전달 받았기 때문에 int bno선언 후 사용 */
	@GetMapping("/delete")
	public String delete(int bno) {
		boardService.deleteBoard(bno);
		
		return "redirect:/exam04/list";
	}
	
	

}
