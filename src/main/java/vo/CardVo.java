package vo;

/**
 * 크레딧 카드 vo
 */
public class CardVo {
private int	card_idx;
private int user_idx;
private String card_number;
private String card_holder_name;
private String card_nickname;
private String expiration_date;
private int cvv;
private String card_bank;
private String card_type;
private String card_category;
private String regist_date;

/**
 * 기능없음
 */
public CardVo() {}


/** 카드 등록 생성자
 * @param user_idx
 * @param card_number
 * @param card_holder_name
 * @param card_nickname
 * @param expiration_date
 * @param cvv
 * @param card_bank
 * @param card_type
 * @param card_category
 */
public CardVo(int user_idx, String card_number, String card_holder_name, String card_nickname, String expiration_date,
		int cvv, String card_bank, String card_type, String card_category) {
	this.user_idx = user_idx;
	this.card_number = card_number;
	this.card_holder_name = card_holder_name;
	this.card_nickname = card_nickname;
	this.expiration_date = expiration_date;
	this.cvv = cvv;
	this.card_bank = card_bank;
	this.card_type = card_type;
	this.card_category = card_category;
}
public int getCard_idx() {
	return card_idx;
}
public void setCard_idx(int card_idx) {
	this.card_idx = card_idx;
}
public int getUser_idx() {
	return user_idx;
}
public void setUser_idx(int user_idx) {
	this.user_idx = user_idx;
}
public String getCard_number() {
	return card_number;
}
public void setCard_number(String card_number) {
	this.card_number = card_number;
}
public String getCard_holder_name() {
	return card_holder_name;
}
public void setCard_holder_name(String card_holder_name) {
	this.card_holder_name = card_holder_name;
}
public String getCard_nickname() {
	return card_nickname;
}
public void setCard_nickname(String card_nickname) {
	this.card_nickname = card_nickname;
}
public String getExpiration_date() {
	return expiration_date;
}
public void setExpiration_date(String expiration_date) {
	this.expiration_date = expiration_date;
}
public int getCvv() {
	return cvv;
}
public void setCvv(int cvv) {
	this.cvv = cvv;
}
public String getCard_bank() {
	return card_bank;
}
public void setCard_bank(String card_bank) {
	this.card_bank = card_bank;
}
public String getCard_type() {
	return card_type;
}
public void setCard_type(String card_type) {
	this.card_type = card_type;
}
public String getCard_category() {
	return card_category;
}
public void setCard_category(String card_category) {
	this.card_category = card_category;
}
public String getRegist_date() {
	return regist_date;
}
public void setRegist_date(String regist_date) {
	this.regist_date = regist_date;
}


}
