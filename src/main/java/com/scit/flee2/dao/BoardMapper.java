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
	public int updateProposal(Proposal prop);
	public int deleteBoard(int clickNo);
}
