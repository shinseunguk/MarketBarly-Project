package bean;

public class UserVO {
	String id_user; //아이디
	String pw_user; //비밀번호
	String name_user; //이름
	String email_user; //이메일
	String tel_user; //전화번호
	String user_postcode; //우편번호
	String user_address; //주소
	String user_detailAddress; //상세주소
	String user_extraAddress; //참고항목
	String birth_year; //생년 
	String birth_month; //월
	String birth_day; //일
	public String getId_user() {
		return id_user;
	}
	public String getUser_postcode() {
		return user_postcode;
	}
	public void setUser_postcode(String user_postcode) {
		this.user_postcode = user_postcode;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_detailAddress() {
		return user_detailAddress;
	}
	public void setUser_detailAddress(String user_detailAddress) {
		this.user_detailAddress = user_detailAddress;
	}
	public String getUser_extraAddress() {
		return user_extraAddress;
	}
	public void setUser_extraAddress(String user_extraAddress) {
		this.user_extraAddress = user_extraAddress;
	}
	public void setId_user(String id_user) {
		this.id_user = id_user;
	}
	public String getPw_user() {
		return pw_user;
	}
	public void setPw_user(String pw_user) {
		this.pw_user = pw_user;
	}
	public String getName_user() {
		return name_user;
	}
	public void setName_user(String name_user) {
		this.name_user = name_user;
	}
	public String getBirth_year() {
		return birth_year;
	}
	public void setBirth_year(String birth_year) {
		this.birth_year = birth_year;
	}
	public String getBirth_month() {
		return birth_month;
	}
	public void setBirth_month(String birth_month) {
		this.birth_month = birth_month;
	}
	public String getBirth_day() {
		return birth_day;
	}
	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}
	public String getEmail_user() {
		return email_user;
	}
	public void setEmail_user(String email_user) {
		this.email_user = email_user;
	}
	public String getTel_user() {
		return tel_user;
	}
	public void setTel_user(String tel_user) {
		this.tel_user = tel_user;
	}
}
