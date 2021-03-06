package com.scit.flee2.dao;

import java.util.ArrayList;

import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Notice;
import com.scit.flee2.vo.Product;
import com.scit.flee2.vo.Seller;
import com.scit.flee2.vo.Space;

public interface MemberMapper {
	public ArrayList<Space> searchSpace(Space space); 
	public int insertMember(Member mem);
	public Member loginMember(Member mem);
	public Seller sessionSeller(String id);
	public Product sessionProduct(String id);
	public Space sessionSpace(String id);
	public int deleteMember(String id);
	public int insertSpace(Space space);
	public int insertSeller(Seller seller);
	public int insertProduct(Product product);
	public String checkId(String id);
	public String findId(Member mem);
	public String findPw(Member mem);
	public ArrayList<Notice> listNewNotice(String id);
	public ArrayList<Notice> listOldNotice(String id);
	public String noticeNickname(String id);
	public int updateConfirm(int noticenum);
	public int deleteNotice(int noticenum);
	public int countNewNotice(String id);
	public int goAllConfirm(String id);
}
