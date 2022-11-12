package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import myconnection.ConnectDB;

public class CategoryDAO {
	private static Connection con = null;
    private static ResultSet rs = null;
	
	public static ArrayList<String> getAllCategories() {
		   ArrayList<String> categoryNames = new ArrayList<>();
		   try {     
			   con = ConnectDB.getConnection();
		       if(con == null) {
		    	   return categoryNames;
		       }
		       String sql = "select categoryName from categories";
		       Statement st = con.createStatement();
		       rs = st.executeQuery(sql);
		       while(rs.next()) {
		    	   categoryNames.add(rs.getString(1));
		       }
	       }
	       catch(Exception e) {
	           e.printStackTrace();
	       }
		   return categoryNames;
	   }
}
