package myconnection;

import java.sql.*;

public class ConnectDB {
    
    public static Connection getConnection() {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection con = null;     
        try {
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendz", "root", "");
        }
        catch(SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
