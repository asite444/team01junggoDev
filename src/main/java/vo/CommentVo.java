package vo;

public class CommentVo {
	int 	cmt_idx;
	String 	cmt_content;
	String	cmt_ip;
	String	cmt_regdate;
	int		b_idx;
	int		user_idx;
	String	user_id;
	String	user_name;
	
	String 	user_mask_id;
	int 	no;
	

	//댓글 mask
	public String getUser_mask_id() {
		//user_id중 앞쪽 앞만노출시킨다. /나머지는 *** 처리
		
//		return user_id.substring(0,1) + "**";
		
		int len = user_id.length();
		int mask = Math.round(len / 2);

		return user_id.substring(0, mask) + "*".repeat(len - mask);
	}
	

	public void setUser_mask_id(String user_mask_id) {
		this.user_mask_id = user_mask_id;
	}


	//Vo에 대한 메소드를 만들어준다.
	public CommentVo() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 
	 * @param cmt_content
	 * @param cmt_ip
	 * @param b_idx
	 * @param user_idx
	 * @param user_id
	 * @param user_name
	 */
	public CommentVo(String cmt_content, String cmt_ip, int b_idx, int user_idx, String user_id, String user_name) {
		super();
		this.cmt_content = cmt_content;
		this.cmt_ip = cmt_ip;
		this.b_idx = b_idx;
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_name = user_name;
	}


	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}

	public int getCmt_idx() {
		return cmt_idx;
	}
	public void setCmt_idx(int cmt_idx) {
		this.cmt_idx = cmt_idx;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCmt_ip() {
		return cmt_ip;
	}
	public void setCmt_ip(String cmt_ip) {
		this.cmt_ip = cmt_ip;
	}
	public String getCmt_regdate() {
		return cmt_regdate;
	}
	public void setCmt_regdate(String cmt_regdate) {
		this.cmt_regdate = cmt_regdate;
	}
	public int getB_idx() {
		return b_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	
	
	
}
