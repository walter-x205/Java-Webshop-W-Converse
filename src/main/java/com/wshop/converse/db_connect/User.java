package com.wshop.converse.db_connect;

public class User {
	private int id;
	private String avatar;
	private String name;
	private String username;
	private String password;
	private String email;
	private String phone;
	public User() {
		super();
	}
	public User(int id, String avatar,String name, String username, String password, String email, String phone) {
		super();
		this.id = id;
		this.avatar = avatar;
		this.name = name;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", username=" + username + ", password=" + password + ", email="
				+ email + ", phone=" + phone + "]";
	}
	
	
}
