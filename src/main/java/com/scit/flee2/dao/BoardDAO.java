package com.scit.flee2.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
