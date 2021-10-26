package com.wshop.converse.db_connect;

import java.text.DecimalFormat;

public class Product {
	private int id;
	private String name;
	private String sku;
	private String imgIcon;
	private String material;
	private String category;
	private int price;
	private int number;
	private int status;
	
	
	public Product() {
		super();
	}


	public Product(int id, String name, String sku, String imgIcon, String material, String category, int price,
			int number, int status) {
		super();
		this.id = id;
		this.name = name;
		this.sku = sku;
		this.imgIcon = imgIcon;
		this.material = material;
		this.category = category;
		this.price = price;
		this.number = number;
		this.status = status;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSku() {
		return sku;
	}


	public void setSku(String sku) {
		this.sku = sku;
	}


	public String getImgIcon() {
		return imgIcon;
	}


	public void setImgIcon(String imgIcon) {
		this.imgIcon = imgIcon;
	}


	public String getMaterial() {
		return material;
	}


	public void setMaterial(String material) {
		this.material = material;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getNumber() {
		return number;
	}


	public void setNumber(int number) {
		this.number = number;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}

	public static String currencyFormat(int numb) {
		DecimalFormat format = new DecimalFormat("###,###,###");
		String currency = format.format(numb);
		return currency;
	}
	
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", sku=" + sku + ", imgIcon=" + imgIcon + ", material="
				+ material + ", category=" + category + ", price=" + price + ", number=" + number + ", status=" + status
				+ "]";
	}
	
	
}
