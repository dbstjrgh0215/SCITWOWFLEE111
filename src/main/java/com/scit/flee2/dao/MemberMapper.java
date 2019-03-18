package com.scit.flee2.dao;

import java.util.ArrayList;

import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Product;
import com.scit.flee2.vo.Seller;
import com.scit.flee2.vo.Space;

public interface MemberMapper {
	public ArrayList<Space> searchSpace(Space space); 
	public int insertMember(Member mem);
	public Member loginMember(Member mem);
	public int deleteMember(String id);
	public int insertSpace(Space space);
	public int insertSeller(Seller seller);
	public int insertProduct(Product product);
}
