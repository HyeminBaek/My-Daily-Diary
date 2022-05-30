package myDiary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class UserDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/sys?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	private static final String USER ="root";
	private static final String PWD="root";
	
	//생성자
	public UserDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("UserDAO 객체 생성 실패: "+e);
		}
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL,USER,PWD);
		} catch (SQLException e) {
			System.out.println("DB 연결 실패: "+e);
		}
		return conn;
	}
	//회원 정보 테이블에 추가
	public int insertUser(UserDTO dto) {
		int ok =0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "insert into user values(?,?)";
		
		try {
			conn = getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1,dto.getId());
			ps.setString(2,dto.getPw());

			ok = ps.executeUpdate(); 
		} catch (Exception e) {
			System.out.println("회원가입 실패: "+e);
		} finally {
			close(conn,ps);
		}
		
		return ok;
	}
	//login
	public int login(UserDTO dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT count(id) FROM user WHERE id=? and pw=?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			
			rs = ps.executeQuery();
			
			int result = 0;
			if(rs.next()) {
				result = rs.getInt("count(id)");
			}
			if(result==1) { //로그인 성공
				return 1;
			} else { //로그인 실패
				return 0;
			}
		} catch(Exception e) {
			System.out.println("로그인 시도 실패: "+e);
			return -1;
		} finally {
			close(conn,ps,rs);
		}
	}
	//DB 연결 종료
	private void close(Connection conn, PreparedStatement ps) {
		try {
			if(ps!=null) {
				ps.close();
			}
		} catch (SQLException e) {
			System.out.println("PreparedStatement 객체 닫기 실패: "+e);
		}
		try {
			if(conn!=null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("Connection 객체 닫기 실패: "+e);
		}
		
	}
	private void close(Connection conn, PreparedStatement ps, ResultSet rs){
		try {
			if(rs!=null) {
				rs.close();
			}
		} catch (SQLException e) {
			System.out.println("ResultSet 객체 닫기 실패: "+e);
		}
		try {
			if(ps!=null) {
				ps.close();
			}
		} catch (SQLException e) {
			System.out.println("PreparedStatement 객체 닫기 실패: "+e);
		}
		try {
			if(conn!=null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("Connection 객체 닫기 실패: "+e);
		}
	}
	
}
