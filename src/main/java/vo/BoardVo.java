package vo;


public class BoardVo {
	
	int 	b_idx;
	String 	b_subject;
	String 	b_content;
	String	b_ip;
	String	b_regdate;
	int		b_readhit;
	int		user_idx;
	String	user_name;
	int		b_ref;
	int		b_step;
	int		b_depth;
	String	b_use;
	int		no; //lank() : 글번호컬럼명
	int		cmt_count;//댓글갯수
	
	//기본 생성자
	public BoardVo() {
		// TODO Auto-generated constructor stub
	}
	
	//새글쓰기에 대한 포장
	
	
	
	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public String getB_subject() {
		return b_subject;
	}

	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_ip() {
		return b_ip;
	}

	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}

	public String getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}

	public int getB_readhit() {
		return b_readhit;
	}

	public void setB_readhit(int b_readhit) {
		this.b_readhit = b_readhit;
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

	public int getB_ref() {
		return b_ref;
	}

	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}

	public int getB_step() {
		return b_step;
	}

	public void setB_step(int b_step) {
		this.b_step = b_step;
	}

	public int getB_depth() {
		return b_depth;
	}

	public void setB_depth(int b_depth) {
		this.b_depth = b_depth;
	}

	public String getB_use() {
		return b_use;
	}

	public void setB_use(String b_use) {
		this.b_use = b_use;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCmt_count() {
		return cmt_count;
	}

	public void setCmt_count(int cmt_count) {
		this.cmt_count = cmt_count;
	}
	
	
	
	
}
