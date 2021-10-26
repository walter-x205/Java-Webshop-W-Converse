package com.wshop.converse.db_connect.homepage;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;

public class Payment {
	private String id;
	private int customerId;
	private int amount;
	private String payment;
	private String paymentName;
	private String paymentAddress;
	private String paymentPhone;
	private String security;
	private int status;
	private Date createdDate;
	private ArrayList<String> showOrders;
	
	
	public Payment() {
		super();
	}


	public Payment(String id, int customerId, int amount, String payment, String paymentName, String paymentAddress,
			String paymentPhone, String security, int status, Date createdDate) {
		super();
		this.id = id;
		this.customerId = customerId;
		this.amount = amount;
		this.payment = payment;
		this.paymentName = paymentName;
		this.paymentAddress = paymentAddress;
		this.paymentPhone = paymentPhone;
		this.security = security;
		this.status = status;
		this.createdDate = createdDate;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getPayment() {
		return payment;
	}


	public void setPayment(String payment) {
		this.payment = payment;
	}


	public String getPaymentName() {
		return paymentName;
	}


	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}


	public String getPaymentAddress() {
		return paymentAddress;
	}


	public void setPaymentAddress(String paymentAddress) {
		this.paymentAddress = paymentAddress;
	}


	public String getPaymentPhone() {
		return paymentPhone;
	}


	public void setPaymentPhone(String paymentPhone) {
		this.paymentPhone = paymentPhone;
	}


	public String getSecurity() {
		return security;
	}


	public void setSecurity(String security) {
		this.security = security;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	public ArrayList<String> getShowOrders() {
		return showOrders;
	}


	public void setShowOrders(ArrayList<String> showOrders) {
		this.showOrders = showOrders;
	}


	@Override
	public String toString() {
		return "Payment [id=" + id + ", customerId=" + customerId + ", amount=" + amount + ", payment=" + payment
				+ ", paymentName=" + paymentName + ", paymentAddress=" + paymentAddress + ", paymentPhone="
				+ paymentPhone + ", security=" + security + ", status=" + status + ", createdDate=" + createdDate + "]";
	}

	public String currency(int numb) {
		DecimalFormat format = new DecimalFormat("###,###,###");
		String currency = format.format(numb);
		return currency;
	}
	
	
	
}
