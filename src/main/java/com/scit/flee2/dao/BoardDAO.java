package com.scit.flee2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Proposal;

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
}
