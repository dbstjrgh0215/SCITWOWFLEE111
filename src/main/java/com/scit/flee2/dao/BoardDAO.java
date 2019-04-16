package com.scit.flee2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.flee2.vo.Board;
import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Proposal;
import com.scit.flee2.vo.Qna;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertProposal(Proposal prop) {
		int result = 0;
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.insertProposal(prop);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Proposal> listProposal(Member mem){
		ArrayList<Proposal> list = new ArrayList<Proposal>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			list = bm.listProposal(mem);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Proposal selectProposal(int clickNo) {
		Proposal result = new Proposal();

		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.selectProposal(clickNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteProposal(int clickNo) {
		int result = 0;

		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.deleteProposal(clickNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Board> listRecommend(String membertype){
		ArrayList<Board> list = new ArrayList<Board>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			list = bm.listRecommend(membertype);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int insertBoard(Board board) {
		int result = 0;
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.insertBoard(board);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<Board> listUserBoard(Member mem) {
		ArrayList<Board> list = new ArrayList<Board>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			list = bm.listUserBoard(mem);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public ArrayList<Board> listBoard(String membertype) {
		ArrayList<Board> list = new ArrayList<Board>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			list = bm.listBoard(membertype);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Board selectBoard(int boardnum) {
		Board result = new Board();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.selectBoard(boardnum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int insertQna(Qna qna) {
		int result = 0;

		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.insertQna(qna);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	public int insertReply(Qna qna) {
		int result = 0;

		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.insertReply(qna);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Qna> listQna(int boardnum){
		ArrayList<Qna> listQna = new ArrayList<Qna>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			listQna = bm.listQna(boardnum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return listQna;
	}

	public ArrayList<Qna> goQnaDetail(int qnanum) {
		ArrayList<Qna> listQna = new ArrayList<Qna>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			listQna = bm.goQnaDetail(qnanum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return listQna;
	}
	
	public int updateProposal(Proposal prop) {
		int result = 0;

		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.updateProposal(prop);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateBoard(Board board) {
		int result = 0;

		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.updateBoard(board);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteBoard(int clickNo) {
		int result = 0;

		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.deleteBoard(clickNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Board> searchBoard(String text){
		ArrayList<Board> list = new ArrayList<Board>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			list = bm.searchBoard("&"+text);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public ArrayList<Board> searchSpace(String text){
		ArrayList<Board> list = new ArrayList<Board>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			list = bm.searchSpace("&"+text);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<Board> searchSeller(String text){
		ArrayList<Board> list = new ArrayList<Board>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			list = bm.searchSeller("&"+text);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<Board> searchAnother(String text){
		ArrayList<Board> list = new ArrayList<Board>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			list = bm.searchAnother(text);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
