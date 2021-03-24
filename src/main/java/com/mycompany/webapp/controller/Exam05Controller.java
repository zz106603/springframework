package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.BoardService;

@Controller
@RequestMapping("/exam05")
public class Exam05Controller {
	private static final Logger logger = LoggerFactory.getLogger(Exam05Controller.class);

	@Autowired
	private BoardService boardService;


	@RequestMapping("/content")
	public String content(Model model) {
		return "exam05/content";
	}


	@GetMapping("/list")
	public String list(@RequestParam(defaultValue = "1")int pageNo, Model model) {

		int totalRows = boardService.getTotalRows();
		Pager pager = new Pager(10,5,totalRows, pageNo);
		List<Board> list = boardService.getBoardList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "exam05/boardlist";

	}

	@GetMapping("/read")
	public String read(int bno, Model model) {
		boardService.addHitcount(bno);
		Board board = boardService.getBoard(bno);
		model.addAttribute("board", board);
		return "exam05/read";
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
	@GetMapping("/updateForm")
	public String updateForm(int bno, Model model) {

		//수정창에 기존 데이터를 가져옴
		Board board = boardService.getBoard(bno);
		model.addAttribute("board", board);
		return "exam05/updateForm";
	}

	@PostMapping(value = "/update", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String update(Board board) {
		boardService.updateBoard(board);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");

		return jsonObject.toString();
	}

	@GetMapping(value="/delete", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String delete(int bno) {
		boardService.deleteBoard(bno);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}

	@GetMapping("/createForm")
	public String createForm() {
		return "exam05/createForm";
	}
	
	@PostMapping(value = "/create", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String create(Board board) {
		MultipartFile battach = board.getBattach();
		if(battach != null && !battach.isEmpty()) {
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
		
		/*logger.info(board.getBtitle());
		logger.info(board.getBcontent());
		logger.info(board.getBattachoname());
		logger.info(board.getBattachsname());
		logger.info(board.getBattachtype());*/
		
		//작성자는 나중에 로그인처리
		board.setBwriter("user1");
		boardService.saveBoard(board);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}
	
}

