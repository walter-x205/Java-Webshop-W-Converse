package com.wshop.converse.db_connect.homepage;

public class Orders {
	private String paymentId;
	private int productId;
	private int qty;
	private int amount;
	public Orders() {
		super();
	}
	public Orders(String paymentId, int productId, int qty, int amount) {
		super();
		this.paymentId = paymentId;
		this.productId = productId;
		this.qty = qty;
		this.amount = amount;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Order [paymentId=" + paymentId + ", productId=" + productId + ", qty=" + qty
				+ ", amount=" + amount + "]";
	}
	
	
}
