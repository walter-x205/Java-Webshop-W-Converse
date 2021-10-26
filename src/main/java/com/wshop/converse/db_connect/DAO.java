package com.wshop.converse.db_connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wshop.converse.dto.AddItemModel;

public class DAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public ArrayList<Product> getAllProduct() {
		ArrayList<Product> pList = new ArrayList<Product>();
		String query = "SELECT * FROM webshop_db.tbl_product;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
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

	public void addProduct(AddItemModel addModel) {
		String query = "INSERT INTO `webshop_db`.`tbl_product` (`name`, `sku`, `img_icon`, `material`, `category`, `price`, `number`) VALUES (?, ?, ?, ?, ?, ?, ?);";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, addModel.getName());
			ps.setString(2, addModel.getSku());
			ps.setString(3, addModel.getImgIcon());
			ps.setString(4, addModel.getMaterial());
			ps.setString(5, addModel.getCategory());
			ps.setString(6, addModel.getPrice());
			ps.setInt(7, addModel.getNumber());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public Product getProductId(int p) {
		String query = "SELECT * FROM webshop_db.tbl_product WHERE id=?;";
		Product d = null;
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, p);
			rs = ps.executeQuery();
			while (rs.next()) {
				d = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6),
						rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10));
			}
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
		return d;
	}
	
	public void editProduct(Product addModel) {
		String query = "UPDATE `webshop_db`.`tbl_product` SET `name` = ?, `sku` = ?, `img_icon` = ?, `material` = ?, `category` = ?, `price` = ?, `number` = ? WHERE (`id` = ?);";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, addModel.getName());
			ps.setString(2, addModel.getSku());
			ps.setString(3, addModel.getImgIcon());
			ps.setString(4, addModel.getMaterial());
			ps.setString(5, addModel.getCategory());
			ps.setInt(6, addModel.getPrice());
			ps.setInt(7, addModel.getNumber());
			ps.setInt(8, addModel.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void deleteProduct(String p) {
		String query = "DELETE FROM `webshop_db`.`tbl_product` WHERE id=?;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, p);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
	}
	
	public ArrayList<Product> searchResult(String text) {
		ArrayList<Product> sList = new ArrayList<Product>();
		String query = "SELECT * FROM webshop_db.tbl_product WHERE `name` like ?;";
		try {
			conn = new DBUtil().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%"+text+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
				sList.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6),
						rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10)));
			}
		} catch (Exception e) {
			System.out.println("Lam sai roi");
		}
		return sList;
	}
//	public static void main(String[] args) {
//		DAO dao = new DAO();
//		ArrayList<Product> list = dao.getAllProduct();
//		for (Product o : list) {
//			System.out.println(o);
//		}
//	}
}
