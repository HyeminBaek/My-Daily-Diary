package myDiary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class DiaryDAO {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/sys?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	private static final String USER ="root";
	private static final String PWD="root";
	
	//생성자
	public DiaryDAO() {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("DiaryDAO 객체 생성 실패: "+e);
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
	
	//일기 정보 테이블에 추가
	public int insertDiary(DiaryDTO diary) {
		int ok =0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "insert into diary values(?,?,?)";
		
		try {
			conn = getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1,diary.getId());
			ps.setTimestamp(2,diary.getRegDate());
			ps.setString(3,diary.getContent());
			
			ok = ps.executeUpdate(); 
		} catch (Exception e) {
			System.out.println("일기 기록하기 실패: "+e);
		} finally {
			close(conn,ps);
		}
		
		return ok;
	}
	//read
	public DiaryDTO diaryRead(String id,Timestamp date) {
		DiaryDTO dto = new DiaryDTO();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//date_format(date,'%Y%m%d')
		String sql = "SELECT content FROM diary WHERE id=? and date_format(date,'%Y%m%d')=?";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			String parseDate = simpleDateFormat.format(date);
			ps.setString(2, parseDate);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String content = rs.getString("content");

				dto.setId(id);
				dto.setRegDate(date);
				dto.setContent(content);
			}
			System.out.println(dto);
		} catch(Exception e) {
			System.out.println("일기 불러오기 실패: "+e);
		} finally {
			close(conn,ps,rs);
		}
		return dto;
	}
	
	//update
	public int updateDiary(DiaryDTO dto) {
		int ok =0;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update diary set content=? where id=? and date=?";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getContent());
			ps.setString(2, dto.getId());
			ps.setTimestamp(3, dto.getRegDate());
			
			ok = ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("일기 수정 실패: "+e);
		} finally {
			close(conn,ps);
		}
		return ok;
	}
	//delete
	public int deleteDiary(Timestamp date) {
		int ok = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "delete from diary where date=?";
		
		try {
			conn=getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setTimestamp(1, date);
			
			ok = ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("일기 삭제 실패: "+e);
		} finally {
			close(conn,ps);
		}
		
		return ok;
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
