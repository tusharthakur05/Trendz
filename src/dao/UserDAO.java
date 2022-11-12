package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import myconnection.ConnectDB;

public class UserDAO {
    private static Connection con = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    private static String hashPassword(String password, int key) {
    	if(password == null) {
    		return null;
    	}
    	if(key <= 0) {
    		key = (int)((Math.random() * 100) % 99) + 1;
    	}
    	char hashedPassword[] = new char[51];
    	int len = password.length();
    	if(len <= 5 || len > 24) {
    		return null;
    	}
    	hashedPassword[0] = (char)(((key % 10) * 9) + 41); 
    	int index = 0, itr = 0;
    	while(index < len) {
    		int num = ((((int)password.charAt(index) * key) + (++itr)) % 93) + 33;
    		hashedPassword[itr] = (char)num;
    		num = ((((int)password.charAt(index) * key) + (++itr)) % 74) + 48;
    		hashedPassword[itr] = (char)num;
    		index++;
    	}
    	hashedPassword[itr+1] = (char)(((key / 10) * 9) + 41);
    	hashedPassword[itr+2] = (char)0;
    	len = (len * 2) + 2;
    	itr = 0;
    	for(index = len - 1; itr < len/2; itr++, index--) {
    		char temp = hashedPassword[index];
    		hashedPassword[index] = hashedPassword[itr];
    		hashedPassword[itr] = temp;
    	}
    	return ((new String(hashedPassword, 0, len)));
    }
    
    public static boolean verifyPassword(String pass, String hashPass) {
    	if(pass == null || hashPass == null) {
    		
    	}
    	int key = 0;
    	int len = hashPass.length();
    	key = ((int)(hashPass.charAt(0)) - 41) / 9;
    	key = key * 10 + (((int)(hashPass.charAt(len - 1)) - 41) / 9);
    	pass = hashPassword(pass, key);
    	if(pass.contentEquals(hashPass)) {
    		return true;
    	}
    	return false;
    }
    
    public static boolean newUser(User user) {
    	String query = null;
        boolean status = false;
        con = ConnectDB.getConnection();
        if(con == null || user == null) {
        	return status;
        }
        
        query = "insert into users(`username`, `email`, `password`, `mobile`, `address`, `state`, `dist`, `type`) values(?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(query);
            String name = user.getName();
            String email = user.getEmail().toLowerCase();
            String pass = hashPassword(user.getPass(), 0);
            String address = user.getAddress();
            String state = user.getState();
            String dist = user.getDistrict();
            Long mobile = user.getMobile();
            String type = "U";
            
            if(name == null || email == null || pass == null || address == null || state == null || dist == null || type == null) {
            	return status;
            }
                        
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setLong(4, mobile);
            ps.setString(5, address);
            ps.setString(6, state);
            ps.setString(7, dist);
            ps.setString(8, type);
            
            int result = ps.executeUpdate();
            if(result > 0) {
                status = true;
            }
        }
        catch(SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
    
    
    public static User getUserDetails(String email,String pass) {              
        try {     
        	User user = null;
        	con = ConnectDB.getConnection();
            if(con == null || email == null || pass == null) {
            	return user;
            }
            String sql = "select * from users where email=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email.toLowerCase());
            rs = ps.executeQuery();
            String hashPass = "";
            String name = "";
            String address = "";
            long mobile = 0;
            
            if(rs.next()) {
            	hashPass = rs.getString("password");
            	name = rs.getString("username");
            	address = rs.getString("address");
            	mobile = rs.getLong("mobile");
            	
            }
            else {
            	return user;
            }
            if(verifyPassword(pass, hashPass)) {
            	user = new User();
                user.setName(name);
                user.setEmail(email);
                user.setAddress(address);
                user.setMobile(mobile);
            }
            return user;
        }
        catch(Exception e) {
            e.printStackTrace();
        }    
        return null;
   }
    
   public static boolean updatePassword(String email, String password, String cpassword) {
	   
	   boolean status = false; 
	   
	   try {     
		   con = ConnectDB.getConnection();
	       if(con == null || password == null || cpassword == null) {
	    	   return status;
	       }
	       if(!password.equals(cpassword)) {
	    	   con.close();
	    	   return status;
	       }
	       String sql = "select * from users where email=?";
	       ps = con.prepareStatement(sql);
	       ps.setString(1, email.toLowerCase());
	       rs = ps.executeQuery();
	       if(rs.next()) {
	    	   sql = "update users set password=? where email=?";
	    	   ps = con.prepareStatement(sql);
	    	   password = hashPassword(password, 0);
	    	   ps.setString(1, password);
	    	   ps.setString(2, email);
	    	   if(ps.executeUpdate() > 0) {
	    		   status = true;
	    	   }
	       }
	       else {
	    	   return status;
	       }
       }
       catch(Exception e) {
           e.printStackTrace();
       }
	   return status;
   }
}
