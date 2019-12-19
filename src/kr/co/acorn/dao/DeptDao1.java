package kr.co.acorn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.acorn.dto.DeptDto1;
import kr.co.acorn.util.ConnLocator;

public class DeptDao1 {

	private static DeptDao1 single;
	private DeptDao1 () {
		
	}
	
	public static DeptDao1 getInstance() {
		if(single == null) {
			single = new DeptDao1();
			
		}
		return single;
	}
	
	public ArrayList<DeptDto1> select(int start, int len){
		ArrayList<DeptDto1> list = new ArrayList<DeptDto1>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		
		try {
			// 2. 데이터 베이스와 연결
			con = ConnLocator.getConnection();
			
			//3. PreParedStatement 객체를 생성
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT deptno, dname, loc ");
			sql.append("FROM dept ");
			sql.append("ORDER BY deptno ASC ");
			sql.append("LIMIT ?	,? ");
			pstmt = con.prepareStatement(sql.toString());
			
			//4. 바인딩 변수를 설정한다.
			int index = 0;
			pstmt.setInt(++index, start);
			pstmt.setInt(++index, len);
			
			//5. sql문 보내기
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				index = 0;
				int no  = rs.getInt(++index);
				String name = rs.getString(++index);
				String loc = rs.getString(++index);
				list.add(new DeptDto1(no,name,loc));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {

				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (SQLException e) {

			}
		}
		
		
		
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
}
