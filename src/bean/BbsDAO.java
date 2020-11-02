package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private PreparedStatement pstmt;
	private ResultSet rs;
	Connection con;
	DBConnectionMgr dbcp;

	public BbsDAO() {
		try {
			dbcp = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("����");
		}
	}

	public String getDate() throws Exception {
		con = dbcp.getConnection();
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dbcp.freeConnection(con, pstmt, rs);
		return ""; // ������ ���ڿ�
	}

	// ********************//[메서드]기준주석달기//한줄주석달기********************************
	public int getNext() throws Exception { // 게시물번호설정 getNext
		// write메소드에서 String bbsTitle , String bbsContent Insert할때 목록번호인 bbsID를 auto로
		// 자동증가
		// 설정을 하지않았기 때문에 번호를 부여하기위해서 getNext메소드를 만듦
		con = dbcp.getConnection(); // db연결 dbcp.getConnection
		String SQL = "SELECT bbsID FROM bbs ORDER BY bbsID DESC"; // 내림차순 : 역순으로 번호생성하기때문에 [ DESC ] //ORDER BY COLUME
																	// DESC
		// 게시물번호 10 9 8 7 6 5 4 3 2 [ 1부터 시작 ]
		// 오름차순 ASC로 할경우 높은수부터 번호가 생성되어야 하기때문에
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL); // conn : connection객체 conn.prepareStatment pstmt [
																	// 연결상태 ]
			rs = pstmt.executeQuery(); // 쿼리실행을 rs로 넘김 연결된객체를쿼리실행으로 rs객체만듦
			if (rs.next()) { // rs실행되었을때 true일때
				return rs.getInt(1) + 1; // +1씩 증가

			}
			return 1; // 성공시 결과값 1이 반환 // test시 '1'값이 나오면 성공
		} catch (Exception e) {// 실패시 예외처리 하는 부분
			e.printStackTrace();
		}
		dbcp.freeConnection(con, pstmt, rs); // 연결끊음
		return -1; // ������ 1������ ǥ�� //return -1
	}

	public int write(String bbsTitle, /* String id_user, */ String bbsContent) throws Exception {
		con = dbcp.getConnection();
		String SQL = "INSERT INTO bbs VALUES (?,?,?,?,?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);

			pstmt.setInt(1, getNext()); // 메소드로 값을 가져옴
			pstmt.setString(2, bbsTitle); // write
			/* pstmt.setString(3, id_user); */
			pstmt.setString(3, getDate()); // 메소드로 값을 가져옴
			pstmt.setString(4, bbsContent); // write
			pstmt.setInt(5, 1); // ������ 0 //값을 1로 바로 입력 bbsAvailable
			return pstmt.executeUpdate(); // Insert [ set[get] ]
		} catch (Exception e) {
			e.printStackTrace();
		}
		dbcp.freeConnection(con, pstmt, rs);
		return -1; // dao.jsp
	}

	// Bbs[vo]를 ArrayList로 저장 //pageNumber getList로 저장 ////pageNumber는
	// boardform.jsp에 int pageNumber = 1; 초기값설정되어있음
	public ArrayList<Bbs> getList(int pageNumber) throws Exception {// 읽기 //vo에 담은것을 dao처리
		con = dbcp.getConnection();
		String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		// bbsID가 getNext메소드로 부여받게되는수 가 얼마인지는 모르지만 ?보다 작고 AND bbsAvailable 이 '1'일때
		// bbsID기준으로 ID : 10개까지 내림차순으로 게시판 목록에 정렬한다
		ArrayList<Bbs> list = new ArrayList<Bbs>(); // ArrayList에 담은 Bbs[vo]를 list객체로 생성한다
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); // getNext는 BbsID번호 부여 메소드 //pageNumber = 1 초기
			// pageNumber가 1개이상 생성될경우 pageNumber가 2가 면
			rs = pstmt.executeQuery();
			// setInt가 생기면 rs로 넘겨받음
			while (rs.next()) { // while문으로 db에 저장된 목록을 rs로 받아서 반복 생성
				Bbs bbs = new Bbs(); // Bbs[vo] 만듦
				bbs.setBbsID(rs.getInt(1));// getNext : 목록번호생성 //입력받은값을 bbs[vo]로 저장
				bbs.setBbsTitle(rs.getString(2)); /* �ε����Ǽ��������� */
				bbs.setBbsDate(rs.getString(3)); // getDate : 날짜
				bbs.setBbsContent(rs.getString(4));
				bbs.setBbsAvailable(rs.getInt(5));
				list.add(bbs);// 입력받아 bbs로 저장한것을 list객체로 넘김 //위에 객체생성 되어있음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dbcp.freeConnection(con, pstmt, rs);
		return list; // list 반환
	}

	// boardform.jsp //페이지 [다음 : 이전] 설정 //
	public boolean nextPage(int pageNumber) throws Exception {// pageNumber는 boardform.jsp에 int pageNumber = 1;
																// 초기값설정되어있음
		con = dbcp.getConnection();
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dbcp.freeConnection(con, pstmt, rs);
		return false;
	}

	public Bbs getBbs(int bbsID) throws Exception {
		  con = dbcp.getConnection();
	      String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
	      Bbs bbs = new Bbs();
	      try {
		      PreparedStatement pstmt = con.prepareStatement(SQL);
		      pstmt.setInt(1, bbsID);
		      rs = pstmt.executeQuery();
		      if(rs.next()) {
		            bbs.setBbsID(rs.getInt(1));
		            bbs.setBbsTitle(rs.getString(2)); /* 인덱스실수하지말자 */
		            bbs.setBbsDate(rs.getString(3));
		            bbs.setBbsContent(rs.getString(4));
		      }
		      dbcp.freeConnection(con, pstmt, rs);
	      }catch(Exception e){
	         e.printStackTrace();
	      }//catch
		return bbs;
	   }
}
