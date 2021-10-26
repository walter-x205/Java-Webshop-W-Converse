package com.wshop.converse.db_connect.homepage;

import com.wshop.converse.db_connect.Product;

public class CartItem {
	private Product product;
	int quantity;
	int price;
	
	
	public CartItem() {
		super();
	}


	public CartItem(Product product, int quantity, int price) {
		super();
		this.product = product;
		this.quantity = quantity;
		this.price = price;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CartItem [product=" + product + ", quantity=" + quantity + ", price=" + price + "]";
	}
	
	
}
