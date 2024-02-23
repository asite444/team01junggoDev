package vo;

/**
 * 장바구니 VO
 */
public class CartVo {

private int	cart_idx;
private int user_idx;
private int prod_idx;
private int prod_count;
private String p_subject;
private int sell_user_idx;
private int p_price;
private String  p_status;
private String sell_user_name;

public int getCart_idx() {
	return cart_idx;
}
public void setCart_idx(int cart_idx) {
	this.cart_idx = cart_idx;
}
public int getUser_idx() {
	return user_idx;
}
public void setUser_idx(int user_idx) {
	this.user_idx = user_idx;
}
public int getProd_idx() {
	return prod_idx;
}
public void setProd_idx(int prod_idx) {
	this.prod_idx = prod_idx;
}
public int getProd_count() {
	return prod_count;
}
public void setProd_count(int prod_count) {
	this.prod_count = prod_count;
}
public String getP_subject() {
	return p_subject;
}
public void setP_subject(String p_subject) {
	this.p_subject = p_subject;
}
public int getSell_user_idx() {
	return sell_user_idx;
}
public void setSell_user_idx(int sell_user_idx) {
	this.sell_user_idx = sell_user_idx;
}
public int getP_price() {
	return p_price;
}
public void setP_price(int p_price) {
	this.p_price = p_price;
}
public String getP_status() {
	return p_status;
}
public void setP_status(String p_status) {
	this.p_status = p_status;
}
public String getSell_user_name() {
	return sell_user_name;
}
public void setSell_user_name(String sell_user_name) {
	this.sell_user_name = sell_user_name;
}




}
