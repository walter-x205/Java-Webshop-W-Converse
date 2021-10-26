package com.wshop.converse.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.wshop.converse.db_connect.Admin;
import com.wshop.converse.db_connect.DBUtil;
import com.wshop.converse.db_connect.User;

public class Login_DAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public User userSignIn(String user, String pass) {
		User login = null;
		String query ="SELECT * FROM webshop_db.tbl_user where `username`=? and `password`=?;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			while (rs.next()) {
				login = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return login;
	}
	
	public User checkUser(String username) {
		User signUp = null;
		String query ="SELECT * FROM webshop_db.tbl_user where `username`=?";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				signUp = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return signUp;
	}
	
	public void addUser(User user) {
		String query ="INSERT INTO `webshop_db`.`tbl_user` (`name`, `username`, `password`, `email`, `phone`) VALUES (?, ?, ?, ?, ?);";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPhone());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public Admin adminSignIn(String user, String pass) {
		Admin login = null;
		String query ="SELECT * FROM webshop_db.tbl_admin where `username`=? and `password`=?;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			while (rs.next()) {
				login = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return login;
	}
}
