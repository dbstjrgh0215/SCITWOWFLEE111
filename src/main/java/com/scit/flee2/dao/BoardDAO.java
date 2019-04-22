package com.scit.flee2.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.flee2.vo.Board;
import com.scit.flee2.vo.Contract;
import com.scit.flee2.vo.ContractHanasi;
import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Notice;
import com.scit.flee2.vo.Product;
import com.scit.flee2.vo.Proposal;
import com.scit.flee2.vo.Qna;
import com.scit.flee2.vo.Request;
import com.scit.flee2.vo.Seller;
import com.scit.flee2.vo.Space;
import com.scit.flee2.vo.Zzim;

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
	
	public int countQna(int boardnum) {
		int result = 0;
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.countQna(boardnum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
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
	
	public int updateCnt(int boardnum) {
		int result = 0;

		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.updateCnt(boardnum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateCntZzim(HashMap<String,Integer> map) {
		int result = 0;

		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.updateCntZzim(map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public int updateCntQna(HashMap<String,Integer> map) {
		int result = 0;

		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.updateCntQna(map);
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
	
	public ArrayList<Board> searchPopular(){
		ArrayList<Board> list = new ArrayList<Board>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			list = bm.searchPopular();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public int insertRequest(Request req) {
		int result = 0;
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.insertRequest(req);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Request> listRequest(int boardnum){
		ArrayList<Request> result = new ArrayList<Request>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.listRequest(boardnum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Request> myRequest(String id){
		ArrayList<Request> result = new ArrayList<Request>();
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.myRequest(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int clickApproval(HashMap<String,String> map) {
		int result = 0;
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.clickApproval(map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int countApproval(int boardnum) {
		int result = 0;
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = bm.countApproval(boardnum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int insertZzim(Zzim zzim) {
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		try {
		result = bm.insertZzim(zzim);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int countZzim(int boardnum) {
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		try {
		result = bm.countZzim(boardnum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteZzim(Zzim zzim) {
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		try {
		result = bm.deleteZzim(zzim);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Zzim checkZzim(Zzim zzim) {
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		Zzim result = null;
		try {
		result = bm.checkZzim(zzim);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertNotice(Notice notice) {
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		try {
		result = bm.insertNotice(notice);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertContract(Contract contract) {
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		try {
		result = bm.insertContract(contract);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Contract> listContract(String id){
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		ArrayList<Contract> list = new ArrayList<Contract>();
		try {
			list = bm.listContract(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int updateContract(Contract contract) {
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		try {
			result = bm.updateContract(contract);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int startContract(Contract contract) {
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		try {
			result = bm.startContract(contract);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String searchNickName(String id) {
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		String result = "";
		try {
		result = bm.searchNickName(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Integer> zzimList(String id){
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			list = bm.zzimList(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int countContract(String id) {
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		try {
			result = bm.countContract(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Contract selectContract(int contractnum) {
		Contract contract = new Contract();
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		try {
			contract = bm.selectContract(contractnum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return contract;
	}
	
	public Seller selectSellerInfo(String id) {
		Seller seller = new Seller();
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		try {
			seller = bm.selectSellerInfo(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return seller;
	}
	public Space selectSpaceInfo(String id) {
		Space space = new Space();
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		try {
			space = bm.selectSpaceInfo(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return space;
	}
	
	public Product selectProductInfo(int sellernum) {
		Product product = new Product();
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		try {
			product = bm.selectProductInfo(sellernum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return product;
	}
	
	public int insertHanasi(ContractHanasi hanasi) {
		int result = 0;
		
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		try {
			result = bm.insertHanasi(hanasi);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<ContractHanasi> listHanasi(int contractnum){
		ArrayList<ContractHanasi> list = new ArrayList<ContractHanasi>();
		BoardMapper bm = sqlSession.getMapper(BoardMapper.class);
		try {
			list = bm.listHanasi(contractnum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
