package com.wshop.converse.db_connect;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {
    private static Connection connection;
    private static String url = "jdbc:mysql://127.0.0.1:3306/";
    private static String user = "root";
    private static String password = "NgocThuy1997";

    public static Connection getConnection() throws SQLException {
        connection = DriverManager.getConnection(url, user, password);
        return connection;
    }

    public static Connection getConnection(String dbConfigFile) throws SQLException {
        try (FileInputStream f = new FileInputStream(dbConfigFile)) {
            // load the properties file
            Properties pros = new Properties();
            pros.load(f);
            // assign db parameters
            url = pros.getProperty("url");
            user = pros.getProperty("user");
            password = pros.getProperty("password");
            // create a connection to the database
            return getConnection();
        } catch (IOException e) {
            return null;
        }
    }
    public static void main(String[] args) {
		try {
			System.out.println(new DBUtil().getConnection());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
