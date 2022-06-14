package kr.ac.kopo.member.dao;
/*
 * t_member 테이블에 대한 CRUD 메소드
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {
	
	public List<MemberVO> selectAll(){
		List<MemberVO> memberList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select id,name,password,email_id,email_domain,tel1,tel2,tel3,post,basic_addr,detail_addr,type ");
		sql.append("      , to_char(reg_date, 'yyyy-mm-dd') reg_date ");
		sql.append(" from t_member ");
		
		try(
			 Connection conn = new ConnectionFactory().getConnetion();
			 PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	
		) {
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String emailId = rs.getString("email_id");
				String emailDomain = rs.getString("email_domain");
				String tel1 = rs.getString("tel1");
				String tel2 = rs.getString("tel2");
				String tel3 = rs.getString("tel3");
				String post = rs.getString("post");
				String basicAddr = rs.getString("basic_addr");
				String detailAddr = rs.getString("detail_addr");
				String type = rs.getString("type");
				String regDate = rs.getString("reg_date");
				
				MemberVO member = new MemberVO();
				
				member.setId(id);
				member.setName(name);
				member.setPassword(password);
				member.setEmailId(emailId);
				member.setEmailDomain(emailDomain);
				member.setTel1(tel1);
				member.setTel2(tel2);
				member.setTel3(tel3);
				member.setPost(post);
				member.setBasicAddr(basicAddr);
				member.setDetailAddr(detailAddr);
				member.setType(type);
				member.setRegDate(regDate);
				
				//System.out.println(board);
				memberList.add(member);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberList;
	}

	public MemberVO login(MemberVO memberVO){
		StringBuilder sql = new StringBuilder();
		sql.append("select id, name, password, type ");
		sql.append(" from t_member ");
		sql.append(" where id = ? and password = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnetion();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, memberVO.getId());
			pstmt.setString(2, memberVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			// id 가 기본키이기 때문에 나올 수 있는 레코드가 0~1개
			if(rs.next()) {
				MemberVO userVO = new MemberVO();
				userVO.setId(rs.getString("id"));
				userVO.setPassword(rs.getString("password"));
				userVO.setName(rs.getString("name"));
				userVO.setType(rs.getString("type"));
				
				return userVO;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// 로그인 실패할 경우 null 리턴
		return null;
	}
	
	

}
