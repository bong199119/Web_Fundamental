package kr.co.acorn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.acorn.dto.EmpDto;
import kr.co.acorn.util.ConnLocator;

public class EmpDao {
	private static EmpDao single;
	private EmpDao() {}
	
	public static EmpDao getInstance() {
		if(single == null) {
			single = new EmpDao();
		}
		return single;
	}

	public ArrayList<EmpDto> select(int start, int len){
		ArrayList<EmpDto> list	= new ArrayList<EmpDto>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ConnLocator.getConnection();
			//3. sql을 보낼수 있도록 객체생성
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT empno, ename, job, mgr, date_format(hiredate,'%y/%m/%d'), sal, comm, deptno ");
			sql.append("FROM emp ");
			sql.append("ORDER BY empno ASC ");
			sql.append("LIMIT ?,? ");
			
			//4. 바인딩변수 설정
			pstmt = con.prepareStatement(sql.toString());
			
			int index = 0;
			pstmt.setInt(++index, start);
			pstmt.setInt(++index, len);
			
			//5. sql문 전송
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			index = 0;
			int no = rs.getInt(++index);
			String name = rs.getString(++index);
			String job = rs.getString(++index);
			int mgr = rs.getInt(++index);
			String hiredate = rs.getString(++index);
			int sal = rs.getInt(++index);
			int comm = rs.getInt(++index);
			int deptno = rs.getInt(++index);
			list.add(new EmpDto(no,name,job,mgr,hiredate,sal,comm,deptno));
				
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	
	
	
}






	
