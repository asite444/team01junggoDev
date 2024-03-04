package vo;

public class CategoryVo {
	
	int c_idx;
	String c_name;
	int c_code;
	
	
	public CategoryVo() {
		// TODO Auto-generated constructor stub
	}

	
	

	public CategoryVo(int c_idx, String c_name, int c_code) {
		super();
		this.c_idx = c_idx;
		this.c_name = c_name;
		this.c_code = c_code;
	}




	public int getC_idx() {
		return c_idx;
	}


	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}


	public String getC_name() {
		return c_name;
	}


	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	public int getC_code() {
		return c_code;
	}


	public void setC_code(int c_code) {
		this.c_code = c_code;
	}
	
	

}
