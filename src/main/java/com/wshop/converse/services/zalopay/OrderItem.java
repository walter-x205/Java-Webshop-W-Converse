package com.wshop.converse.services.zalopay;

import java.util.HashMap;
import java.util.Map;

public class OrderItem {
	private String idString;
	private String nameString;
	private long price;
	private int quantity;
	
	
	public OrderItem(String idString, String nameString, long price, int quantity) {
		super();
		this.idString = idString;
		this.nameString = nameString;
		this.price = price;
		this.quantity = quantity;
	}

	public String getIdString() {
		return idString;
	}

	public void setIdString(String idString) {
		this.idString = idString;
	}

	public String getNameString() {
		return nameString;
	}

	public void setNameString(String nameString) {
		this.nameString = nameString;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public HashMap toMap() {
		return new HashMap(){{
            put("itemid", idString);
            put("itemname", nameString);
            put("itemprice", price);
            put("itemquantity", quantity);
        }};
	}
	
	public static HashMap[] toMapArray(OrderItem[] items) {
		HashMap[] maps = new HashMap[items.length];
		
		for (int i =0; i < items.length; i++) {
			maps[i] = items[i].toMap();
		}
		
		return maps;
	}
	
}
