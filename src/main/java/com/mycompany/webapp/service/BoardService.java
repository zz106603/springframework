package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardsDao;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;

@Service
public class BoardService {
	
	@Autowired
	private BoardsDao boardsDao;
	
	public List<Board> getBoardList() {
		List<Board> list = boardsDao.selectAll(); 
		return list;
	}
	
	public List<Board> getBoardList(Pager pager) {
		List<Board> list = boardsDao.selectByPage(pager); 
		return list;
	}
	
	public void saveBoard(Board board) {
		boardsDao.insert(board);
	}

	public Board getBoard(int bno) {
		Board board = boardsDao.selectByBno(bno);
		return board;
	}

	public void updateBoard(Board board) {
		boardsDao.update(board);
		
	}

	public void deleteBoard(int bno) {
		boardsDao.delete(bno);
		
	}

	public void addHitcount(int bno) {
		boardsDao.updateBhitcount(bno);
		
	}

	public int getTotalRows() {
		int rows = boardsDao.count();
		return rows;
	}

}
