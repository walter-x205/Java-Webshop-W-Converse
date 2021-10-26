package com.wshop.converse.db_connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wshop.converse.db_connect.homepage.Payment;
import com.wshop.converse.dto.AddItemModel;

public class Admin_DAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ArrayList<Admin> getAllAdmin() {
		ArrayList<Admin> aList = new ArrayList<Admin>();
		String query = "SELECT * FROM webshop_db.tbl_admin;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				aList.add(new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return aList;

	}
	
	public ArrayList<User> getAllUser() {
		ArrayList<User> uList = new ArrayList<User>();
		String query = "SELECT * FROM webshop_db.tbl_user;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				uList.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return uList;

	}
	
	public void addUser(User user) {
		String query = "INSERT INTO `webshop_db`.`tbl_user` (`name`, `username`, `password`, `email`, `phone`) VALUES (?, ?, ?, ?, ?);";
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
	
	public User getUserById(String p) {
		String query = "SELECT * FROM webshop_db.tbl_user WHERE id=?;";
		User d = null;
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, p);
			rs = ps.executeQuery();
			while (rs.next()) {
				d = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
		return d;
	}
	
	public void editUser(User user) {
		String query = "UPDATE `webshop_db`.`tbl_user` SET `name` = ?,`username` = ?, `password` = ?, `email` = ?, `phone` = ? WHERE (`id` = ?);";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPhone());
			ps.setInt(6, user.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void deleteUser(String p) {
		String query = "DELETE FROM `webshop_db`.`tbl_user` WHERE id=?;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, p);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
	}
	
	public void addAdmin(Admin admin) {
		String query = "INSERT INTO `webshop_db`.`tbl_admin` (`avatar`, `name`, `username`, `password`, `email`, `phone`, `owner`) VALUES (?, ?, ?, ?, ?, ?, ?);";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, admin.getAvatar());
			ps.setString(2, admin.getName());
			ps.setString(3, admin.getUsername());
			ps.setString(4, admin.getPassword());
			ps.setString(5, admin.getEmail());
			ps.setString(6, admin.getPhone());
			ps.setInt(7, admin.getOwner());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public ArrayList<Payment> getPaymentByTime(String start, String end) {
		String query = "SELECT * FROM webshop_db.tbl_transaction where created_date between ? and ? and status=1;";
		ArrayList<Payment> p = new ArrayList<Payment>();
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, start);
			ps.setString(2, end);
			rs = ps.executeQuery();
			while (rs.next()) {
				p.add(new Payment(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getDate(10)));
			}
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
		return p;
	}
}
