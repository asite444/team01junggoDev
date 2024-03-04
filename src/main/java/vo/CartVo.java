package vo;

/**
 * 장바구니 VO
 */
public class CartVo {

private int   cart_idx;
private int user_idx;
private int p_idx;
private int p_count;
private String p_subject;
private String p_name;
private int sell_user_idx;
private int p_price;
private String p_filename;
private String  p_status;
private String sell_user_name;
private String p_nego;

/** 위시리스트 등록 생성자
 * @param user_idx
 * @param p_idx
 * @param p_count
 */
public CartVo(int user_idx, int p_idx, int p_count) {
   this.user_idx = user_idx;
   this.p_idx = p_idx;
   this.p_count = p_count;
}



public CartVo(int cart_idx, int p_idx) {
	super();
	this.cart_idx = cart_idx;
	this.p_idx = p_idx;
}



public CartVo() {
	// TODO Auto-generated constructor stub
}
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
public int getP_idx() {
   return p_idx;
}
public void setP_idx(int p_idx) {
   this.p_idx = p_idx;
}
public int getP_count() {
   return p_count;
}
public void setP_count(int p_count) {
   this.p_count = p_count;
}
public String getP_subject() {
   return p_subject;
}
public void setP_subject(String p_subject) {
   this.p_subject = p_subject;
}
public String getP_name() {
   return p_name;
}
public void setP_name(String p_name) {
   this.p_name = p_name;
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
public String getP_filename() {
   return p_filename;
}
public void setP_filename(String p_filename) {
   this.p_filename = p_filename;
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
public String getP_nego() {
   return p_nego;
}
public void setP_nego(String p_nego) {
   this.p_nego = p_nego;
}




}