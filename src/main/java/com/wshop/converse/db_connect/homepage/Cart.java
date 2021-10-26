package com.wshop.converse.db_connect.homepage;

import java.text.DecimalFormat;
import java.util.List;

import com.wshop.converse.db_connect.Product;
import com.wshop.converse.db_connect.User;

public class Cart{
//	private int cartId;
//	private User user;
	private List<CartItem> item;
	private int total;
	private boolean status;
	private int tic;
	
	public Cart() {
		super();
	}
	public Cart( List<CartItem> item, boolean status) {
		super();
//		this.cartId = cartId;
//		this.user = user;
		this.item = item;
		this.status = status;
	}
//	public int getCartId() {
//		return cartId;
//	}
//	public void setCartId(int cartId) {
//		this.cartId = cartId;
//	}
//	public User getUser() {
//		return user;
//	}
//	public void setUser(User user) {
//		this.user = user;
//	}
	public List<CartItem> getItem() {
		return item;
	}
	public void setItem(List<CartItem> item) {
		this.item = item;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	public int getTotal() {
		total = 0;
		for (CartItem cartItem : item) {
			total = total + cartItem.getPrice()*cartItem.getQuantity();
		}
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
	public int getTic() {
		tic = 0;
		for (CartItem cartItem : item) {
			tic = tic + cartItem.getQuantity();
		}
		return tic;
	}
	public String currency(int numb) {
		DecimalFormat format = new DecimalFormat("###,###,###");
		String currency = format.format(numb);
		return currency;
	}
}
