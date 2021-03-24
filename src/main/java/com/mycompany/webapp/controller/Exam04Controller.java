package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.BoardService;

@Controller
@RequestMapping("/exam04")
public class Exam04Controller {
	private static final Logger logger = LoggerFactory.getLogger(Exam04Controller.class);
	
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
	
	//////////////////////////////////////////////////
	
	@GetMapping("/createFormWithAttach")
	public String createFormWithAttach() {
		return "exam04/createFormWithAttach";
	}
	
	/*	@PostMapping("/createFormWithAttach")
		public String createFormWithAttach(String btitle, String bcontent, MultipartFile battach) {
			logger.info(btitle);
			logger.info(bcontent);
			logger.info(battach.getOriginalFilename());
			logger.info(battach.getContentType());
			return "redirect:/exam04/list";
		}*/
	
	//파일 저장 컨트롤러
	@PostMapping("/createFormWithAttach")
	public String createFormWithAttach(Board board) {
		MultipartFile battach = board.getBattach();
		if(!battach.isEmpty()) {
			board.setBattachoname(battach.getOriginalFilename());
			board.setBattachtype(battach.getContentType());
			//파일 저장 시 이름 중복 제거
			String saveName = new Date().getTime() + "-" + battach.getOriginalFilename();
			board.setBattachsname(saveName);
			
			File file = new File("D:/Team6Projects/MyProject/uploadfiles/" + saveName);
			try {
				battach.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		logger.info(board.getBtitle());
		logger.info(board.getBcontent());
		logger.info(board.getBattachoname());
		logger.info(board.getBattachsname());
		logger.info(board.getBattachtype());
		
		//작성자는 나중에 로그인처리
		board.setBwriter("user1");
		boardService.saveBoard(board);
		
		return "redirect:/exam04/list";
	}
	
	
	@GetMapping("/downloadAttach")
	public void downloadAttach(int bno, HttpServletResponse response) {
		
		try {
			Board board = boardService.getBoard(bno);
			
			//응답HTTP 헤더에 저장될 바디의 타입
			response.setContentType(board.getBattachtype());
			
			//응답HTTP 헤더에 다운로드 될 수 있도록 파일 이름 저장
			String originalName = board.getBattachoname();
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\";");
			
			//파일을 was에 가져온 후
			InputStream is = new FileInputStream("D:/Team6Projects/MyProject/uploadfiles/" + board.getBattachsname());
			logger.info(board.getBattachsname());
			//응답HTTP 바디에 전달
			OutputStream os = response.getOutputStream();
			
			//파일 복사 메서드 사용
			FileCopyUtils.copy(is, os);
			
			os.flush();
			is.close();
			os.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	

}

