package com.scit.flee2.dao;

import java.util.ArrayList;

import com.scit.flee2.vo.Board;
import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Proposal;
import com.scit.flee2.vo.Qna;

public interface BoardMapper {
	public int insertProposal(Proposal prop);
	public ArrayList<Proposal> listProposal(Member mem);
	public Proposal selectProposal(int clickNo);
	public int deleteProposal(int clickNo);
	public ArrayList<Board> listRecommend(String membertype);
	public int insertBoard(Board board);
	public ArrayList<Board> listUserBoard(Member mem);
	public ArrayList<Board> listBoard(String membertype);
	public Board selectBoard(int boardnum);
	public int insertQna(Qna qna);
	public int insertReply(Qna qna);
	public ArrayList<Qna> listQna(int boardnum);
	public ArrayList<Qna> goQnaDetail(int qnanum);
	public int updateProposal(Proposal prop);
	public int deleteBoard(int clickNo);
	public ArrayList<Board> searchBoard(String text);
	public int updateBoard(Board board);
	public ArrayList<Board> searchSpace(String text);
	public ArrayList<Board> searchSeller(String text);
	public ArrayList<Board> searchAnother(String text);
}
