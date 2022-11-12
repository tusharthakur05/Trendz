package dao;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import myconnection.ConnectDB;

import model.Product;

public class ProductDAO {
	private static Connection con = null;
	private static Statement st = null;
    private static ResultSet rs = null;
	
	public static ArrayList<Product> getProductsByCategory(String name) {
	   ArrayList<Product> products = new ArrayList<>();
	   try {     
		   con = ConnectDB.getConnection();
	       if(con == null || name == null) {
	    	   return products;
	       }
	       String sql = "select * from products where categoryId = (select categoryId from categories where categoryName = '"+ name + "')";
	       st = con.prepareStatement(sql);
	       rs = st.executeQuery(sql);
	       while(rs.next()) {
	    	   Product prod = new Product();
	    	   prod.setBrand(rs.getString("productBrand"));
	    	   prod.setCategory(rs.getInt("categoryId"));
	    	   prod.setDescription(rs.getString("productDescription"));
	    	   prod.setName(rs.getString("productName"));
	    	   prod.setPrice(rs.getDouble("productPrice"));
	    	   prod.setProductId(rs.getInt("productId"));
	    	   prod.setProductImage(rs.getString("productImage"));
	    	   prod.setQuantity(rs.getInt("quantity"));
	    	   products.add(prod);
	       }
	       con.close();
       }
       catch(Exception e) {
           e.printStackTrace();
       }
	   return products;
    }
	
}
