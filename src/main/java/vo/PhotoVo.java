package vo;

public class PhotoVo {

	int    p_idx;
	String p_subject;
	String p_content;
	String p_filename;
	String p_filename1;
	String p_filename2;
	String p_filename3;
	String p_ip;
	String p_regdate;
	String p_modifydate;
	int    mem_idx;
	String mem_name;
	int 	b_readhit;	
	int     no;
	int 	cmt_count;
	
	
	public PhotoVo() {
		// TODO Auto-generated constructor stub
	}

	
	

	public PhotoVo(String p_subject, String p_content, String p_filename, String p_ip, int mem_idx, String mem_name) {
		super();
		this.p_subject = p_subject;
		this.p_content = p_content;
		this.p_filename = p_filename;
		this.p_ip = p_ip;
		this.mem_idx = mem_idx;
		this.mem_name = mem_name;
	}




	public int getP_idx() {
		return p_idx;
	}


	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
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


	public int getMem_idx() {
		return mem_idx;
	}


	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public int getB_readhit() {
		return b_readhit;
	}


	public void setB_readhit(int b_readhit) {
		this.b_readhit = b_readhit;
	}



	
	
	
	
	
}
