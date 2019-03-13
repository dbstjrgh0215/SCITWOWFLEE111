package com.scit.flee2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.flee2.vo.Space;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<Space> searchSpace(Space space){
		ArrayList<Space> result = new ArrayList<Space>();
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.searchSpace(space);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result; 
	}
}
