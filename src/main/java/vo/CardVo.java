package vo;

public class CardVo {
	private int card_serialno;
	private String card_num;
	private String card_comp;
	private String card_name;
	private int mem_idx;
	private String card_type;
	
	
	
	public String getCard_type() {
		return card_type;
	}

	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}

	public int getCard_serialno() {
		return card_serialno;
	}

	public void setCard_serialno(int card_serialno) {
		this.card_serialno = card_serialno;
	}

	public String getCard_num() {
		return card_num;
	}

	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}

	public String getCard_comp() {
		return card_comp;
	}

	public void setCard_comp(String card_comp) {
		this.card_comp = card_comp;
	}

	public String getCard_name() {
		return card_name;
	}

	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}

	public int getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}

}
