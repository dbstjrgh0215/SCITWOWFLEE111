package com.scit.flee2.dao;

import java.util.ArrayList;

import com.scit.flee2.vo.Board;
import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Proposal;

public interface BoardMapper {
	public int insertProposal(Proposal prop);
	public ArrayList<Proposal> listProposal(Member mem);
	public Proposal selectProposal(int clickNo);
	public int deleteProposal(int clickNo);
	public ArrayList<Board> listRecommendSeller();
	public int insertBoard(Board board);
	public ArrayList<Board> listUserBoard(Member mem);
	public ArrayList<Board> listBoard(String membertype);
}
