package com.wshop.converse.db_connect.homepage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.wshop.converse.db_connect.DBUtil;
import com.wshop.converse.db_connect.Product;
import com.wshop.converse.dto.AddItemModel;

public class HomeProductDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public ArrayList<Product> getProductByCategory(String p) {
		ArrayList<Product> pList = new ArrayList<Product>();
		String query = "SELECT * FROM webshop_db.tbl_product \r\n" + "where category=?\r\n" + "order by id desc;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, p);
			rs = ps.executeQuery();
			while (rs.next()) {
				pList.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6),
						rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return pList;

	}

	public ArrayList<Product> getRandProductByCategory(String p) {
		ArrayList<Product> pList = new ArrayList<Product>();
		String query = "SELECT * FROM webshop_db.tbl_product\r\n" + "where category = ?\r\n" + "order by rand()\r\n"
				+ "limit 4;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, p);
			rs = ps.executeQuery();
			while (rs.next()) {
				pList.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6),
						rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return pList;

	}

	public void addPayment(Payment payment) {
		String query = "INSERT INTO `webshop_db`.`tbl_transaction` (`id`, `user_id`, `amount`, `payment`, `payment_name`, `payment_address`, `payment_phone`, `created_date`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, payment.getId());
			ps.setInt(2, payment.getCustomerId());
			ps.setInt(3, payment.getAmount());
			ps.setString(4, payment.getPayment());
			ps.setString(5, payment.getPaymentName());
			ps.setString(6, payment.getPaymentAddress());
			ps.setString(7, payment.getPaymentPhone());
			ps.setDate(8, new Date(payment.getCreatedDate().getTime()));
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<Payment> getAllPayment() {
		String query = "SELECT * FROM webshop_db.tbl_transaction;";
		ArrayList<Payment> p = new ArrayList<Payment>();
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
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
	
	public ArrayList<Payment> getAllPaymentToday() {
		String query = "SELECT * FROM webshop_db.tbl_transaction where created_date = curdate();";
		ArrayList<Payment> p = new ArrayList<Payment>();
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
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
	
	public ArrayList<Payment> getAllPaymentThisMonth() {
		String query = "SELECT * FROM webshop_db.tbl_transaction where month(created_date) = month(curdate());";
		ArrayList<Payment> p = new ArrayList<Payment>();
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
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
	
	public Payment getPayment() {
		String query = "SELECT * FROM webshop_db.tbl_transaction \r\n" + "ORDER BY id DESC\r\n" + "LIMIT 1;";
		Payment p = null;
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				p = new Payment(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getDate(10));
			}
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
		return p;
	}
	
	public Payment getPaymentByID(String pID) {
		String query = "SELECT * FROM webshop_db.tbl_transaction where id = ?;";
		Payment p = null;
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, pID);
			rs = ps.executeQuery();
			while (rs.next()) {
				p = new Payment(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getDate(10));
			}
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
		return p;
	}
	
	public void addOrders(ArrayList<Orders> o) {
		String query = "INSERT INTO `webshop_db`.`tbl_order` (`transaction_id`, `product_id`, `qty`, `amount`) VALUES (?, ?, ?, ?);";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			for (Orders od : o) {
				ps.setString(1, od.getPaymentId());
				ps.setInt(2, od.getProductId());
				ps.setInt(3, od.getQty());
				ps.setInt(4, od.getAmount());
				ps.executeUpdate();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public ArrayList<Orders> getOrdersByPid(String pId) {
		ArrayList<Orders> od = new ArrayList<Orders>();
		String query = "SELECT * FROM webshop_db.tbl_order where transaction_id = ?;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, pId);
			rs = ps.executeQuery();
			while (rs.next()) {
				od.add(new Orders(rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5)));
			}
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
		return od;
	}
	
	public void changeStatus(String pId) {
		String query = "UPDATE `webshop_db`.`tbl_transaction` SET `status` = '1' WHERE (`id` = ?);";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, pId);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
	}
	
	public void deletePayment(String pId) {
		String query = "DELETE FROM `webshop_db`.`tbl_transaction` WHERE (`id` = ?);";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, pId);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
	}
	
	public int getPaymentNumberToday() {
		String query = "SELECT count(*) FROM webshop_db.tbl_transaction where created_date = curdate();";
		int num = 0;
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
		return num;
	}
	
	public int getPaymentShippingNumberToday() {
		String query = "SELECT count(*) FROM webshop_db.tbl_transaction where created_date = curdate() and status = 0;";
		int num = 0;
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
		return num;
	}
	
	public int getPaymentShippedNumberToday() {
		String query = "SELECT count(*) FROM webshop_db.tbl_transaction where created_date = curdate() and status = 1;";
		int num = 0;
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
		return num;
	}
	
	public void name() {
		
	}
}
