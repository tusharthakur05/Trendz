package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import myconnection.ConnectDB;

public class CartDAO {
	private static Connection con = null;
	
	public static boolean addToCart(long productId, String email) {
		con = ConnectDB.getConnection();
		if(con == null || email == null) {
			return false;
		}
		try {
			String sql = "select id from users where email = '" + email + "'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			long customerId = 0;
			if(rs.next()) {
				customerId = rs.getLong(1);
			}
			else {
				return false;
			}
			sql = "select * from carts where productId = " + productId + " and customerId = " + customerId;
			rs = st.executeQuery(sql);
			if(rs.next()) {
				return true;
			}
			sql = "insert into carts (productId, customerId) values (?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, productId);
			ps.setLong(2, customerId);
			return (!ps.execute());		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	
}
