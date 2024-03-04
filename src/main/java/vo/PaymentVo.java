package vo;

public class PaymentVo {
private int	pay_idx;
private int user_idx;
private int cart_idx;
private String pay_zipcode;

private String pay_addr;

private String user_name;
private int p_idx;
private String p_name;
private String pro_image;
private String sell_user_name;
private int p_total_amount;
private int amount_appr;
private String card_type;
private String card_number;
private String payment_date;
private int order_number;

/**
 * 기능없음
 */
public PaymentVo() {}

/**인서트
 * @param user_idx
 * @param cart_idx
 * @param pay_zipcode
 * @param pay_addr
 * @param user_name
 * @param p_idx
 * @param p_name
 * @param pro_image
 * @param sell_user_name
 * @param p_total_amount
 * @param amount_appr
 * @param card_type
 * @param card_number
 * @param order_number
 */
public PaymentVo(int user_idx, int cart_idx, String pay_zipcode, String pay_addr, String user_name, int p_idx,
		String p_name, String pro_image, String sell_user_name, int p_total_amount, int amount_appr, String card_type,
		String card_number, int order_number) {
	this.user_idx = user_idx;
	this.cart_idx = cart_idx;
	this.pay_zipcode = pay_zipcode;
	this.pay_addr = pay_addr;
	this.user_name = user_name;
	this.p_idx = p_idx;
	this.p_name = p_name;
	this.pro_image = pro_image;
	this.sell_user_name = sell_user_name;
	this.p_total_amount = p_total_amount;
	this.amount_appr = amount_appr;
	this.card_type = card_type;
	this.card_number = card_number;
	this.order_number = order_number;
}
public int getPay_idx() {
	return pay_idx;
}
public void setPay_idx(int pay_idx) {
	this.pay_idx = pay_idx;
}
public int getUser_idx() {
	return user_idx;
}
public void setUser_idx(int user_idx) {
	this.user_idx = user_idx;
}
public int getCart_idx() {
	return cart_idx;
}
public void setCart_idx(int cart_idx) {
	this.cart_idx = cart_idx;
}
public String getPay_zipcode() {
	return pay_zipcode;
}
public void setPay_zipcode(String pay_zipcode) {
	this.pay_zipcode = pay_zipcode;
}
public String getPay_addr() {
	return pay_addr;
}
public void setPay_addr(String pay_addr) {
	this.pay_addr = pay_addr;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public int getP_idx() {
	return p_idx;
}
public void setP_idx(int p_idx) {
	this.p_idx = p_idx;
}
public String getP_name() {
	return p_name;
}
public void setP_name(String p_name) {
	this.p_name = p_name;
}
public String getPro_image() {
	return pro_image;
}
public void setPro_image(String pro_image) {
	this.pro_image = pro_image;
}
public String getSell_user_name() {
	return sell_user_name;
}
public void setSell_user_name(String sell_user_name) {
	this.sell_user_name = sell_user_name;
}
public int getP_total_amount() {
	return p_total_amount;
}
public void setP_total_amount(int p_total_amount) {
	this.p_total_amount = p_total_amount;
}
public int getAmount_appr() {
	return amount_appr;
}
public void setAmount_appr(int amount_appr) {
	this.amount_appr = amount_appr;
}
public String getCard_type() {
	return card_type;
}
public void setCard_type(String card_type) {
	this.card_type = card_type;
}
public String getCard_number() {
	return card_number;
}
public void setCard_number(String card_number) {
	this.card_number = card_number;
}
public String getPayment_date() {
	return payment_date;
}
public void setPayment_date(String payment_date) {
	this.payment_date = payment_date;
}
public int getOrder_number() {
	return order_number;
}
public void setOrder_number(int order_number) {
	this.order_number = order_number;
}




}
