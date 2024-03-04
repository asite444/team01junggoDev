package vo;

public class ProductVo {

	int    p_idx;
	int    c_idx;
	int    user_idx;
	
	String p_name;
	int p_price;
	String p_nego;
	String p_deal;
	String p_local;
	String p_company;
	
	String p_subject;
	String p_content;
	String p_filename;
	String p_filename1;
	String p_filename2;
	String p_filename3;
	String p_ip;
	int 	p_hit;	
	String p_status;
	String p_regdate;
	String p_modifydate;
	
	int     no;
	int 	cmt_count;
	
	
	public ProductVo() {
		// TODO Auto-generated constructor stub
	}

	
	public ProductVo( int c_idx, int user_idx, String p_name, int p_price, String p_nego, String p_deal,
			String p_local, String p_company, String p_subject, String p_content, String p_filename, String p_filename1,
			String p_filename2, String p_filename3, String p_ip, int p_hit, String p_status) {
		super();
		
		this.c_idx = c_idx;
		this.user_idx = user_idx;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_nego = p_nego;
		this.p_deal = p_deal;
		this.p_local = p_local;
		this.p_company = p_company;
		this.p_subject = p_subject;
		this.p_content = p_content;
		this.p_filename = p_filename;
		this.p_filename1 = p_filename1;
		this.p_filename2 = p_filename2;
		this.p_filename3 = p_filename3;
		this.p_ip = p_ip;
		this.p_hit = p_hit;
		this.p_status = p_status;
	}




	public int getP_idx() {
		return p_idx;
	}


	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}


	public int getC_idx() {
		return c_idx;
	}


	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}


	public int getUser_idx() {
		return user_idx;
	}


	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public int getP_price() {
		return p_price;
	}


	public void setP_price(int p_price) {
		this.p_price = p_price;
	}


	public String getP_nego() {
		return p_nego;
	}


	public void setP_nego(String p_nego) {
		this.p_nego = p_nego;
	}


	public String getP_deal() {
		return p_deal;
	}


	public void setP_deal(String p_deal) {
		this.p_deal = p_deal;
	}


	public String getP_local() {
		return p_local;
	}


	public void setP_local(String p_local) {
		this.p_local = p_local;
	}


	public String getP_company() {
		return p_company;
	}


	public void setP_company(String p_company) {
		this.p_company = p_company;
	}


	public String getP_subject() {
		return p_subject;
	}


	public void setP_subject(String p_subject) {
		this.p_subject = p_subject;
	}


	public String getP_content() {
		return p_content;
	}


	public void setP_content(String p_content) {
		this.p_content = p_content;
	}


	public String getP_filename() {
		return p_filename;
	}


	public void setP_filename(String p_filename) {
		this.p_filename = p_filename;
	}


	public String getP_filename1() {
		return p_filename1;
	}


	public void setP_filename1(String p_filename1) {
		this.p_filename1 = p_filename1;
	}


	public String getP_filename2() {
		return p_filename2;
	}


	public void setP_filename2(String p_filename2) {
		this.p_filename2 = p_filename2;
	}


	public String getP_filename3() {
		return p_filename3;
	}


	public void setP_filename3(String p_filename3) {
		this.p_filename3 = p_filename3;
	}


	public String getP_ip() {
		return p_ip;
	}


	public void setP_ip(String p_ip) {
		this.p_ip = p_ip;
	}


	public int getP_hit() {
		return p_hit;
	}


	public void setP_hit(int p_hit) {
		this.p_hit = p_hit;
	}


	public String getP_status() {
		return p_status;
	}


	public void setP_status(String p_status) {
		this.p_status = p_status;
	}


	public String getP_regdate() {
		return p_regdate;
	}


	public void setP_regdate(String p_regdate) {
		this.p_regdate = p_regdate;
	}


	public String getP_modifydate() {
		return p_modifydate;
	}


	public void setP_modifydate(String p_modifydate) {
		this.p_modifydate = p_modifydate;
	}
	

	
	
	


	
	








	
	
	
	
	
}
