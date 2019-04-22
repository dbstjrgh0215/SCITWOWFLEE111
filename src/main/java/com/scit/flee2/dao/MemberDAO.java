package com.scit.flee2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Notice;
import com.scit.flee2.vo.Product;
import com.scit.flee2.vo.Seller;
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
	
	public int insertMember(Member mem) {
		int result = 0;
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.insertMember(mem);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public Member loginMember(Member mem) {
		Member result = new Member();
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.loginMember(mem);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public Seller sessionSeller(String id) {
		Seller result = new Seller();
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.sessionSeller(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;		
	}
	public Product sessionProduct(String id) {
		Product result = new Product();
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.sessionProduct(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;		
	}
	public Space sessionSpace(String id) {
		Space result = new Space();
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.sessionSpace(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;		
	}
	
	
	public int deleteMember(String id) {
		int result = 0;
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.deleteMember(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int insertSpace(Space space) {
		int result = 0;
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.insertSpace(space);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int insertSeller(Seller seller) {
		int result = 0;
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.insertSeller(seller);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public int insertProduct(Product product) {
		int result = 0;
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.insertProduct(product);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public String checkId(String id) {
		String result = "";
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.checkId(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String findId(Member mem) {
		String result ="";
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.findId(mem);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public String findPw(Member mem) {
		String result ="";
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.findPw(mem);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Notice> listNewNotice(String id){
		ArrayList<Notice> list = new ArrayList<Notice>();
		MemberMapper bm = sqlSession.getMapper(MemberMapper.class);
		try {
			list = bm.listNewNotice(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Notice> listOldNotice(String id){
		ArrayList<Notice> list = new ArrayList<Notice>();
		MemberMapper bm = sqlSession.getMapper(MemberMapper.class);
		try {
			list = bm.listOldNotice(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public String noticeNickname(String id) {
		String result ="";
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.noticeNickname(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateConfirm(int noticenum) {
		int result = 0;
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.updateConfirm(noticenum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteNotice(int noticenum) {
		int result = 0;
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.deleteNotice(noticenum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int countNewNotice(String id) {
		int result = 0;
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.countNewNotice(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int goAllConfirm(String id) {
		int result = 0;
		
		MemberMapper mm = sqlSession.getMapper(MemberMapper.class);
		
		try {
			result = mm.goAllConfirm(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
