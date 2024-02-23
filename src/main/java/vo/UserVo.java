package vo;

public class UserVo {
	
	int    user_idx;
	String user_name;
	String user_id;
	String user_pwd;
	String user_email;
	String user_zipcode;
	String user_addr;
	String user_ip;
	String user_regdate;
	String user_modifydate;
	String user_grade;
	
	
	public UserVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	//insert
	public UserVo(String user_name, String user_id, String user_pwd, String user_email, String user_zipcode,
			String user_addr, String user_ip) {
		super();
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_email = user_email;
		this.user_zipcode = user_zipcode;
		this.user_addr = user_addr;
		this.user_ip = user_ip;
	}
	

	//update
	public UserVo(int user_idx, String user_name, String user_id, String user_pwd, String user_email,
			String user_zipcode, String user_addr, String user_ip, String user_grade) {
		super();
		this.user_idx = user_idx;
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_email = user_email;
		this.user_zipcode = user_zipcode;
		this.user_addr = user_addr;
		this.user_ip = user_ip;
		this.user_grade = user_grade;
	}
	


	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_zipcode() {
		return user_zipcode;
	}

	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_ip() {
		return user_ip;
	}

	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}

	public String getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(String user_regdate) {
		this.user_regdate = user_regdate;
	}

	public String getUser_modifydate() {
		return user_modifydate;
	}

	public void setUser_modifydate(String user_modifydate) {
		this.user_modifydate = user_modifydate;
	}

	public String getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	






	
	
	
	
	
	
}
