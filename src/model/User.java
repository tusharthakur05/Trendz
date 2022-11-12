package model;

public class User {
    private String name, email, pass, address, state, dist, type;
    private long mobile;
    
    public User() {
    	name = email = pass = address = state = dist = null;
    	mobile = 0;
    	type="U";
    }
    
	public String getName() {
		return name;
	}
        
	public void setName(String name) {
		this.name = name;
	}
        
	public String getEmail() {
		return email;
	}
        
	public void setEmail(String email) {
		this.email = email;
	}
        
	public String getPass() {
		return pass;
	}
        
	public void setPass(String pass) {
		this.pass = pass;
	}
        
	public String getAddress() {
		return address;
	}
        
	public void setAddress(String address) {
		this.address = address;
	}
        
	public long getMobile() {
		return mobile;
	}
        
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	
	public String getState() {
		return state;
	}
        
	public void setState(String state) {
		this.state = state;
	}
	
	public String getDistrict() {
		return dist;
	}
        
	public void setDistrict(String dist) {
		this.dist = dist;
	}
	
	public String getType() {
		return this.type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
}
