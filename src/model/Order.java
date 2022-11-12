package model;
import java.time.LocalDateTime;

public class Order {
	private String email;
	private long orderId, productId;
	private double amount;
	private LocalDateTime  orderDate;
	
	public Order() {
		email = null;
		orderId = productId = 0;
		amount = 0;
		orderDate = LocalDateTime.now();
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public long getOrderId() {
		return orderId;
	}
	
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	
	public long getProductId() {
		return productId;
	}
	
	public void setProductId(long productId) {
		this.productId = productId;
	}
	
	public double getAmount() {
		return amount;
	}
	
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public LocalDateTime getOrderDate() {
		return orderDate;
	}
	
	public void setOrderDate(LocalDateTime orderDate) {
		this.orderDate = orderDate;
	}
	
}
