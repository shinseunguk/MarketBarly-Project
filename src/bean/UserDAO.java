package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.DBConnectionMgr;

public class UserDAO {

	DBConnectionMgr dbcp;
	Connection con;

	public UserDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
		System.out.println("2. db 연결 성공.!!");
	}

	// 회원가입
	public boolean create(UserVO vo) throws Exception {// main이 없을시 실행이 안되므로 db 연결 확인을
		con = dbcp.getConnection();
		String sql = "insert into user_barly values (?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, vo.getId_user());
		ps.setString(2, vo.getPw_user());
		ps.setString(3, vo.getName_user());
		ps.setString(4, vo.getEmail_user());
		ps.setString(5, vo.getTel_user());
		ps.setString(6, vo.getUser_postcode());
		ps.setString(7, vo.getUser_address());
		ps.setString(8, vo.getUser_detailAddress());
		ps.setString(9, vo.getUser_extraAddress());
		ps.setString(10, vo.getBirth_year());
		ps.setString(11, vo.getBirth_month());
		ps.setString(12, vo.getBirth_day());
		System.out.println("3. 회원가입 sql 생성 성공.!!");

		int row = ps.executeUpdate();
		System.out.println("4. 회원가입 sql문 전송 성공.!!");
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		dbcp.freeConnection(con, ps);
		return result;
	}

	// 로그인
	public boolean login(String id_user, String pw_user) throws Exception {
		con = dbcp.getConnection();
		String sql = "select * from user_barly where id_user = ? and pw_user = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id_user);
		ps.setString(2, pw_user);
		System.out.println("3. 로그인 sql 생성 성공.!!");

		ResultSet rs = ps.executeQuery();
		System.out.println("4. 로그인 sql문 전송 성공.!!");
		boolean result = false;// 로그인이 아닌 상태.
		if (rs.next() == true) {// 결과가 있는지 없는지 체크해주는 메서드
			System.out.println("로그인 ok.");
			result = true;// 있음.
		} else {
			System.out.println("로그인 not.");
		}
		dbcp.freeConnection(con, ps, rs);
		return result;
		// false면 로그인 not.
		// true면 로그인 ok.
	}
	
	// 로그인
	public int loginCheck(String id_user, String pw_user) throws Exception {
		con = dbcp.getConnection();
		String sql = "select * from user_barly where id_user = ? and pw_user = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id_user);
		ps.setString(2, pw_user);
		System.out.println("3. 로그인 sql 생성 성공.!!");

		ResultSet rs = ps.executeQuery();
		System.out.println("4. 아이디 sql문 전송 성공.!!");
		int result = 0;// 없음
		if (rs.next() == true) {// 결과가 있는지 없는지 체크해주는 메서드
			System.out.println("아이디 비번  ok1.");
			result = 1;// 확인.
		} else {
			System.out.println("아이디 비번 not0.");
		}
		dbcp.freeConnection(con, ps, rs);
		return result;
		// false면 로그인 not.
		// true면 로그인 ok.
	}

	// id 중복 체크 용
	public int idCheck(String id_user) throws Exception {
		con = dbcp.getConnection();
		String sql = "select * from user_barly where id_user =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id_user);
		System.out.println("3. id 중복 체크 sql 생성 성공.!!");
		ResultSet rs = ps.executeQuery();
		System.out.println("4. id 중복 체크 sql문 전송 성공.!!");
		int result = 1;
		if (rs.next()) {// 결과가 있는지 없는지 체크해주는 메서드
			System.out.println("id 중복 체크 검색결과가 있어요.");
			result = 0;// 결과가 있음.
			String id_user2 = rs.getString("id_user");
//				String pw = rs.getString("pw");
//				String name = rs.getString("name");
//				String tel = rs.getString("tel");
			System.out.println("검색결과 id:" + id_user2);
//				System.out.println("검색결과 pw:" + pw);
//				System.out.println("검색결과 name:" + name);
//				System.out.println("검색결과 tel:" + tel);
		} else {
			System.out.println("id 중복 체크 검색결과가 없어요.");
		}
		dbcp.freeConnection(con, ps, rs);
		return result;
		// 0이 넘어가면, 검색결과가 없음.
		// 1이 넘어가면, 검색결과가 있음.
	}
	
	// 회원의 정보 이름과 이이메일 확인 후 맞으면 이메일로 아이디 전송
		public UserVO nameEmailCheck(String name_user, String email_user) throws Exception {
			con = dbcp.getConnection();
			String sql = "select * from user_barly where name_user = ? and email_user = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name_user);
			ps.setString(2, email_user);
			System.out.println("3. 아이디 검색 sql 생성 성공.!!");

			ResultSet rs = ps.executeQuery();
			System.out.println("4. 아이디 검색 sql문 전송 성공.!!");
			UserVO bag = new UserVO();// 3.묶음 값을 꺼내주기 위해 객체 생성.
			if (rs.next() == true) {
				System.out.println("아이디 검색 검색결과가 있어요.");
				// 4.쿼리를 통해 DB에서 받은 값을
				String id_user2 = rs.getString("id_user");
				String name_user2 = rs.getString("name_user");
				String email_user2 = rs.getString("email_user");
				// 5. UserVO 클래스를 통해 가방에 넣기
				bag.setId_user(id_user2);
				bag.setName_user(name_user);
				bag.setEmail_user(email_user);
			} else {
				System.out.println("아이디 검색 검색결과가 없어요.");
			}
			dbcp.freeConnection(con, ps, rs);
			return bag;
		}

	// 아이디 수정전 검색하여 데이터 불러오기
	public UserVO one(String id_user) throws Exception {
		con = dbcp.getConnection();
		String sql = "select * from user_barly where id_user=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id_user);
		System.out.println("3. 아이디 수정을 위한 검색 sql 생성 성공.!!");

		ResultSet rs = ps.executeQuery();
		System.out.println("4. 아이디 수정을 위한 검색 sql문 전송 성공.!!");
		UserVO bag = new UserVO();// 3.묶음 값을 꺼내주기 위해 객체 생성.
		if (rs.next() == true) {
			System.out.println("검색결과가 있어요.");
			// 4.쿼리를 통해 DB에서 받은 값을
			String id_user2 = rs.getString("id_user");
			String pw_user = rs.getString("pw_user");
			String name_user = rs.getString("name_user");
			String tel_user = rs.getString("tel_user");
			String email_user = rs.getString("email_user");
			String user_postcode = rs.getString("user_postcode");
			String user_address = rs.getString("user_address");
			String user_detailAddress = rs.getString("user_detailAddress");
			String user_extraAddress = rs.getString("User_extraAddress");
			String birth_year = rs.getString("birth_year");
			String birth_month = rs.getString("birth_month");
			String birth_day = rs.getString("birth_day");
			// 5. UserVO 클래스를 통해 가방에 넣기
			bag.setId_user(id_user2);
			bag.setPw_user(pw_user);
			bag.setName_user(name_user);
			bag.setEmail_user(email_user);
			bag.setTel_user(tel_user);
			bag.setUser_postcode(user_postcode);
			bag.setUser_address(user_address);
			bag.setUser_detailAddress(user_detailAddress);
			bag.setUser_extraAddress(user_extraAddress);
			bag.setBirth_year(birth_year);
			bag.setBirth_month(birth_month);
			bag.setBirth_day(birth_day);
		} else {
			System.out.println("검색결과가 없어요.");
		}
		dbcp.freeConnection(con, ps, rs);
		// 6.bag은 참조형 변수에 넣은 값, 주소를 전달!
		return bag;// 7.userUpdate에 전달.
	}

	// 아이디 수정
	public boolean update(UserVO vo) throws Exception {
		con = dbcp.getConnection();
		String sql = "update user_barly set pw_user=?, name_user=?, email_user=?, tel_user=?, user_postcode=?, "
				+ "user_address=?, user_detailAddress=?, user_extraAddress=?, birth_year=?, birth_month=?, birth_day=? where id_user=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, vo.getPw_user());
		ps.setString(2, vo.getName_user());
		ps.setString(3, vo.getEmail_user());
		ps.setString(4, vo.getTel_user());
		ps.setString(5, vo.getUser_postcode());
		ps.setString(6, vo.getUser_address());
		ps.setString(7, vo.getUser_detailAddress());
		ps.setString(8, vo.getUser_extraAddress());
		ps.setString(9, vo.getBirth_year());
		ps.setString(10, vo.getBirth_month());
		ps.setString(11, vo.getBirth_day());
		ps.setString(12, vo.getId_user());
		System.out.println("3. 아이디 수정 sql 생성 성공.!!");
		int row = ps.executeUpdate();
		System.out.println("4. 아이디 수정 sql문 전송 성공.!!");
		dbcp.freeConnection(con, ps);
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		return result;
	}
	
	// 비번찾기에서 비밀번호를 임시 비밀번호로 수정
	public boolean updatePw(UserVO vo, String temPw) throws Exception {
		con = dbcp.getConnection();
		String sql = "update user_barly set pw_user=? where id_user=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, temPw);
		ps.setString(2, vo.getId_user());
		System.out.println("3. 임시 비번 sql 생성 성공.!!");
		int row = ps.executeUpdate();
		System.out.println("4. 임시 비번 sql문 전송 성공.!!");
		dbcp.freeConnection(con, ps);
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		return result;
	}
	
	// 회원탈퇴
		public boolean delete(String id_user, String pw_user) throws Exception {
			con = dbcp.getConnection();
			// db에 있는 데이터를 삭제하기 위한 sql 명령문
			String sql = "delete from user_barly where id_user = ? and pw_user = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			// UI에서 받은 파라미터값을 받기 위한 설정.
			ps.setString(1, id_user);
			ps.setString(2, pw_user);
			// sql생성 확인용 출력
			System.out.println("3. 삭제 sql 생성 성공.!!");
			// sql문 전송
			int row = ps.executeUpdate();
			// sql문 전송 확인용 출력
			System.out.println("4. 삭제 sql문 전송 성공.!!");
			dbcp.freeConnection(con, ps);
			boolean result = false;
			if (row == 1) {
				result = true;
			}
			return result;
		}

}
